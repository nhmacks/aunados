# 19-Cambio-Beneficio.md

# Cambio de Beneficio

## 1. Objetivo

Permitir la modificación del beneficio asociado a un encuentro cuando se identifica que la asignación inicial es incorrecta o requiere actualización, asegurando la correcta facturación del servicio prestado.

---

## 2. Alcance

Esta funcionalidad está disponible exclusivamente en el módulo de Admisión y permite corregir errores de vinculación de beneficios antes de que el encuentro avance a facturación.

---

## 3. Roles Autorizados

- Ejecutivo de Admisión (exclusivamente)

---

## 4. Descripción Funcional

### 4.1 Definición

El cambio de beneficio es una acción que permite al Ejecutivo de Admisión modificar el beneficio del seguro asociado a un encuentro específico cuando se detecta:

- Error en la vinculación inicial del beneficio.
- Actualización de información del paciente.
- Corrección de datos del asegurador.
- Ajuste por validación de cobertura.

### 4.2 Restricciones

- Solo puede realizar cambios el Ejecutivo de Admisión.
- Solo sobre encuentros de su responsabilidad (creados por él).
- Solo sobre encuentros de su sede.
- Solo sobre encuentros en bandeja de Admisión.

---

## 5. Flujo Operativo

### 5.1 Flujo Principal - Cambio de Beneficio

1. El Ejecutivo de Admisión accede al detalle del encuentro.
2. Identifica que el beneficio asignado es incorrecto.
3. Selecciona la opción "Cambiar Beneficio".
4. El sistema muestra los beneficios disponibles del garante asociado.
5. El ejecutivo selecciona el beneficio correcto.
6. El ejecutivo ingresa un motivo/justificación del cambio.
7. El sistema valida la información.
8. El sistema actualiza el beneficio del encuentro.
9. El sistema registra el cambio para auditoría.
10. El sistema muestra confirmación exitosa.

### 5.2 Flujo Alterno - Beneficio No Disponible

1. El ejecutivo no encuentra el beneficio correcto en la lista.
2. El ejecutivo debe escalar el caso a Supervisor o Dirección Médica.
3. El estado del encuentro se actualiza a "Derivado a Supervisor" o "Error de Vinculación".

---

## 6. Información Requerida

### 6.1 Datos a Visualizar

Al solicitar cambio de beneficio, el sistema debe mostrar:

#### Información Actual

- Garante actual
- Producto actual
- Beneficio actual
- Plan de Copago actual
- Código de Autorización (si existe)

#### Información del Paciente

- Nombre completo
- NHC
- Tipo de documento
- Número de documento

#### Información del Encuentro

- Número de encuentro
- Fecha de apertura
- Tipo de encuentro
- Prestación

### 6.2 Datos a Modificar

El ejecutivo puede modificar:

- Beneficio (obligatorio)
- Justificación del cambio (obligatorio)

---

## 7. Validaciones

### 7.1 Validaciones de Negocio

#### VN-CB-01

El beneficio seleccionado debe pertenecer al mismo garante del encuentro.

#### VN-CB-02

El beneficio seleccionado debe estar activo y vigente.

#### VN-CB-03

La justificación del cambio es obligatoria y debe tener al menos 10 caracteres.

#### VN-CB-04

Solo se puede cambiar el beneficio en encuentros de la bandeja de Admisión.

#### VN-CB-05

El ejecutivo solo puede cambiar beneficios de encuentros de su responsabilidad.

### 7.2 Validaciones Técnicas

#### VT-CB-01

El sistema debe verificar que el encuentro no esté bloqueado por otro usuario.

#### VT-CB-02

El sistema debe validar la existencia del beneficio seleccionado en XHIS.

#### VT-CB-03

El cambio debe registrarse de forma atómica (todo o nada).

---

## 8. Reglas de Negocio

### RN-CB-01

Solo el Ejecutivo de Admisión puede realizar cambios de beneficio.

### RN-CB-02

Todo cambio de beneficio debe quedar registrado para auditoría.

### RN-CB-03

El cambio de beneficio debe incluir justificación obligatoria.

### RN-CB-04

Un encuentro puede tener múltiples cambios de beneficio a lo largo de su ciclo de vida.

### RN-CB-05

El cambio de beneficio no modifica la clasificación de bandeja del encuentro.

### RN-CB-06

Después del cambio, el encuentro debe ser reevaluado por el Job de Admisión.

### RN-CB-07

Si el beneficio actual es el mismo que el seleccionado, el sistema debe mostrar advertencia.

### RN-CB-08

Los Superusuarios y Gestores NO pueden realizar cambios de beneficio directamente.

---

## 9. Interfaz de Usuario

### 9.1 Pantalla de Cambio de Beneficio

Debe contener:

#### Sección 1: Información Actual

- Beneficio actual (solo lectura)
- Garante (solo lectura)
- Producto (solo lectura)
- Plan de Copago (solo lectura)

#### Sección 2: Nuevo Beneficio

- Lista desplegable de beneficios disponibles
- Descripción del beneficio seleccionado
- Cobertura del beneficio seleccionado

#### Sección 3: Justificación

