# 21-Pendientes-Facturar.md

# Pendientes por Facturar

## 1. Objetivo

Proporcionar al Ejecutivo de Facturación una vista personalizada de los encuentros que han sido asignados a su usuario para procesamiento de facturación, permitiendo una gestión eficiente de su carga de trabajo.

---

## 2. Alcance

Esta funcionalidad está disponible exclusivamente para el Ejecutivo de Facturación y representa su bandeja de trabajo personal para el procesamiento de encuentros de facturación.

---

## 3. Roles Autorizados

- Ejecutivo de Facturación (exclusivamente)

---

## 4. Descripción Funcional

### 4.1 Definición

Pendientes por Facturar es la vista operativa donde el Ejecutivo de Facturación visualiza únicamente los encuentros de facturación que le han sido asignados por el Responsable de Facturación.

### 4.2 Características Principales

- Vista personalizada por usuario.
- Solo muestra encuentros asignados al ejecutivo autenticado.
- Los encuentros provienen de la bandeja de Facturación.
- Permite gestionar el proceso de facturación de forma individual.
- No permite visualizar encuentros de otros ejecutivos.
- No permite visualizar encuentros sin asignar.

---

## 5. Acceso

### 5.1 Pantalla Inicial

Al iniciar sesión, el Ejecutivo de Facturación accede directamente a su bandeja de Pendientes por Facturar.

No requiere navegación adicional.

### 5.2 Restricción de Visibilidad

El ejecutivo SOLO visualiza:

- Encuentros asignados específicamente a su usuario.
- Encuentros clasificados en la bandeja de Facturación.
- Encuentros con estado activo para facturación.

---

## 6. Información Visualizada

### 6.1 Lista de Pendientes por Facturar

El Ejecutivo de Facturación visualiza las siguientes columnas:

- Número de Encuentro
- Estado
- NHC
- Paciente (Apellidos y Nombres)
- Fecha de Apertura
- Fecha de Asignación
- Tipo de Encuentro
- Garante
- Producto
- Sede
- Prioridad
- Monto
- Observaciones (si las hay)

### 6.2 Carga Inicial

Al ingresar:

- Se mostrarán 50 registros inicialmente.
- Ordenados por fecha de asignación (más recientes primero).
- Scroll infinito de 50 en 50.

---

## 7. Funcionalidades

### 7.1 Búsqueda

Permite buscar encuentros por:

- Nombre del paciente
- Apellido del paciente
- Número de encuentro
- NHC

### 7.2 Filtros Disponibles

Puede filtrar por:

- Estado de facturación
- Fecha de apertura
- Fecha de asignación
- Prioridad
- Garante
- Tipo de encuentro
- Sede
- Rango de monto

### 7.3 Ordenamiento

Puede ordenar por:

- Fecha de asignación
- Fecha de apertura
- Número de encuentro
- Prioridad
- Monto
- Paciente (alfabéticamente)

Opciones:

- Ascendente
- Descendente

### 7.4 Detalle del Encuentro

Al seleccionar un encuentro, se abre la vista de detalle con:

#### Datos del Paciente

- Nombres y Apellidos
- NHC
- Tipo de documento
- Número de documento
- Fecha de nacimiento

#### Datos del Encuentro

- Número de encuentro
- Fecha de apertura
- Tipo de encuentro
- Prestación
- Sede
- Fecha de asignación

#### Datos del Seguro

- Garante
- Producto
- Plan de Copago
- Beneficio
- Código de autorización
- Cobertura

#### Datos de Facturación

- Monto total
- Detalle de servicios
- Código de facturación
- Observaciones

#### Sustentos

- Sustentos administrativos
- Sustentos médicos
- Documentación adjunta

---

## 8. Acciones Disponibles

### 8.1 Procesar Facturación

El ejecutivo puede:

1. Revisar la información del encuentro.
2. Validar documentación y sustentos.
3. Verificar cobertura del seguro.
4. Ingresar datos de facturación.
5. Generar factura.
6. Marcar como facturado.

### 8.2 Devolver Encuentro

Si identifica inconsistencias:

1. Selecciona "Devolver".
2. Ingresa motivo de devolución (obligatorio).
3. Confirma la devolución.
4. El encuentro regresa al Responsable de Facturación.
5. El encuentro se marca con estado "Devuelto".

### 8.3 Solicitar Soporte

Si requiere apoyo:

1. Selecciona "Solicitar Soporte".
2. Ingresa descripción del problema.
3. El sistema notifica al Responsable de Facturación.
4. El encuentro se marca como "En Revisión".

### 8.4 Agregar Observaciones

Puede agregar notas o comentarios al encuentro para:

- Documentar hallazgos.
- Registrar comunicaciones con aseguradoras.
- Anotar pendientes.
- Dejar historial de gestión.

---

## 9. Estados de Facturación

Los encuentros en Pendientes por Facturar pueden tener los siguientes estados:

