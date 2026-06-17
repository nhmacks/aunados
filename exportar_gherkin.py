#!/usr/bin/env python3
"""
Exporta escenarios Gherkin (.feature) a Excel.
Uso: python3 exportar_gherkin.py [directorio_gherkin] [salida.xlsx]
"""

import os
import re
import sys
from dataclasses import dataclass, field

import openpyxl
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.utils import get_column_letter

HEADERS = [
    "SCENARIO",
    "EXAMPLE",
    "PATH",
    "FEATURE NAME",
    "BACKGROUND /\nPRECONDICIÓN",
    "SCENARIO NAME",
    "STEPS",
    "DATA DE PRUEBA",
    "HISTORIA/TAREA",
    "PLATAFORMA",
    "CRITICIDAD",
    "ESTADO DE EJECUCIÓN",
    "EJECUTADO POR",
    "FECHA DE EJECUCIÓN",
    "BUGS (LINK)",
]

STEP_KEYWORDS = (
    "Dado ", "Cuando ", "Entonces ", "Y ", "Pero ",
    "Given ", "When ", "Then ", "And ", "But ", "* ",
)

SCENARIO_PREFIXES = ("Escenario:", "Scenario:")
OUTLINE_PREFIXES = ("Esquema del escenario:", "Scenario Outline:", "Esquema de escenario:")
FEATURE_PREFIXES = ("Característica:", "Feature:")
BACKGROUND_PREFIXES = ("Antecedentes:", "Antecedente:", "Background:")
EXAMPLES_PREFIXES = ("Ejemplos:", "Examples:")


@dataclass
class Scenario:
    name: str
    tags: list = field(default_factory=list)
    steps: list = field(default_factory=list)
    is_outline: bool = False
    examples_headers: list = field(default_factory=list)
    examples_rows: list = field(default_factory=list)
    background_steps: list = field(default_factory=list)
    feature_name: str = ""
    filepath: str = ""


def _strip_prefix(text: str, prefixes: tuple) -> str:
    for p in prefixes:
        if text.startswith(p):
            return text[len(p):].strip()
    return text


def _parse_table_row(line: str) -> list:
    return [c.strip() for c in line.strip().strip("|").split("|")]


def parse_feature(filepath: str, rel_path: str = "") -> list[Scenario]:
    with open(filepath, encoding="utf-8") as f:
        lines = f.readlines()

    feature_name = ""
    background_steps: list[str] = []
    scenarios: list[Scenario] = []

    pending_tags: list[str] = []
    current: Scenario | None = None
    in_background = False
    in_examples = False
    examples_header_set = False

    for line in lines:
        stripped = line.strip()

        if not stripped or stripped.startswith("#"):
            continue

        # Tags
        if stripped.startswith("@"):
            pending_tags = re.findall(r"@[\w]+", stripped)
            continue

        # Feature
        if any(stripped.startswith(p) for p in FEATURE_PREFIXES):
            feature_name = _strip_prefix(stripped, FEATURE_PREFIXES)
            pending_tags = []
            continue

        # Background
        if any(stripped.startswith(p) for p in BACKGROUND_PREFIXES):
            in_background = True
            in_examples = False
            current = None
            pending_tags = []
            continue

        # Scenario
        if any(stripped.startswith(p) for p in SCENARIO_PREFIXES):
            if current:
                scenarios.append(current)
            current = Scenario(
                name=_strip_prefix(stripped, SCENARIO_PREFIXES),
                tags=pending_tags[:],
                feature_name=feature_name,
                filepath=rel_path,
            )
            pending_tags = []
            in_background = False
            in_examples = False
            continue

        # Scenario Outline
        if any(stripped.startswith(p) for p in OUTLINE_PREFIXES):
            if current:
                scenarios.append(current)
            current = Scenario(
                name=_strip_prefix(stripped, OUTLINE_PREFIXES),
                tags=pending_tags[:],
                is_outline=True,
                feature_name=feature_name,
                filepath=rel_path,
            )
            pending_tags = []
            in_background = False
            in_examples = False
            continue

        # Examples
        if any(stripped.startswith(p) for p in EXAMPLES_PREFIXES):
            in_examples = True
            examples_header_set = False
            continue

        # Table rows
        if stripped.startswith("|"):
            cols = _parse_table_row(stripped)
            if in_examples and current:
                if not examples_header_set:
                    current.examples_headers = cols
                    examples_header_set = True
                else:
                    current.examples_rows.append(cols)
            elif in_background:
                background_steps.append(stripped)
            elif current and not in_examples:
                # Data table attached to last step
                if current.steps:
                    current.steps[-1] += "\n      " + stripped
            continue

        # Steps
        if any(stripped.startswith(kw) for kw in STEP_KEYWORDS):
            if in_background:
                background_steps.append(stripped)
            elif current and not in_examples:
                current.steps.append(stripped)
            continue

        # Docstrings
        if stripped.startswith('"""') or stripped.startswith("'''"):
            continue

    if current:
        scenarios.append(current)

    for s in scenarios:
        s.background_steps = background_steps[:]

    return scenarios


