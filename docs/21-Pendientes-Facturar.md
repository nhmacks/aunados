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

Si identifica inconsistencias, el Ejecutivo de Facturación puede devolver el encuentro al Ejecutivo de Admisión responsable para su regularización.

#### 8.2.1 Flujo de Devolución

1. El ejecutivo accede al detalle del encuentro.
2. Selecciona el botón "Devolver Encuentro".
3. El sistema muestra la sección "Devoluciones".
4. Selecciona entre uno y cuatro motivos de devolución.
5. Selecciona "Agregar Devoluciones".
6. El sistema muestra modal de confirmación: "¿Deseas devolver el encuentro?"
7. El ejecutivo selecciona "Sí, devolver".
8. El sistema registra la devolución.
9. El sistema muestra confirmación: "El encuentro ha sido devuelto a {Nombre del Ejecutivo de Admisión} vía bandeja de admisión".
10. El ejecutivo selecciona "Entendido".
11. El sistema cierra el detalle y retorna a Pendientes por Facturar.
12. El encuentro desaparece de la bandeja del Ejecutivo de Facturación.

#### 8.2.2 Selección de Motivos

El ejecutivo debe seleccionar entre uno y cuatro motivos de devolución.

**Motivos disponibles:**

- Acta Conformidad
- Actualizar Datos Económicos
- Adjuntar Oncosys
- Ampliación de Carta
- Área Devoluciones
- Autorización No Válida
- Carta de Garantía por Consulta
- Carta de Garantía por Imagen
- Carta de Garantía por Laboratorio
- Carta de Garantía por Medicamentos
- Carta de Garantía por Procedimiento
- Carta de Garantía por Terapias
- Carta de Terapia Incompleta
- Carta Terapia Errónea
- CG
- CG Ampliatoria
- CG Anulada
- CG Errada
- CG Ilegible
- CG Usada
- Código de Autorización Usado
- Denuncia Policial
- Doble Consulta
- Doble Garante
- Duplicidad de Gastos
- Error Beneficio
- Error Copago
- Error Deducible
- Error CIE10

**Nota:** La lista definitiva será administrada por negocio.

#### 8.2.3 Botones Disponibles

**Agregar Devoluciones:**
- Habilitado cuando se selecciona al menos un motivo.
- Permite continuar con el proceso de devolución.

**Cancelar:**
- Permite cancelar completamente el proceso de devolución.
- Elimina todos los motivos seleccionados durante la operación actual.

#### 8.2.4 Modal de Confirmación

Al seleccionar "Agregar Devoluciones", el sistema muestra:

**Mensaje:** ¿Deseas devolver el encuentro?

**Opciones:**
- Sí, devolver
- No, cancelar
- Cerrar (X)

Si el usuario selecciona "No, cancelar" o cierra el modal, no se realiza ninguna devolución.

La devolución solo se ejecuta cuando el usuario selecciona "Sí, devolver".

#### 8.2.5 Confirmación Exitosa

Cuando la devolución es registrada exitosamente:

**Mensaje:** El encuentro ha sido devuelto a {Nombre Completo del Ejecutivo de Admisión} vía bandeja de admisión.

**Ejemplo:** El encuentro ha sido devuelto a Ruth Evelyn Solís vía bandeja de admisión.

**Botón:** Entendido

Al seleccionar "Entendido":
- El sistema cierra el detalle del encuentro.
- El sistema retorna a la pantalla Pendientes por Facturar.
- El encuentro deja de estar disponible en la bandeja del Ejecutivo de Facturación.
- El encuentro aparece en Encuentros Devueltos del Ejecutivo de Admisión responsable.

### 8.3 Solicitar Soporte

Si requiere apoyo:

1. Selecciona "Solicitar Soporte".
2. Ingresa descripción del problema.
3. El sistema notifica al Responsable de Facturación.
4. El encuentro se marca como "En Revisión".

### 8.4 Cambiar Estado del Encuentro

El Ejecutivo de Facturación puede cambiar manualmente el estado del encuentro desde el detalle del mismo.

---

#### 8.4.1 Acceso al Cambio de Estado

1. El ejecutivo accede al detalle del encuentro.
2. Selecciona el **Estado actual** en la parte superior de la pantalla.
3. El sistema muestra la lista de estados disponibles.

---

#### 8.4.2 Estados Disponibles

El ejecutivo puede cambiar el estado del encuentro a:

