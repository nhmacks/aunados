# 11-Casos-Uso.md

# Casos de Uso del Sistema AUNADOS

## 1. Objetivo

Este documento describe los casos de uso funcionales asociados a la gestión de encuentros dentro del sistema AUNADOS.

Los casos de uso representan la interacción entre los usuarios y el sistema para cumplir los objetivos operativos definidos por el negocio.

---

# 2. Actores

## Actor 1: Superusuario de Admisión

Usuario con acceso completo a la bandeja de Admisión.

---

## Actor 2: Gestor de A

Usuario con los mismos permisos funcionales que el Superusuario.

---

## Actor 3: Ejecutivo de Admisión

Usuario con acceso restringido a los encuentros creados por él y pertenecientes a su sede.

---

# CU01 – Visualizar Lista de Encuentros

## Objetivo

Permitir al usuario visualizar los encuentros clasificados para Admisión.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Precondiciones

- Usuario autenticado.
- Usuario con permisos válidos.

## Flujo Principal

1. Usuario inicia sesión.
2. Sistema valida credenciales.
3. Sistema carga Lista de Encuentros.
4. Sistema muestra los primeros 50 registros.
5. Sistema muestra el contador de resultados.

## Postcondiciones

La lista queda disponible para consulta.

---

# CU02 – Buscar Encuentros

## Objetivo

Permitir localizar encuentros mediante búsqueda general.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Criterios

- Nombre.
- Apellido.
- Número de Encuentro.

## Flujo Principal

1. Usuario ingresa texto.
2. Presiona Enter.
3. Sistema ejecuta búsqueda.
4. Sistema actualiza la grilla.
5. Sistema actualiza contador.

## Flujo Alterno

### Sin resultados

1. Sistema muestra mensaje informativo.
2. Sistema indica que no existen coincidencias.

---

# CU03 – Aplicar Filtros

## Objetivo

Permitir restringir resultados mediante filtros.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo (según permisos).

## Flujo Principal

1. Usuario selecciona un filtro.
2. Configura criterios.
3. Selecciona Aplicar.
4. Sistema procesa información.
5. Sistema actualiza resultados.

## Postcondición

La grilla muestra únicamente registros coincidentes.

---

# CU04 – Limpiar Filtro

## Objetivo

Eliminar un filtro específico.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Flujo Principal

1. Usuario abre filtro.
2. Selecciona Limpiar.
3. Sistema elimina criterio.
4. Sistema actualiza resultados.

---

# CU05 – Restablecer Vista

## Objetivo

Eliminar todos los filtros y búsquedas activas.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Flujo Principal

1. Usuario selecciona Restablecer Vista.
2. Sistema elimina filtros.
3. Sistema elimina búsquedas.
4. Sistema elimina ordenamientos.
5. Sistema restaura vista inicial.

---

# CU06 – Ordenar Resultados

## Objetivo

Permitir ordenar la información mostrada.

## Actor

- Superusuario
- Gestor de A

## Precondición

Columna ordenable.

## Flujo Principal

1. Usuario selecciona encabezado.
2. Sistema ordena ascendentemente.
3. Usuario selecciona nuevamente.
4. Sistema ordena descendentemente.

---

# CU07 – Visualizar Detalle del Encuentro

## Objetivo

Consultar toda la información asociada a un encuentro.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Flujo Principal

1. Usuario selecciona encuentro.
2. Sistema abre detalle.
3. Sistema muestra:
   - Datos del paciente.
   - Datos del encuentro.
   - Datos del seguro.
   - Sustentos pendientes.
   - Estado actual.

## Postcondición

El usuario visualiza información completa del encuentro.

---

# CU08 – Cambiar Estado del Encuentro

## Objetivo

Actualizar el estado operativo del encuentro.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Flujo Principal

1. Usuario abre detalle.
2. Selecciona estado.
3. Sistema muestra confirmación.
4. Usuario confirma.
5. Sistema registra el cambio.
6. Sistema retorna a Lista de Encuentros.

