# 13-Matriz-Trazabilidad.md

# Matriz de Trazabilidad Funcional

## 1. Objetivo

La matriz de trazabilidad permite relacionar todos los elementos funcionales del sistema AUNADOS.

Su propósito es garantizar que:

- Todo requerimiento tenga cobertura funcional.
- Toda regla de negocio tenga validación.
- Todo caso de uso tenga pruebas asociadas.
- Todo escenario Gherkin tenga origen funcional.
- Toda funcionalidad sea verificable durante QA y UAT.

---

# 2. Alcance

La trazabilidad cubre:

- Contexto General.
- Admisión.
- Protocolo.
- Facturación.
- Roles.
- Lista de Encuentros.
- Filtros.
- Detalle del Encuentro.
- Estados.
- Exportaciones.
- Reglas de Negocio.
- Casos de Uso.
- Escenarios Gherkin.

---

# 3. Estructura de Trazabilidad

La relación estándar será:

Historia de Usuario
↓
Caso de Uso
↓
Regla de Negocio
↓
Escenario Gherkin
↓
Caso de Prueba
↓
Evidencia UAT

---

# 4. Trazabilidad General

| ID | Módulo | Caso de Uso | Reglas Asociadas | Gherkin |
|----|---------|------------|------------------|----------|
| TR-001 | Lista de Encuentros | CU01 | RN33-RN38 | Esc. 01-03 |
| TR-002 | Búsqueda | CU02 | RN39-RN42 | Esc. 04-07 |
| TR-003 | Filtros | CU03-CU04 | RN43-RN53 | Esc. 08-18 |
| TR-004 | Restablecer Vista | CU05 | RN47 | Escenario específico |
| TR-005 | Ordenamiento | CU06 | RN54-RN57 | Escenario específico |
| TR-006 | Detalle del Encuentro | CU07 | RN58-RN61 | Esc. 19-20 |
| TR-007 | Estados | CU08 | RN62-RN67 | Esc. 21-25 |
| TR-008 | Exportación Inmediata | CU09 | RN68-RN72 | Esc. 26 |
| TR-009 | Exportación Asíncrona | CU10-CU11 | RN73-RN75 | Esc. 27-28 |
| TR-010 | Seguridad | CU01-CU07 | RN81-RN84 | Esc. 29-30 |
| TR-011 | Job de Admisión | CU01 | RN06-RN27 | Esc. 31-33 |

---

# 5. Trazabilidad por Módulo

## 5.1 Contexto General

| Elemento | Referencia |
|-----------|------------|
| Documento | 00-Contexto-General.md |
| Reglas | RN01-RN10 |
| Casos de Uso | Todos |
| Escenarios | Todos |

---

## 5.2 Admisión

| Elemento | Referencia |
|-----------|------------|
| Documento | 01-Admision.md |
| Reglas | RN11-RN15 |
| Casos de Uso | CU01-CU15 |
| Escenarios | Esc. 01-33 |

---

## 5.3 Protocolo

| Elemento | Referencia |
|-----------|------------|
| Documento | 02-Protocolo.md |
| Reglas | RN16-RN21 |
| Casos de Uso | Clasificación automática |
| Escenarios | Esc. 32 |

---

## 5.4 Facturación

| Elemento | Referencia |
|-----------|------------|
| Documento | 03-Facturacion.md |
| Reglas | RN22-RN27 |
| Casos de Uso | Clasificación automática |
| Escenarios | Esc. 33 |

---

# 6. Matriz de Roles

| Funcionalidad | Superusuario | Gestor A | Ejecutivo |
|--------------|-------------|-----------|-----------|
| Ver Lista | Sí | Sí | Sí |
| Ver Todos los Encuentros | Sí | Sí | No |
| Ver Encuentros Propios | Sí | Sí | Sí |
| Filtrar por Sede | Sí | Sí | No |
| Filtrar por Usuario | Sí | Sí | No |
| Ordenar | Sí | Sí | No |
| Exportación Inmediata | Sí | Sí | No |
| Exportación Asíncrona | No | No | Sí |
| No Facturable | Sí | Sí | No |
| Error de Facturación | Sí | Sí | No |

---

# 7. Trazabilidad de Estados

| Estado | Documento | Caso de Uso | Regla |
|----------|------------|-------------|--------|
| Pendiente | Estados | CU08 | RN62 |
| Pago por Adelantado | Estados | CU08 | RN62 |
| No Facturable | Estados | CU14 | RN64 |
| Error de Facturación | Estados | CU15 | RN65 |
| Tramitado | Estados | CU08 | RN63 |
| En Proceso | Estados | CU08 | RN63 |

---

# 8. Trazabilidad de Exportaciones

| Funcionalidad | Caso de Uso | Regla |
|--------------|-------------|--------|
| Descarga Inmediata | CU09 | RN71-RN72 |
| Exportación Asíncrona | CU10 | RN73 |
| Notificación | CU11 | RN74 |
| Expiración | CU11 | RN75 |

---

# 9. Cobertura QA

## Objetivo

Asegurar que toda funcionalidad tenga pruebas asociadas.

---

## Cobertura Mínima Esperada

| Tipo | Cobertura |
|--------|-----------|
| Reglas de Negocio | 100% |
| Casos de Uso | 100% |
| Escenarios Gherkin | 100% |
| Permisos | 100% |
| Estados | 100% |
| Exportaciones | 100% |

---

# 10. Cobertura UAT

## Objetivo

Validar que el comportamiento esperado sea aceptado por el negocio.

---

## Alcance

- Flujo de Admisión.
- Flujo de Protocolo.
- Flujo de Facturación.
- Estados.
- Exportaciones.
- Seguridad.

---

# 11. Auditoría

Toda evidencia de prueba deberá mantener relación con:

- Historia de Usuario.
- Caso de Uso.
- Regla de Negocio.
- Escenario Gherkin.
- Resultado de Prueba.

---

# 12. Gestión de Cambios

Toda nueva funcionalidad deberá:

1. Crear o actualizar Caso de Uso.
2. Crear o actualizar Regla de Negocio.
3. Crear o actualizar Escenario Gherkin.
4. Actualizar esta matriz de trazabilidad.

---

# 13. Indicadores de Calidad

## KPI-01

Cobertura de Casos de Uso.

Objetivo:

100%.

---

## KPI-02

Cobertura de Reglas de Negocio.

Objetivo:

100%.

---

## KPI-03

Cobertura de Escenarios Gherkin.

Objetivo:

100%.

---

## KPI-04

Cobertura de Permisos.

Objetivo:

100%.

---

# 14. Fuente de Verdad

La Matriz de Trazabilidad constituye el documento oficial para verificar que todos los requerimientos funcionales del sistema AUNADOS cuentan con cobertura documental, cobertura de pruebas y validación de negocio.