- **Por facturar**
- **En revisión**
- **Facturado**

---

#### 8.4.3 Cambiar Estado a "Por facturar"

Cuando el ejecutivo selecciona el estado **"Por facturar"**:

**Modal de Confirmación:**

- **Mensaje principal:** ¿Deseas marcar el encuentro como por facturar?
- **Submensaje:** El encuentro será marcado como por facturar, listo para el proceso de facturación.
- **Opciones:**
  - Botón: **No, cancelar**
  - Botón: **Sí, cambiar estado**
  - Botón: **X** (cerrar modal en la parte superior)

**Al seleccionar "No, cancelar" o "X":**

- El modal se cierra.
- El sistema retorna al detalle del encuentro.
- No se realiza ningún cambio.

**Al seleccionar "Sí, cambiar estado":**

1. El sistema actualiza el estado del encuentro a **"Por facturar"**.
2. El sistema cierra la pantalla de detalle.
3. El sistema retorna al usuario a **"Pendientes por Facturar"**.
4. El sistema recarga la pantalla.
5. El encuentro se muestra con el nuevo estado **"Por facturar"**.

---

#### 8.4.4 Cambiar Estado a "En revisión"

Cuando el ejecutivo selecciona el estado **"En revisión"**:

**Modal de Confirmación:**

- **Mensaje principal:** ¿Deseas marcar el encuentro como en revisión?
- **Submensaje:** El encuentro quedará en tu bandeja para que puedas seguir trabajándolo cuando lo necesites.
- **Opciones:**
  - Botón: **No, cancelar**
  - Botón: **Sí, cambiar estado**
  - Botón: **X** (cerrar modal en la parte superior)

**Al seleccionar "No, cancelar" o "X":**

- El modal se cierra.
- El sistema retorna al detalle del encuentro.
- No se realiza ningún cambio.

**Al seleccionar "Sí, cambiar estado":**

1. El sistema actualiza el estado del encuentro a **"En revisión"**.
2. El sistema cierra la pantalla de detalle.
3. El sistema retorna al usuario a **"Pendientes por Facturar"**.
4. El sistema recarga la pantalla.
5. El encuentro se muestra con el nuevo estado **"En revisión"**.
6. El encuentro permanece en la bandeja del ejecutivo.

---

#### 8.4.5 Cambiar Estado a "Facturado"

Cuando el ejecutivo selecciona el estado **"Facturado"**:

**Modal de Confirmación:**

- **Mensaje principal:** ¿Deseas marcar el encuentro como facturado?
- **Submensaje:** Al marcar el encuentro como facturado ya no podrás hacer cambios ni devolverlo.
- **Opciones:**
  - Botón: **No, cancelar**
  - Botón: **Sí, cambiar estado**
  - Botón: **X** (cerrar modal en la parte superior)

**Al seleccionar "No, cancelar" o "X":**

- El modal se cierra.
- El sistema retorna al detalle del encuentro.
- No se realiza ningún cambio.

**Al seleccionar "Sí, cambiar estado":**

1. El sistema actualiza el estado del encuentro a **"Facturado"**.
2. El sistema cierra la pantalla de detalle.
3. El sistema retorna al usuario a **"Pendientes por Facturar"**.
4. El sistema recarga la pantalla.
5. El encuentro **YA NO** se muestra en la bandeja (porque fue facturado).
6. El encuentro sale de Pendientes por Facturar.

---

### 8.5 Agregar Observaciones

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
2. Selecciona el botón "Devolver Encuentro".
3. El sistema muestra la sección "Devoluciones" con lista de motivos disponibles.
4. El ejecutivo selecciona entre uno y cuatro motivos de devolución.
5. El sistema habilita el botón "Agregar Devoluciones".
6. El ejecutivo selecciona "Agregar Devoluciones".
7. El sistema muestra modal: "¿Deseas devolver el encuentro?"
8. El ejecutivo selecciona "Sí, devolver".
9. El sistema registra la devolución con los motivos seleccionados.
10. El sistema actualiza el estado a "Devuelto".
11. El sistema muestra modal: "El encuentro ha sido devuelto a {Nombre del Ejecutivo de Admisión} vía bandeja de admisión".
12. El ejecutivo selecciona "Entendido".
13. El sistema cierra el detalle y retorna a Pendientes por Facturar.
14. El encuentro desaparece de la bandeja del Ejecutivo de Facturación.
15. El encuentro aparece en Encuentros Devueltos del Ejecutivo de Admisión responsable.
16. El ejecutivo continúa con el siguiente encuentro.