### 9.1 Estados Principales

- **Asignado:** Recién asignado al ejecutivo, pendiente de iniciar procesamiento.
- **En Proceso:** El ejecutivo está trabajando en la facturación.
- **Pendiente de Validación:** Requiere validación adicional de información.
- **Observado:** Tiene observaciones que deben ser resueltas.
- **Devuelto:** Devuelto al responsable por inconsistencias.
- **Facturado:** Facturación completada exitosamente.
- **Rechazado:** Rechazado por la aseguradora.

---

## 10. Flujo Operativo

### 10.1 Flujo Principal - Procesar Facturación

1. El Ejecutivo de Facturación accede a Pendientes por Facturar.
2. Visualiza la lista de encuentros asignados.
3. Selecciona un encuentro prioritario.
4. Revisa el detalle del encuentro.
5. Valida documentación y sustentos.
6. Verifica cobertura del seguro.
7. Ingresa datos de facturación en el sistema correspondiente.
8. Genera factura.
9. Marca el encuentro como "Facturado".
10. El encuentro se actualiza y sale de Pendientes por Facturar.
11. El sistema registra la facturación en auditoría.

### 10.2 Flujo Alterno - Devolver por Inconsistencias

1. El ejecutivo identifica inconsistencias en el encuentro.
2. Selecciona "Devolver Encuentro".
3. Ingresa motivo detallado de la devolución.
4. Confirma la devolución.
5. El sistema actualiza el estado a "Devuelto".
6. El encuentro regresa a la bandeja del Responsable de Facturación.
7. El ejecutivo continúa con el siguiente encuentro.

### 10.3 Flujo Alterno - Solicitar Soporte

1. El ejecutivo encuentra un caso complejo que requiere soporte.
2. Selecciona "Solicitar Soporte".
3. Ingresa descripción del problema o consulta.
4. Confirma la solicitud.
5. El sistema notifica al Responsable de Facturación.
6. El estado del encuentro se actualiza a "En Revisión".
7. El ejecutivo espera respuesta o puede continuar con otros encuentros.

---

## 11. Reglas de Negocio

### RN-PF-01

El Ejecutivo de Facturación solo visualiza encuentros asignados a su usuario.

### RN-PF-02

No puede visualizar encuentros de otros ejecutivos.

### RN-PF-03

No puede visualizar encuentros sin asignar.

### RN-PF-04

Los encuentros asignados permanecen en su bandeja hasta ser procesados o devueltos.

### RN-PF-05

Al marcar un encuentro como facturado, este sale de Pendientes por Facturar.

### RN-PF-06

Al devolver un encuentro, este regresa al Responsable de Facturación.

### RN-PF-07

Toda acción sobre encuentros debe quedar registrada para auditoría.

### RN-PF-08

El ejecutivo puede procesar encuentros de diferentes sedes si le fueron asignados.

### RN-PF-09

El ejecutivo puede procesar encuentros de diferentes garantes.

### RN-PF-10

La devolución de encuentros requiere motivo obligatorio.

---

## 12. Contador de Carga

### 12.1 Indicador Visual

En la parte superior de la pantalla se muestra:

- Total de encuentros asignados
- Encuentros pendientes de procesar
- Encuentros en proceso
- Encuentros facturados (hoy)
- Monto total pendiente

### 12.2 Ejemplo

```
Carga de Trabajo

Total Asignados: 45 encuentros
Pendientes: 32 encuentros
En Proceso: 8 encuentros
Facturados Hoy: 5 encuentros
Monto Pendiente: S/ 125,340.00
```

---

## 13. Casos de Uso

### CU-PF-01: Consultar Pendientes Asignados

**Actor:** Ejecutivo de Facturación

**Precondiciones:**
- Usuario autenticado como Ejecutivo de Facturación
- Tiene encuentros asignados

**Flujo Principal:**

1. El usuario inicia sesión.
2. El sistema muestra automáticamente Pendientes por Facturar.
3. El sistema carga 50 encuentros asignados al usuario.
4. El usuario visualiza su carga de trabajo.

**Postcondiciones:**
- El usuario conoce su carga de trabajo actual

### CU-PF-02: Procesar Facturación de Encuentro

**Actor:** Ejecutivo de Facturación

**Flujo Principal:**

1. El usuario accede a Pendientes por Facturar.
2. El usuario selecciona un encuentro con Prioridad = "Alta".
3. El sistema muestra el detalle completo del encuentro.
4. El usuario valida documentación y cobertura.
5. El usuario ingresa datos de facturación.
6. El usuario genera la factura.
7. El usuario marca el encuentro como "Facturado".
8. El sistema registra la facturación.
9. El sistema muestra confirmación.
10. El encuentro sale de Pendientes por Facturar.

**Postcondiciones:**
- El encuentro ha sido facturado
- El encuentro ya no aparece en Pendientes
- La facturación está registrada en auditoría