def collect_rows(gherkin_dir: str) -> list[dict]:
    base = os.path.abspath(gherkin_dir)
    feature_files = sorted(
        os.path.join(root, f)
        for root, _, files in os.walk(gherkin_dir)
        for f in files
        if f.endswith(".feature")
    )

    rows = []
    scenario_counter = 0

    for filepath in feature_files:
        rel_path = os.path.relpath(filepath, os.path.dirname(base))
        for scenario in parse_feature(filepath, rel_path):
            scenario_counter += 1

            base_row = {
                "n": scenario_counter,
                "path": scenario.filepath,
                "feature": scenario.feature_name,
                "background": "\n".join(scenario.background_steps),
                "name": scenario.name,
                "steps": "\n".join(scenario.steps),
                "tags": scenario.tags,
            }

            if scenario.is_outline and scenario.examples_rows:
                for ex_i, ex_row in enumerate(scenario.examples_rows, start=1):
                    pairs = [
                        f"{h}: {v}"
                        for h, v in zip(scenario.examples_headers, ex_row)
                    ]
                    rows.append({**base_row, "ex": ex_i, "data": "\n".join(pairs)})
            else:
                rows.append({**base_row, "ex": "", "data": ""})

    return rows


def _criticidad(tags: list[str]) -> str:
    if "@happyPath" in tags:
        return "Happy Path"
    if "@unhappyPath" in tags:
        return "Unhappy Path"
    return ""


def write_excel(rows: list[dict], output_path: str):
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "Escenarios"

    header_fill = PatternFill(start_color="1F4E79", end_color="1F4E79", fill_type="solid")
    header_font = Font(color="FFFFFF", bold=True, size=10)
    header_align = Alignment(horizontal="center", vertical="center", wrap_text=True)

    for col, h in enumerate(HEADERS, 1):
        cell = ws.cell(row=1, column=col, value=h)
        cell.fill = header_fill
        cell.font = header_font
        cell.alignment = header_align
    ws.row_dimensions[1].height = 42

    fill_even = PatternFill(start_color="DCE6F1", end_color="DCE6F1", fill_type="solid")
    fill_odd = PatternFill(start_color="FFFFFF", end_color="FFFFFF", fill_type="solid")
    cell_align = Alignment(vertical="top", wrap_text=True)
    cell_font = Font(size=9)

    for i, row in enumerate(rows, start=2):
        fill = fill_even if i % 2 == 0 else fill_odd
        values = [
            row["n"],
            row["ex"],
            row["path"],
            row["feature"],
            row["background"],
            row["name"],
            row["steps"],
            row["data"],
            "",   # HISTORIA/TAREA
            "",   # PLATAFORMA
            _criticidad(row["tags"]),
            "",   # ESTADO DE EJECUCIÓN
            "",   # EJECUTADO POR
            "",   # FECHA DE EJECUCIÓN
            "",   # BUGS (LINK)
        ]
        for col, val in enumerate(values, 1):
            cell = ws.cell(row=i, column=col, value=val)
            cell.fill = fill
            cell.alignment = cell_align
            cell.font = cell_font

        # Row height based on longest cell content
        max_lines = max(
            (str(v).count("\n") + 1 for v in values if v),
            default=1,
        )
        ws.row_dimensions[i].height = max(15, min(max_lines * 14, 250))

    col_widths = [10, 10, 40, 30, 35, 45, 50, 35, 20, 15, 15, 20, 20, 20, 20]
    for col, width in enumerate(col_widths, 1):
        ws.column_dimensions[get_column_letter(col)].width = width

    ws.freeze_panes = "A2"
    wb.save(output_path)
    print(f"Exportado: {output_path}  ({len(rows)} filas)")


def main():
    gherkin_dir = sys.argv[1] if len(sys.argv) > 1 else "gherkin"
    output_path = sys.argv[2] if len(sys.argv) > 2 else "escenarios.xlsx"

    if not os.path.isdir(gherkin_dir):
        print(f"Error: directorio '{gherkin_dir}' no encontrado")
        sys.exit(1)

    print(f"Escaneando: {gherkin_dir}")
    rows = collect_rows(gherkin_dir)
    print(f"Escenarios encontrados: {len(rows)}")
    write_excel(rows, output_path)


if __name__ == "__main__":
    main()