### 10.3 Flujo Alterno - Solicitar Soporte

1. El ejecutivo encuentra un caso complejo que requiere soporte.
2. Selecciona "Solicitar Soporte".
3. Ingresa descripción del problema o consulta.
4. Confirma la solicitud.
5. El sistema notifica al Responsable de Facturación.
6. El estado del encuentro se actualiza a "En Revisión".
7. El ejecutivo espera respuesta o puede continuar con otros encuentros.

### 10.4 Flujo Alterno - Cambiar Estado del Encuentro

1. El ejecutivo accede al detalle del encuentro.
2. Selecciona el "Estado actual" en la parte superior.
3. El sistema muestra la lista de estados disponibles.
4. El ejecutivo selecciona el estado deseado (Por facturar, En revisión, o Facturado).
5. El sistema muestra un modal de confirmación con el mensaje correspondiente.
6. El ejecutivo selecciona "Sí, cambiar estado".
7. El sistema actualiza el estado del encuentro.
8. El sistema cierra la pantalla de detalle.
9. El sistema retorna a Pendientes por Facturar.
10. El sistema recarga la pantalla.
11. El encuentro se muestra con el nuevo estado (o desaparece si fue marcado como "Facturado").

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

La devolución de encuentros requiere motivo obligatorio (mínimo uno, máximo cuatro).

### RN-PF-11 (RN-ED-08)

Debe seleccionarse como mínimo un motivo de devolución.

### RN-PF-12 (RN-ED-09)

Pueden seleccionarse como máximo cuatro motivos de devolución.

### RN-PF-13 (RN-ED-10)

No se permite seleccionar el mismo motivo más de una vez en una misma devolución.

### RN-PF-14 (RN-ED-11)

Al seleccionar Cancelar se eliminarán todos los motivos seleccionados durante la operación actual.

### RN-PF-15 (RN-ED-12)

Si el usuario selecciona "No, cancelar" o cierra el modal mediante la X, no deberá realizarse ninguna devolución.

### RN-PF-16 (RN-ED-13)

La devolución solo se ejecutará cuando el usuario seleccione "Sí, devolver".

### RN-PF-17 (RN-ED-14)

Al seleccionar "Entendido" después de una devolución exitosa:
- El sistema cerrará el detalle del encuentro.
- El sistema retornará al usuario a la pantalla Pendientes por Facturar.
- El encuentro dejará de estar disponible para gestión inmediata dentro de la bandeja actual de facturación.

### RN-PF-18 (RN-ED-16)

Toda devolución debe quedar asociada al usuario que la realizó.

### RN-PF-19 (RN-ED-17)

Toda devolución debe almacenar la fecha y hora de registro.

### RN-PF-20 (RN-ED-18)

Toda devolución debe registrar los motivos seleccionados.

### RN-PF-21 (RN-ED-19)

Un encuentro puede contener entre uno y cuatro motivos activos de devolución.

### RN-PF-22 (RN-ED-20)

El mismo motivo no puede registrarse más de una vez dentro de una misma devolución.

### RN-PF-23 (RN-ED-21)

Las devoluciones forman parte del historial auditable del encuentro.

### RN-PF-24

El Ejecutivo de Facturación puede cambiar manualmente el estado del encuentro desde el detalle.

### RN-PF-25

Los estados disponibles para cambio manual son: Por facturar, En revisión, y Facturado.

### RN-PF-26

El cambio de estado requiere confirmación mediante modal.

### RN-PF-27

Al cancelar el modal de cambio de estado, no se realiza ninguna modificación y el usuario permanece en el detalle.

### RN-PF-28

Al cambiar el estado a "Por facturar" o "En revisión", el encuentro permanece en la bandeja del ejecutivo.

### RN-PF-29

Al cambiar el estado a "Facturado", el encuentro desaparece de la bandeja del ejecutivo.

### RN-PF-30

Al confirmar un cambio de estado a "Facturado", el encuentro NO puede ser modificado ni devuelto posteriormente.

### RN-PF-31

Todo cambio de estado debe quedar registrado en auditoría con: usuario, fecha, hora, estado anterior y estado nuevo.

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

**Precondiciones:**
- Usuario autenticado como Ejecutivo de Facturación
- Tiene un encuentro asignado
- Ha identificado inconsistencias en el encuentro