- Campo de texto para motivo del cambio (mínimo 10 caracteres, máximo 500)

#### Sección 4: Acciones

- Botón "Guardar Cambio"
- Botón "Cancelar"

---

## 10. Casos de Uso

### CU-CB-01: Cambiar Beneficio Exitosamente

**Actor:** Ejecutivo de Admisión

**Precondiciones:**
- Usuario autenticado como Ejecutivo de Admisión
- Encuentro pertenece al usuario
- Encuentro en bandeja de Admisión

**Flujo Principal:**

1. El usuario accede al detalle del encuentro.
2. El usuario selecciona "Cambiar Beneficio".
3. El sistema muestra la pantalla de cambio de beneficio con información actual.
4. El usuario selecciona el nuevo beneficio de la lista.
5. El usuario ingresa la justificación del cambio.
6. El usuario presiona "Guardar Cambio".
7. El sistema valida la información.
8. El sistema actualiza el beneficio.
9. El sistema registra el cambio en auditoría.
10. El sistema muestra mensaje de confirmación.
11. El sistema regresa al detalle del encuentro actualizado.

**Postcondiciones:**
- El beneficio del encuentro ha sido actualizado
- El cambio ha sido registrado en auditoría
- El encuentro será reevaluado en la próxima ejecución del Job

### CU-CB-02: Validación de Cambio Fallida

**Actor:** Ejecutivo de Admisión

**Flujo Principal:**

1. El usuario accede a cambiar beneficio.
2. El usuario selecciona el mismo beneficio actual.
3. El usuario ingresa justificación.
4. El usuario presiona "Guardar Cambio".
5. El sistema detecta que el beneficio es el mismo.
6. El sistema muestra advertencia: "El beneficio seleccionado es el mismo que el actual".
7. El usuario puede corregir o cancelar.

### CU-CB-03: Beneficio No Disponible

**Actor:** Ejecutivo de Admisión

**Flujo Principal:**

1. El usuario accede a cambiar beneficio.
2. El usuario no encuentra el beneficio correcto en la lista.
3. El usuario presiona "Cancelar".
4. El usuario cambia el estado del encuentro a "Error de Vinculación".
5. El usuario registra observación indicando el problema.

---

## 11. Mensajes del Sistema

### 11.1 Confirmación

**Cambio Exitoso**

Título: Beneficio actualizado

Descripción: El beneficio del encuentro ha sido actualizado correctamente. El cambio ha sido registrado y el encuentro será reevaluado en la próxima ejecución.

### 11.2 Advertencias

**Beneficio Idéntico**

Título: Beneficio sin cambios

Descripción: El beneficio seleccionado es el mismo que el actual. Por favor, seleccione un beneficio diferente o cancele la operación.

**Justificación Insuficiente**

Título: Justificación requerida

Descripción: Debe ingresar una justificación de al menos 10 caracteres para realizar el cambio.

### 11.3 Errores

**Error de Validación**

Título: No se pudo validar el beneficio

Descripción: El beneficio seleccionado no está disponible o no es válido para este garante. Por favor, seleccione otro beneficio.

**Error de Actualización**

Título: No se pudo completar el cambio

Descripción: En estos momentos no podemos procesar el cambio de beneficio. Por favor, inténtelo nuevamente.

**Sin Permisos**

Título: Acceso denegado

Descripción: No tiene permisos para cambiar el beneficio de este encuentro.

---

## 12. Auditoría

### 12.1 Información a Registrar

Para cada cambio de beneficio se debe registrar:

- Usuario que realizó el cambio
- Fecha y hora del cambio
- Número de encuentro
- Beneficio anterior
- Beneficio nuevo
- Justificación del cambio
- IP de origen
- Resultado de la operación (exitoso/fallido)

### 12.2 Trazabilidad

El sistema debe mantener:

- Historial completo de cambios de beneficio por encuentro
- Secuencia temporal de modificaciones
- Capacidad de auditoría por usuario
- Capacidad de auditoría por encuentro
- Capacidad de auditoría por fecha

---

## 13. Consideraciones de Rendimiento

- La carga de beneficios disponibles debe ser ≤ 2 segundos.
- La actualización del beneficio debe completarse en ≤ 3 segundos.
- La consulta de historial de cambios debe responder en ≤ 2 segundos.

---

## 14. Consideraciones de Seguridad

### CS-CB-01

Solo el Ejecutivo de Admisión puede acceder a esta funcionalidad.

### CS-CB-02

Todo cambio debe quedar registrado con identificación del usuario.

### CS-CB-03

No se permite la modificación masiva de beneficios.

### CS-CB-04

El sistema debe validar la sesión activa antes de cada cambio.

---

## 15. Impactos

### 15.1 Módulos Afectados

- Admisión (principal)
- Job de Admisión (reevaluación)
- Auditoría (registro de cambios)

### 15.2 Integraciones

- XHIS (validación de beneficios)
- Sistema de auditoría (registro de cambios)

---

## 16. Fuente de Verdad

Este documento constituye la referencia oficial para la funcionalidad Cambio de Beneficio en el sistema AUNADOS.

Audiencias:

- Desarrollo
- QA
- UAT
- Negocio
- Auditoría
