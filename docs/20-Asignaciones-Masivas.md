# 20-Asignaciones-Masivas.md

# Asignaciones Masivas

## 1. Objetivo

Permitir al Responsable de Facturación asignar múltiples encuentros de facturación a los Ejecutivos de Facturación de forma eficiente y controlada, optimizando la distribución de carga de trabajo.

---

## 2. Alcance

Esta funcionalidad está disponible exclusivamente en el módulo de Facturación y permite distribuir encuentros pendientes de facturación entre el equipo de ejecutivos.

---

## 3. Roles Autorizados

- Responsable de Facturación (exclusivamente)

---

## 4. Descripción Funcional

### 4.1 Definición

Las Asignaciones Masivas permiten al Responsable de Facturación seleccionar múltiples encuentros de la bandeja de Facturación y asignarlos a uno o varios Ejecutivos de Facturación de forma simultánea.

### 4.2 Objetivos de Negocio

- Optimizar la distribución de carga de trabajo.
- Reducir el tiempo de asignación manual individual.
- Garantizar equidad en la distribución de encuentros.
- Facilitar la priorización de encuentros urgentes.
- Mejorar el control operativo del proceso de facturación.

---

## 5. Flujo Operativo

### 5.1 Flujo Principal - Asignación Masiva

1. El Responsable de Facturación accede a Lista de Encuentros (Facturación).
2. Visualiza los encuentros disponibles para asignación.
3. Aplica filtros si es necesario (sede, garante, prioridad, fecha, etc.).
4. Selecciona múltiples encuentros mediante checkboxes.
5. Presiona el botón "Asignar Encuentros".
6. El sistema muestra un modal con la lista de Ejecutivos de Facturación disponibles.
7. El responsable selecciona el ejecutivo destinatario.
8. El responsable puede agregar observaciones opcionales.
9. El responsable confirma la asignación.
10. El sistema valida la asignación.
11. El sistema actualiza la asignación de los encuentros seleccionados.
12. El sistema registra la asignación en auditoría.
13. El sistema muestra confirmación con resumen de asignación.
14. Los encuentros asignados desaparecen de la lista del responsable.
15. Los encuentros aparecen en "Pendientes por Facturar" del ejecutivo asignado.

### 5.2 Flujo Alterno - Asignación por Criterios

1. El Responsable de Facturación accede a Asignaciones Masivas.
2. Selecciona "Asignar por Criterios".
3. Define criterios de selección automática:
   - Cantidad de encuentros
   - Sede
   - Garante
   - Tipo de encuentro
   - Prioridad
   - Fecha de apertura
4. Selecciona el ejecutivo destinatario.
5. El sistema muestra preview de encuentros que serán asignados.
6. El responsable confirma.
7. El sistema procesa la asignación.

### 5.3 Flujo Alterno - Distribución Equitativa

1. El Responsable de Facturación accede a Asignaciones Masivas.
2. Selecciona "Distribución Equitativa".
3. Define la cantidad total de encuentros a distribuir.
4. Selecciona los ejecutivos participantes.
5. El sistema calcula distribución equitativa.
6. El sistema muestra preview de asignaciones.
7. El responsable confirma.
8. El sistema procesa las asignaciones.

---

## 6. Información Visualizada

### 6.1 Lista de Encuentros Disponibles

El Responsable de Facturación visualiza:

- Checkbox de selección
- Número de encuentro
- Paciente (Nombre y Apellidos)
- NHC
- Sede
- Fecha de apertura
- Tipo de encuentro
- Garante
- Prioridad
- Monto
- Estado actual

### 6.2 Panel de Asignación

Al seleccionar encuentros, se muestra:

- Cantidad de encuentros seleccionados
- Monto total de encuentros seleccionados
- Lista de ejecutivos disponibles con:
  - Nombre del ejecutivo
  - Cantidad actual de encuentros asignados
  - Carga de trabajo (%)
  - Estado (activo/inactivo)

---

## 7. Validaciones

### 7.1 Validaciones de Negocio

#### VN-AM-01

Solo se pueden asignar encuentros que estén en la bandeja de Facturación.

#### VN-AM-02

Solo se pueden asignar encuentros que NO tengan asignación previa.

#### VN-AM-03

Se debe seleccionar al menos 1 encuentro para asignación masiva.

#### VN-AM-04

Se debe seleccionar un ejecutivo destinatario válido.

#### VN-AM-05

El ejecutivo seleccionado debe estar activo en el sistema.

#### VN-AM-06

No se puede asignar más de 100 encuentros en una sola operación.

### 7.2 Validaciones Técnicas

#### VT-AM-01

La asignación debe procesarse de forma transaccional (todo o nada).

