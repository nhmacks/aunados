# Exportar Escenarios Gherkin a Excel

Genera un archivo Excel con todos los escenarios definidos en los archivos `.feature` del proyecto.

## Requisitos

- Python 3.10+
- `openpyxl` instalado (`pip install openpyxl`)

## Uso

```bash
python3 exportar_gherkin.py [directorio_gherkin] [archivo_salida.xlsx]
```

### Ejemplos

```bash
# Exporta todos los features del directorio gherkin/ a escenarios.xlsx (por defecto)
python3 exportar_gherkin.py

# Especificando directorio y archivo de salida
python3 exportar_gherkin.py gherkin escenarios.xlsx

# Solo un subdirectorio específico
python3 exportar_gherkin.py gherkin/admision admision.xlsx
```

## Columnas del Excel generado

| Columna | Descripción |
|---|---|
| SCENARIO | Número secuencial del escenario |
| EXAMPLE | Número de fila de ejemplo (solo en `Esquema del escenario`) |
| PATH | Ruta relativa del archivo `.feature` |
| FEATURE NAME | Nombre de la funcionalidad (`Característica:`) |
| BACKGROUND / PRECONDICIÓN | Pasos del bloque `Antecedentes:` si el feature lo tiene |
| SCENARIO NAME | Nombre del escenario |
| STEPS | Pasos del escenario |
| DATA DE PRUEBA | Datos de la tabla de ejemplos (clave: valor) |
| HISTORIA/TAREA | Para completar manualmente |
| PLATAFORMA | Para completar manualmente |
| CRITICIDAD | `Happy Path` o `Unhappy Path` según los tags `@happyPath` / `@unhappyPath` |
| ESTADO DE EJECUCIÓN | Para completar manualmente |
| EJECUTADO POR | Para completar manualmente |
| FECHA DE EJECUCIÓN | Para completar manualmente |
| BUGS (LINK) | Para completar manualmente |