**Flujo Principal:**

1. El usuario ingresa a Pendientes por Facturar.
2. El usuario selecciona un encuentro asignado.
3. El usuario ingresa al Detalle del Encuentro.
4. El usuario identifica que faltan sustentos médicos.
5. El usuario selecciona el botón "Devolver Encuentro".
6. El sistema muestra la sección "Devoluciones" con lista de motivos.
7. El usuario selecciona el motivo "Faltan sustentos médicos".
8. El usuario puede seleccionar hasta 3 motivos adicionales (opcional).
9. El sistema habilita el botón "Agregar Devoluciones".
10. El usuario selecciona "Agregar Devoluciones".
11. El sistema muestra modal de confirmación: "¿Deseas devolver el encuentro?"
12. El usuario selecciona "Sí, devolver".
13. El sistema registra la devolución con los motivos seleccionados.
14. El sistema actualiza el estado del encuentro a "Devuelto".
15. El sistema muestra modal de confirmación: "El encuentro ha sido devuelto a {Nombre del Ejecutivo de Admisión} vía bandeja de admisión".
16. El usuario selecciona "Entendido".
17. El sistema cierra el detalle del encuentro.
18. El sistema retorna al usuario a Pendientes por Facturar.
19. El encuentro desaparece de la bandeja del Ejecutivo de Facturación.
20. El encuentro aparece en Encuentros Devueltos del Ejecutivo de Admisión responsable.

**Flujo Alterno 1: Cancelar durante selección de motivos**

6a. El usuario selecciona "Cancelar" en la sección de Devoluciones.
6b. El sistema elimina todos los motivos seleccionados.
6c. El sistema cierra la sección de Devoluciones.
6d. El usuario permanece en el detalle del encuentro.

**Flujo Alterno 2: Cancelar en modal de confirmación**

12a. El usuario selecciona "No, cancelar" o cierra el modal (X).
12b. El sistema cierra el modal de confirmación.
12c. No se realiza ninguna devolución.
12d. El usuario permanece en el detalle del encuentro con los motivos seleccionados.

**Postcondiciones:**
- El encuentro ha sido devuelto al Ejecutivo de Admisión responsable
- El encuentro tiene entre 1 y 4 motivos de devolución registrados
- El Ejecutivo de Admisión puede visualizar el encuentro en Encuentros Devueltos
- La devolución está registrada en auditoría con usuario, fecha, hora y motivos
- El encuentro ya no aparece en Pendientes por Facturar del Ejecutivo de Facturación

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

**Modal de Confirmación de Devolución**

Título: ¿Deseas devolver el encuentro?

Opciones:
- Sí, devolver
- No, cancelar
- Cerrar (X)

**Devolución Exitosa**

Mensaje: El encuentro ha sido devuelto a {Nombre Completo del Ejecutivo de Admisión} vía bandeja de admisión.

Ejemplo: El encuentro ha sido devuelto a Ruth Evelyn Solís vía bandeja de admisión.

Botón: Entendido

**Modal de Cambio de Estado - Por facturar**

Título: ¿Deseas marcar el encuentro como por facturar?

Submensaje: El encuentro será marcado como por facturar, listo para el proceso de facturación.

Opciones:
- Sí, cambiar estado
- No, cancelar
- X (Cerrar)

**Modal de Cambio de Estado - En revisión**

Título: ¿Deseas marcar el encuentro como en revisión?

Submensaje: El encuentro quedará en tu bandeja para que puedas seguir trabajándolo cuando lo necesites.

Opciones:
- Sí, cambiar estado
- No, cancelar
- X (Cerrar)

**Modal de Cambio de Estado - Facturado**

Título: ¿Deseas marcar el encuentro como facturado?

Submensaje: Al marcar el encuentro como facturado ya no podrás hacer cambios ni devolverlo.

Opciones:
- Sí, cambiar estado
- No, cancelar
- X (Cerrar)

### 15.2 Advertencias

**Motivo de Devolución Obligatorio**

Título: Motivo requerido

Descripción: Debe seleccionar al menos un motivo de devolución antes de continuar.

**Límite de Motivos Excedido**

Título: Límite de motivos

Descripción: Solo puede seleccionar hasta cuatro motivos de devolución.

**Motivo Duplicado**

Título: Motivo ya seleccionado

Descripción: No puede seleccionar el mismo motivo más de una vez.

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