#### VT-AM-02

El sistema debe validar que los encuentros no hayan sido asignados por otro usuario simultáneamente.

#### VT-AM-03

El sistema debe validar la sesión activa del responsable antes de procesar.

---

## 8. Reglas de Negocio

### RN-AM-01

Solo el Responsable de Facturación puede realizar asignaciones masivas.

### RN-AM-02

Toda asignación masiva debe quedar registrada para auditoría.

### RN-AM-03

Los encuentros asignados no pueden ser reasignados sin previa liberación.

### RN-AM-04

La asignación masiva puede incluir encuentros de diferentes sedes.

### RN-AM-05

La asignación masiva puede incluir encuentros de diferentes garantes.

### RN-AM-06

Un ejecutivo puede tener encuentros asignados de múltiples responsables.

### RN-AM-07

La asignación masiva no modifica la clasificación de bandeja de los encuentros.

### RN-AM-08

Los encuentros asignados permanecen en Facturación pero ahora son visibles para el ejecutivo asignado.

### RN-AM-09

El límite de 100 encuentros por asignación puede ser ajustado por configuración.

### RN-AM-10

Se puede asignar observaciones opcionales a la asignación para contexto del ejecutivo.

---

## 9. Funcionalidades Adicionales

### 9.1 Búsqueda y Filtros

Antes de asignar, el responsable puede filtrar por:

- Sede
- Garante
- Tipo de encuentro
- Prioridad
- Fecha de apertura
- Rango de monto
- Estado

### 9.2 Selección de Encuentros

Opciones de selección:

- Seleccionar encuentro individual
- Seleccionar todos los visibles en pantalla
- Seleccionar por criterios específicos
- Deseleccionar todos

### 9.3 Vista Previa de Asignación

Antes de confirmar, se muestra:

- Cantidad de encuentros a asignar
- Ejecutivo destinatario
- Carga actual del ejecutivo
- Carga proyectada después de asignación
- Monto total de encuentros
- Lista detallada de encuentros

---

## 10. Casos de Uso

### CU-AM-01: Asignar Encuentros Masivamente

**Actor:** Responsable de Facturación

**Precondiciones:**
- Usuario autenticado como Responsable de Facturación
- Existen encuentros en Facturación sin asignar
- Existen ejecutivos de facturación activos

**Flujo Principal:**

1. El usuario accede a Lista de Encuentros (Facturación).
2. El sistema muestra encuentros disponibles para asignación.
3. El usuario aplica filtros: Sede = "Lima", Prioridad = "Alta".
4. El sistema filtra y muestra resultados.
5. El usuario selecciona 25 encuentros mediante checkboxes.
6. El usuario presiona "Asignar Encuentros".
7. El sistema muestra modal de asignación con ejecutivos disponibles.
8. El usuario selecciona "Juan Pérez" como ejecutivo destinatario.
9. El usuario ingresa observación: "Encuentros prioritarios para facturación urgente".
10. El usuario presiona "Confirmar Asignación".
11. El sistema valida la operación.
12. El sistema asigna los 25 encuentros a Juan Pérez.
13. El sistema registra la asignación en auditoría.
14. El sistema muestra mensaje: "25 encuentros asignados exitosamente a Juan Pérez".
15. Los encuentros desaparecen de la lista del responsable.

**Postcondiciones:**
- 25 encuentros han sido asignados a Juan Pérez
- Los encuentros aparecen en "Pendientes por Facturar" de Juan Pérez
- La asignación ha sido registrada en auditoría
- El cuadro de control refleja la nueva distribución

### CU-AM-02: Distribución Equitativa

**Actor:** Responsable de Facturación

**Flujo Principal:**

1. El usuario accede a Asignaciones Masivas.
2. El usuario selecciona "Distribución Equitativa".
3. El usuario define: 60 encuentros con Prioridad = "Alta".
4. El usuario selecciona 3 ejecutivos: Juan Pérez, María López, Carlos Díaz.
5. El sistema calcula: 20 encuentros para cada uno.
6. El sistema muestra preview de la distribución.
7. El usuario confirma.
8. El sistema procesa las asignaciones.
9. El sistema muestra resumen: "60 encuentros distribuidos equitativamente entre 3 ejecutivos".

### CU-AM-03: Validación de Límite Excedido

**Actor:** Responsable de Facturación

**Flujo Principal:**

1. El usuario selecciona 150 encuentros.
2. El usuario presiona "Asignar Encuentros".
3. El sistema detecta que se excede el límite de 100.
4. El sistema muestra mensaje: "No puede asignar más de 100 encuentros en una sola operación. Actualmente tiene 150 seleccionados".
5. El usuario reduce la selección a 100 encuentros.
6. El usuario procesa la asignación exitosamente.