## Postcondición

Estado actualizado correctamente.

## Flujo Alterno

### Cancelación

1. Usuario selecciona Cancelar.
2. Sistema cierra modal.
3. Estado permanece igual.

---

# CU09 – Exportar Información (Inmediata)

## Objetivo

Descargar información visible en Excel.

## Actor

- Superusuario
- Gestor de A

## Flujo Principal

1. Usuario selecciona Descargar.
2. Sistema genera archivo.
3. Sistema inicia descarga.
4. Usuario recibe archivo XLSX.

---

# CU10 – Solicitar Exportación Asíncrona

## Objetivo

Generar un reporte en segundo plano.

## Actor

- Ejecutivo de Admisión

## Flujo Principal

1. Usuario selecciona Descargar.
2. Sistema registra solicitud.
3. Sistema genera archivo.
4. Usuario continúa trabajando.

## Postcondición

Reporte queda pendiente de disponibilidad.

---

# CU11 – Descargar Reporte desde Notificación

## Objetivo

Permitir descargar un reporte previamente generado.

## Actor

- Ejecutivo de Admisión

## Precondición

Reporte generado correctamente.

## Flujo Principal

1. Usuario abre campana.
2. Sistema muestra notificación.
3. Usuario selecciona Descargar.
4. Sistema inicia descarga.

## Postcondición

Reporte descargado exitosamente.

---

# CU12 – Navegación por Scroll Infinito

## Objetivo

Visualizar grandes volúmenes de información.

## Actor

- Todos los roles.

## Flujo Principal

1. Usuario llega al final de la grilla.
2. Sistema detecta evento.
3. Sistema carga 50 registros adicionales.
4. Sistema actualiza la visualización.

---

# CU13 – Consulta de Sustentos Pendientes

## Objetivo

Visualizar pendientes administrativos, médicos y de proceso.

## Actor

- Superusuario
- Gestor de A
- Ejecutivo

## Flujo Principal

1. Usuario abre detalle.
2. Sistema identifica pendientes.
3. Sistema muestra agrupadores correspondientes.

---

# CU14 – Gestión de Estado No Facturable

## Objetivo

Registrar un encuentro como No Facturable.

## Actor

- Superusuario
- Gestor de A

## Flujo Principal

1. Usuario selecciona No Facturable.
2. Sistema solicita confirmación.
3. Usuario confirma.
4. Sistema actualiza estado.
5. Sistema retira temporalmente el encuentro de Admisión.

## Resultado

El Job reevaluará posteriormente el encuentro.

---

# CU15 – Gestión de Estado Error de Facturación

## Objetivo

Registrar un encuentro con Error de Facturación.

## Actor

- Superusuario
- Gestor de A

## Flujo Principal

1. Usuario selecciona Error de Facturación.
2. Sistema solicita confirmación.
3. Usuario confirma.
4. Sistema actualiza estado.
5. Sistema retira temporalmente el encuentro.

## Resultado

El Job reevaluará posteriormente el encuentro.

---

# Trazabilidad

| Caso de Uso | Módulo |
|------------|---------|
| CU01 | Lista de Encuentros |
| CU02 | Búsqueda |
| CU03 | Filtros |
| CU04 | Filtros |
| CU05 | Lista de Encuentros |
| CU06 | Ordenamiento |
| CU07 | Detalle del Encuentro |
| CU08 | Estados |
| CU09 | Exportaciones |
| CU10 | Exportaciones |
| CU11 | Exportaciones |
| CU12 | Lista de Encuentros |
| CU13 | Detalle del Encuentro |
| CU14 | Estados |
| CU15 | Estados |

---

# Fuente de Verdad

Los casos de uso definidos en este documento representan el comportamiento funcional esperado del sistema y deberán ser utilizados como base para criterios de aceptación, pruebas funcionales y escenarios Gherkin.