### CU-PF-03: Devolver Encuentro por Inconsistencias

**Actor:** Ejecutivo de Facturación

**Flujo Principal:**

1. El usuario revisa un encuentro.
2. Identifica que faltan sustentos médicos.
3. Selecciona "Devolver Encuentro".
4. Ingresa motivo: "Faltan sustentos médicos: resultado de biopsia".
5. Confirma la devolución.
6. El sistema actualiza el estado a "Devuelto".
7. El sistema notifica al Responsable de Facturación.
8. El encuentro regresa a la bandeja del responsable.
9. El sistema muestra confirmación al ejecutivo.

**Postcondiciones:**
- El encuentro ha sido devuelto
- El responsable ha sido notificado
- La devolución está registrada en auditoría

---

## 14. Exportación

### 14.1 Tipo de Exportación

Asíncrona (igual que Ejecutivo de Admisión).

### 14.2 Flujo

1. El ejecutivo solicita exportación de su lista de pendientes.
2. El sistema genera el archivo en segundo plano.
3. El sistema notifica mediante campana cuando está listo.
4. El ejecutivo descarga el archivo.
5. Vigencia de descarga: 1 hora.

### 14.3 Contenido de la Exportación

El archivo XLSX incluye:

- Todos los campos visibles en la lista
- Respeta filtros y búsquedas activas
- Solo incluye encuentros del ejecutivo autenticado

---

## 15. Mensajes del Sistema

### 15.1 Confirmación

**Facturación Completada**

Título: Encuentro facturado exitosamente

Descripción: El encuentro ha sido procesado y facturado correctamente. El registro ha sido actualizado.

**Encuentro Devuelto**

Título: Encuentro devuelto

Descripción: El encuentro ha sido devuelto al Responsable de Facturación con el motivo especificado.

### 15.2 Advertencias

**Sin Motivo de Devolución**

Título: Motivo requerido

Descripción: Debe ingresar un motivo de devolución antes de continuar.

### 15.3 Errores

**Error al Procesar**

Título: No se pudo completar la operación

Descripción: En estos momentos no podemos procesar la facturación. Por favor, inténtelo nuevamente.

**Sin Pendientes Asignados**

Título: Sin encuentros asignados

Descripción: Actualmente no tiene encuentros asignados para facturar. Contacte al Responsable de Facturación.

---

## 16. Auditoría

### 16.1 Información a Registrar

- Acceso a Pendientes por Facturar
- Consulta de detalle de encuentro
- Procesamiento de facturación
- Devolución de encuentro (con motivo)
- Solicitud de soporte
- Agregado de observaciones
- Exportaciones realizadas
- Filtros aplicados
- Búsquedas realizadas

### 16.2 Trazabilidad

- Historial de acciones por ejecutivo
- Historial de facturaciones por día/semana/mes
- Historial de devoluciones
- Tiempo promedio de procesamiento por encuentro
- Productividad por ejecutivo

---

## 17. Consideraciones de Rendimiento

- Carga inicial de 50 encuentros: ≤ 3 segundos
- Carga de detalle de encuentro: ≤ 2 segundos
- Procesamiento de facturación: ≤ 3 segundos
- Aplicación de filtros: ≤ 3 segundos
- Búsquedas: ≤ 3 segundos
- Scroll infinito: ≤ 2 segundos por bloque

---

## 18. Consideraciones de Seguridad

### CS-PF-01

Solo el Ejecutivo de Facturación puede acceder a esta funcionalidad.

### CS-PF-02

El ejecutivo solo visualiza sus propios encuentros asignados.

### CS-PF-03

No puede acceder a encuentros de otros ejecutivos.

### CS-PF-04

Toda acción debe ser autenticada y autorizada.

### CS-PF-05

Las sesiones deben validarse continuamente.

---

## 19. Indicadores de Desempeño (KPIs)

El sistema debe permitir medir:

- Cantidad de encuentros facturados por ejecutivo por día
- Tiempo promedio de facturación por encuentro
- Tasa de devolución por ejecutivo
- Monto facturado por ejecutivo por periodo
- Encuentros pendientes por ejecutivo
- Productividad por ejecutivo

---

## 20. Integraciones

### 20.1 Módulos Integrados

- Asignaciones Masivas (recibe encuentros)
- Cuadro de Control (reporta estado)
- Sistema de Facturación (procesa facturas)
- Sistema de Auditoría (registra acciones)

### 20.2 Notificaciones

- Notificación al recibir nuevos encuentros asignados
- Notificación de respuesta a solicitud de soporte
- Notificación de cambios en encuentros asignados

---

## 21. Fuente de Verdad

Este documento constituye la referencia oficial para la funcionalidad Pendientes por Facturar en el sistema AUNADOS.

Audiencias:

- Desarrollo
- QA
- UAT
- Negocio
- Auditoría