---

## 11. Mensajes del Sistema

### 11.1 Confirmación

**Asignación Exitosa**

Título: Asignación completada

Descripción: {cantidad} encuentros han sido asignados exitosamente a {nombre_ejecutivo}.

### 11.2 Advertencias

**Límite Excedido**

Título: Límite de asignación excedido

Descripción: No puede asignar más de 100 encuentros en una sola operación. Actualmente tiene {cantidad} seleccionados. Por favor, reduzca la selección.

**Sin Ejecutivo Seleccionado**

Título: Ejecutivo requerido

Descripción: Debe seleccionar un ejecutivo de facturación para realizar la asignación.

**Sin Encuentros Seleccionados**

Título: Sin encuentros seleccionados

Descripción: Debe seleccionar al menos un encuentro para realizar la asignación.

### 11.3 Errores

**Error de Asignación**

Título: No se pudo completar la asignación

Descripción: En estos momentos no podemos procesar la asignación masiva. Por favor, inténtelo nuevamente.

**Ejecutivo Inactivo**

Título: Ejecutivo no disponible

Descripción: El ejecutivo seleccionado no está activo. Por favor, seleccione otro ejecutivo.

**Encuentros Ya Asignados**

Título: Conflicto de asignación

Descripción: Algunos encuentros seleccionados ya han sido asignados a otros ejecutivos. La operación no puede completarse.

---

## 12. Auditoría

### 12.1 Información a Registrar

Para cada asignación masiva se debe registrar:

- Usuario responsable que realizó la asignación
- Fecha y hora de la asignación
- Ejecutivo destinatario
- Lista de encuentros asignados (números de encuentro)
- Cantidad de encuentros asignados
- Monto total asignado
- Criterios de filtrado utilizados (si aplica)
- Observaciones ingresadas
- Resultado de la operación (exitoso/fallido)
- IP de origen

### 12.2 Trazabilidad

El sistema debe permitir consultar:

- Historial de asignaciones por responsable
- Historial de asignaciones por ejecutivo
- Historial de asignaciones por encuentro
- Historial de asignaciones por fecha
- Reporte de carga de trabajo por ejecutivo

---

## 13. Liberación de Asignaciones

### 13.1 Flujo de Liberación

Si se requiere reasignar encuentros:

1. El Responsable de Facturación accede al Cuadro de Control.
2. Identifica encuentros asignados que requieren liberación.
3. Selecciona los encuentros a liberar.
4. Confirma la liberación.
5. El sistema libera los encuentros.
6. Los encuentros regresan a la lista general de Facturación.
7. El responsable puede reasignarlos.

### 13.2 Motivos de Liberación

- Ejecutivo de licencia o ausente
- Redistribución de carga
- Priorización de encuentros
- Error en asignación inicial

---

## 14. Consideraciones de Rendimiento

- La carga de encuentros disponibles debe ser ≤ 3 segundos.
- La asignación de hasta 100 encuentros debe completarse en ≤ 5 segundos.
- El cálculo de distribución equitativa debe responder en ≤ 2 segundos.
- Los filtros deben aplicarse en ≤ 3 segundos.

---

## 15. Consideraciones de Seguridad

### CS-AM-01

Solo el Responsable de Facturación puede acceder a esta funcionalidad.

### CS-AM-02

Toda asignación debe quedar registrada con identificación del usuario.

### CS-AM-03

El sistema debe validar la sesión activa antes de cada asignación.

### CS-AM-04

No se permite la asignación concurrente del mismo encuentro por múltiples usuarios.

---

## 16. Integraciones

### 16.1 Módulos Integrados

- Lista de Encuentros (Facturación)
- Cuadro de Control
- Pendientes por Facturar
- Sistema de Auditoría

### 16.2 Notificaciones

Cuando se realiza una asignación:

- El ejecutivo asignado recibe notificación (opcional)
- El sistema actualiza el cuadro de control en tiempo real
- Se registra en el log de auditoría

---

## 17. Reportes

### 17.1 Reporte de Asignaciones

El sistema debe generar reportes que incluyan:

- Asignaciones realizadas por fecha
- Asignaciones por responsable
- Asignaciones por ejecutivo
- Carga de trabajo por ejecutivo
- Tiempos promedio de asignación
- Distribución de encuentros por sede/garante

---

## 18. Fuente de Verdad

Este documento constituye la referencia oficial para la funcionalidad Asignaciones Masivas en el sistema AUNADOS.

Audiencias:

- Desarrollo
- QA
- UAT
- Negocio
- Auditoría
