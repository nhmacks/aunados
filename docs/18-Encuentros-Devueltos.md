# 18-Encuentros-Devueltos.md

# Encuentros Devueltos

## 1. Objetivo

La funcionalidad **Encuentros Devueltos** permite gestionar aquellos encuentros que han sido observados desde Facturación y requieren una corrección por parte de Admisión antes de continuar con el proceso normal de facturación.

La funcionalidad proporciona trazabilidad completa de las devoluciones realizadas, los motivos registrados, los comentarios ingresados, los usuarios involucrados y las acciones ejecutadas durante todo el ciclo de vida del encuentro.

---

## 2. Alcance

La funcionalidad comprende:

- Generación de devoluciones desde Facturación.
- Registro de motivos de devolución.
- Registro opcional de comentarios.
- Gestión de encuentros devueltos por Admisión.
- Regularización de observaciones.
- Reenvío del encuentro a Facturación.
- Reasignación del encuentro.
- Nuevas devoluciones.
- Historial de devoluciones.
- Auditoría completa.

---

## 3. Roles Involucrados

### Ejecutivo de Facturación

Responsable de:

- Detectar observaciones.
- Devolver encuentros.
- Registrar motivos de devolución.
- Registrar comentarios.
- Evaluar encuentros regularizados.
- Generar nuevas devoluciones.

---

### Responsable de Facturación

Responsable de:

- Recibir encuentros regularizados.
- Reasignar encuentros a Ejecutivos de Facturación.

---

### Ejecutivo de Admisión

Responsable de:

- Visualizar encuentros devueltos.
- Corregir observaciones.
- Regularizar encuentros.
- Reenviar encuentros a Facturación.

---

### Superusuario de Admisión

Visualiza todos los encuentros devueltos.

---

### Gestor TA

Visualiza todos los encuentros devueltos.

---

## 4. Definición de Encuentro Devuelto

Un encuentro devuelto es un encuentro que fue observado por Facturación debido a inconsistencias, documentación incompleta o errores que impiden continuar con el proceso de facturación.

La devolución genera una tarea para el Ejecutivo de Admisión responsable del encuentro.

---

## 5. Generación de una Devolución

### Punto de Inicio

Facturación → Pendientes por Facturar → Detalle del Encuentro

---

### Flujo Principal

#### Paso 1

El Ejecutivo de Facturación accede al detalle del encuentro.

#### Paso 2

Selecciona el botón:

**Devolver Encuentro**

#### Paso 3

El sistema muestra la sección Devoluciones.

---

## 6. Registro de Motivos de Devolución

El usuario deberá seleccionar los motivos que justifican la devolución.

---

### Restricciones

#### RN-ED-001

Debe registrarse al menos un motivo de devolución.

#### RN-ED-002

Se podrán registrar como máximo cuatro motivos.

#### RN-ED-003

No se permite registrar el mismo motivo más de una vez.

---

### Motivos Disponibles

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

La lista definitiva será administrada por negocio.

---

## 7. Registro de Comentarios

Debajo de la lista de motivos seleccionados se mostrará una caja de texto denominada:

**Comentarios**

---

### Características

- Campo opcional.
- Permite ingresar comentarios adicionales asociados a la devolución.
- No es obligatorio para completar la devolución.

---

#### RN-ED-004

El usuario podrá completar una devolución sin registrar comentarios.

---

#### RN-ED-005

El usuario podrá completar una devolución registrando comentarios.

---

#### RN-ED-006

La longitud máxima permitida para comentarios será de 400 caracteres.

---

#### RN-ED-007

Si el usuario supera los 400 caracteres, el sistema no permitirá continuar hasta ajustar el contenido.

---

## 8. Acciones Disponibles

### Agregar Devoluciones

Permite registrar la devolución.

---

### Cancelar

Cancela la operación actual.

---

#### RN-ED-008

Al seleccionar Cancelar se eliminarán los motivos y comentarios ingresados durante la operación actual.

---

## 9. Confirmación de Devolución

Al seleccionar Agregar Devoluciones se mostrará un modal.

---

### Mensaje

¿Deseas devolver el encuentro?

---

### Opciones

- Sí, devolver
- No, cancelar
- X (Cerrar)

---

#### RN-ED-009

La devolución únicamente se registrará cuando el usuario seleccione Sí, devolver.

---

#### RN-ED-010

No deberá registrarse ninguna devolución cuando el usuario seleccione No, cancelar o cierre el modal mediante la X.

---

## 10. Confirmación Exitosa

Una vez registrada la devolución el sistema mostrará un modal de confirmación.

---

### Mensaje

El encuentro ha sido devuelto a {Nombre Completo del Ejecutivo de Admisión} vía bandeja de admisión.

Ejemplo:

El encuentro ha sido devuelto a Ruth Evelyn Solís vía bandeja de admisión.

---

### Acción Disponible

Botón:

Entendido

---

#### RN-ED-011

Al seleccionar Entendido:

- Se cerrará el detalle.
- El usuario retornará a Pendientes por Facturar.

---

## 11. Bandeja Encuentros Devueltos

### Objetivo

Permitir al Ejecutivo de Admisión visualizar los encuentros devueltos para su regularización.

---

## 12. Restricciones por Rol

### Ejecutivo de Admisión

Visualiza únicamente:

- Encuentros devueltos asociados a su usuario.
- Encuentros originalmente gestionados por él.

---

#### RN-ED-012

El Ejecutivo de Admisión no podrá visualizar devoluciones pertenecientes a otros ejecutivos.

---

### Superusuario de Admisión

Visualiza todos los encuentros devueltos.

---

### Gestor TA

Visualiza todos los encuentros devueltos.

---

## 13. Grilla de Encuentros Devueltos

### 13.1 Columnas por Rol

Las columnas visibles en la grilla varían según el rol del usuario:

#### Ejecutivo de Admisión

El Ejecutivo de Admisión visualiza las siguientes columnas (10 columnas):

- Encuentro
- Estado
- Apellidos
- Nombres
- NºHC
- Garante
- Tipo de encuentro
- Fecha apert.
- Prioridad
- Monto

#### Gestor TA y Superusuario de Admisión

El Gestor TA y el Superusuario de Admisión visualizan todas las columnas (15 columnas):

- Sede
- Encuentro
- Estado
- Apellidos
- Nombres
- NºHC
- Usuario
- Garante
- Tipo de encuentro
- Fecha apert.
- Prioridad
- Devoluciones administrativas
- Devoluciones médicas
- Devoluciones de proceso
- Monto

---

### 13.2 Descripción de Columnas Específicas

#### Devoluciones administrativas

Muestra los motivos de devolución de tipo administrativo registrados para el encuentro. Si no existen devoluciones administrativas, se muestra un guion (-).

**Nota:** Esta columna solo es visible para Gestor TA y Superusuario de Admisión.

#### Devoluciones médicas

Muestra los motivos de devolución de tipo médico registrados para el encuentro. Si no existen devoluciones médicas, se muestra un guion (-).

**Nota:** Esta columna solo es visible para Gestor TA y Superusuario de Admisión.

#### Devoluciones de proceso

Muestra los motivos de devolución de tipo proceso registrados para el encuentro. Si no existen devoluciones de proceso, se muestra un guion (-).

**Nota:** Esta columna solo es visible para Gestor TA y Superusuario de Admisión.

#### Sede

Muestra la sede a la que pertenece el encuentro devuelto.

**Nota:** Esta columna solo es visible para Gestor TA y Superusuario de Admisión.

#### Usuario

Muestra el usuario (Ejecutivo de Admisión) que originalmente gestionó el encuentro.

**Nota:** Esta columna solo es visible para Gestor TA y Superusuario de Admisión.

---

## 14. Detalle del Encuentro Devuelto

Cuando un usuario accede al detalle de un encuentro devuelto, el sistema muestra una vista organizada en secciones expandibles para facilitar la navegación y evitar saturación de información.

---

### 14.1 Estructura del Detalle

La pantalla de detalle se organiza en las siguientes secciones:

**Sección Principal (siempre visible):**
- **Devoluciones:** Lista de motivos de devolución registrados por Facturación
- **Comentarios:** Campo de texto para comentarios (400 caracteres máximo)

**Secciones Expandibles (colapsadas por defecto):**
- **Datos generales:** Información básica del paciente (visible por defecto)
- **Datos de encuentro:** Información detallada del encuentro (colapsable)
- **Datos del seguro:** Información de cobertura y garante (colapsable)

---

### 14.2 Datos Generales (Visible por defecto)

Esta sección se muestra expandida por defecto y contiene:

- **Paciente:** Nombre completo del paciente
- **NHC:** Número de historia clínica
- **Ejecutivo(a) de admisión:** Usuario que gestionó el encuentro originalmente

---

### 14.3 Datos de Encuentro (Sección Expandible)

Esta sección está **colapsada por defecto** y muestra un indicador visual (▼) para expandirla.

Al hacer clic en "Datos de encuentro", se expande y muestra:

- **Nº de encuentro:** Número único del encuentro (8 dígitos)
- **Fecha de apertura:** Fecha en formato DD/MM/AAAA
- **Tipo de encuentro:** Tipo de atención (ej: CEX, Emergencia, etc.)
- **Prestación:** Descripción de la prestación (ej: CONSULTA MEDICA)

**Comportamiento:**
- Al hacer clic nuevamente, la sección se colapsa y oculta la información
- Puede permanecer expandida simultáneamente con otras secciones

---

### 14.4 Datos del Seguro (Sección Expandible)

Esta sección está **colapsada por defecto** y muestra un indicador visual (▼) para expandirla.

Al hacer clic en "Datos del seguro", se expande y muestra:

- **Nombre del garante:** Nombre de la aseguradora o garante
- **Producto:** Producto de seguro contratado
- **Plan copago:** Plan específico con copago
- **Beneficio:** Tipo de beneficio (ej: AMBULATORIA, EMERGENCIA, etc.)

**Comportamiento:**
- Al hacer clic nuevamente, la sección se colapsa y oculta la información
- Puede permanecer expandida simultáneamente con otras secciones

---

### 14.5 Interacción con Secciones Expandibles

**Expansión individual:**
- Cada sección se expande/colapsa de forma independiente al hacer clic en su encabezado
- El indicador visual cambia de dirección (▼ → ▲) cuando la sección está expandida

**Expansión múltiple:**
- El usuario puede expandir ambas secciones ("Datos de encuentro" y "Datos del seguro") simultáneamente
- No hay límite en la cantidad de secciones que pueden estar expandidas al mismo tiempo

**Estado persistente:**
- El estado (expandido/colapsado) de cada sección NO se persiste al salir y regresar al detalle
- Siempre se muestran en su estado por defecto (colapsadas) al acceder al detalle

---

### 14.6 Información Visualizada por Rol

Todos los roles (Ejecutivo de Admisión, Gestor TA, Superusuario de Admisión) visualizan la misma información en las secciones expandibles.

**Diferencias:**
- El **Ejecutivo de Admisión** solo visualiza encuentros de su responsabilidad
- El **Gestor TA** y **Superusuario** visualizan todos los encuentros
- El **Superusuario** además puede gestionar el encuentro (checkboxes, comentarios, cambio de estado)

---

### 14.7 Información NO Visualizada

Los usuarios **NO** visualizan en el detalle:

- Fecha de la devolución
- Usuario que devolvió el encuentro (quien registró la devolución desde Facturación)

---

#### RN-ED-025

El detalle del encuentro devuelto debe mostrar únicamente los motivos de devolución, comentarios y estado, sin incluir la fecha ni el usuario que realizó la devolución.

---

## 14.8 Gestión por Superusuario de Admisión

El Superusuario de Admisión tiene capacidades de gestión adicionales al visualizar el detalle de un encuentro devuelto.

---

### 14.8.1 Diferencias con el Ejecutivo de Admisión

| Aspecto | Ejecutivo de Admisión | Superusuario de Admisión |
|---------|----------------------|--------------------------|
| Visualización de motivos | Solo visualiza (sin checkboxes) | Visualiza con checkboxes interactivos |
| Marcar motivos como subsanados | No puede | Puede marcar/desmarcar cada motivo |
| Agregar comentarios | No | Sí (límite 400 caracteres) |
| Cambiar estado del encuentro | Limitado | Acceso completo a todos los estados |
| Acceso a estado "Regularizado" | No | Sí (condicionado) |

---

### 14.8.2 Checkboxes de Motivos de Devolución

Cuando el Superusuario accede al detalle del encuentro devuelto:

- Cada motivo de devolución muestra un **checkbox** a su lado
- El Superusuario puede **marcar** el checkbox para indicar que el motivo ha sido subsanado
- El Superusuario puede **desmarcar** el checkbox si el motivo aún no está resuelto
- Los checkboxes son interactivos y su estado se actualiza inmediatamente al hacer clic

---

### 14.8.3 Estados Disponibles

El Superusuario tiene acceso al siguiente dropdown de estados:

**Estados siempre disponibles:**
- Pago por adelantado
- No facturable
- Derivado a D.M (Dirección Médica)
- Derivado a Supervisor
- Error de vinculación
- Pendiente de revisión
- Terapia en proceso
- Error de facturación

**Estado condicionado:**
- **Regularizado** (solo disponible cuando TODOS los checkboxes de motivos están marcados)

---

### 14.8.4 Habilitación del Estado "Regularizado"

#### RN-ED-026

El estado "Regularizado" solo estará disponible en el dropdown cuando **TODOS** los checkboxes de motivos de devolución estén marcados.

**Comportamiento:**

1. **Checkboxes incompletos:**
   - Si falta marcar **al menos un** motivo
   - El estado "Regularizado" **NO** aparece en el dropdown
   - El Superusuario puede seleccionar cualquier otro estado

2. **Todos los checkboxes marcados:**
   - Cuando **TODOS** los motivos están marcados como subsanados
   - El estado "Regularizado" **aparece** en el dropdown
   - El Superusuario puede seleccionar "Regularizado"

3. **Desmarcado dinámico:**
   - Si el Superusuario desmarca un checkbox después de haber marcado todos
   - El estado "Regularizado" **desaparece inmediatamente** del dropdown
   - Si ya había seleccionado "Regularizado", la selección se debe cancelar

**Ejemplos:**

- Encuentro con 3 motivos → 0 marcados → "Regularizado" NO disponible
- Encuentro con 3 motivos → 1 marcado → "Regularizado" NO disponible
- Encuentro con 3 motivos → 2 marcados → "Regularizado" NO disponible
- Encuentro con 3 motivos → 3 marcados → "Regularizado" disponible ✓
- Encuentro con 1 motivo → 1 marcado → "Regularizado" disponible ✓

---

### 14.8.5 Campo de Comentarios

El Superusuario puede agregar comentarios al gestionar el encuentro:

**Características:**
- Campo de texto libre
- Límite: 400 caracteres
- Contador de caracteres visible: "0/400"
- No es obligatorio para cambiar el estado
- Se guarda en el historial del encuentro

---

### 14.8.6 Flujo de Regularización por Superusuario

**Pasos:**

1. El Superusuario accede al detalle del encuentro devuelto
2. Visualiza los motivos de devolución con sus checkboxes
3. Marca cada checkbox conforme subsana cada motivo
4. (Opcional) Agrega comentarios explicativos
5. Una vez marcados TODOS los checkboxes, el estado "Regularizado" aparece en el dropdown
6. Selecciona "Regularizado" del dropdown
7. Confirma el cambio de estado
8. El encuentro cambia a estado "Regularizado"
9. El encuentro abandona la bandeja "Encuentros Devueltos"
10. Se muestra mensaje: "Encuentro regularizado exitosamente"

---

### 14.8.7 Cambio de Estado sin Regularización

El Superusuario puede cambiar el estado del encuentro a cualquier otro estado **sin necesidad de marcar todos los checkboxes**.

**Ejemplo:**
- Si el encuentro debe ser derivado a Dirección Médica
- El Superusuario puede seleccionar "Derivado a D.M" directamente
- No requiere marcar ningún checkbox
- El encuentro cambia de estado inmediatamente

Esto permite al Superusuario tomar decisiones sobre encuentros que no pueden ser regularizados completamente por Admisión.

---

## 15. Sin Resultados

### Mensaje Principal

No encontramos resultados por atender.

---

### Mensaje Secundario

Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro.

---

## 16. Regularización

El Ejecutivo de Admisión es responsable de corregir las observaciones registradas.

Una vez regularizado el encuentro podrá reenviarlo a Facturación.

---

#### RN-ED-013

Los encuentros regularizados abandonan la bandeja Encuentros Devueltos.

---

## 17. Reenvío a Facturación

Cuando el encuentro es enviado nuevamente a Facturación:

- No será asignado automáticamente.
- Será recibido por el Responsable de Facturación.

---

#### RN-ED-014

Todo encuentro regularizado deberá pasar nuevamente por el proceso de asignación.

---

## 18. Reasignación

El Responsable de Facturación podrá asignar el encuentro:

- Al mismo Ejecutivo de Facturación.
- A un Ejecutivo diferente.

---

#### RN-ED-015

La reasignación es responsabilidad exclusiva del Responsable de Facturación.

---

## 19. Conservación del Estado

El encuentro deberá mantener el estado actualizado por Admisión.

Ejemplos:

- Regularizado
- No Facturable
- Error de Facturación

---

#### RN-ED-016

La reasignación no modifica el estado del encuentro.

---

## 20. Historial de Devoluciones

Cuando el Ejecutivo de Facturación vuelva a ingresar al detalle del encuentro visualizará:

- Motivos de devolución.
- Comentarios registrados.
- Fecha de devolución.
- Usuario que devolvió.
- Estado de resolución.

---

### Indicadores de Resolución

Los motivos corregidos mostrarán un indicador visual.

Ejemplo:

✓ Ampliación de Carta

---

#### RN-ED-017

Los motivos corregidos deberán mostrarse como subsanados.

---

## 21. Nueva Devolución

Si el Ejecutivo de Facturación identifica nuevas observaciones podrá generar una nueva devolución.

---

### Botón Disponible

Nueva Devolución

---

#### RN-ED-018

La opción Nueva Devolución solo estará disponible para encuentros previamente devueltos.

---

## 22. Confirmación de Nueva Devolución

### Mensaje Principal

¿Deseas devolver nuevamente el encuentro?

---

### Submensaje

Al continuar, se reemplazarán las devoluciones actuales por las nuevas.

Esta acción no se puede deshacer.

---

### Opciones

- Sí, devolver
- No, cancelar
- X (Cerrar)

---

#### RN-ED-019

La nueva devolución únicamente continuará cuando el usuario seleccione Sí, devolver.

---

## 23. Registro de Nuevos Motivos

Después de confirmar la nueva devolución el sistema mostrará nuevamente la sección Devoluciones.

---

### Restricciones

#### RN-ED-020

Mínimo un motivo.

#### RN-ED-021

Máximo cuatro motivos.

#### RN-ED-022

No se permiten motivos duplicados.

---

### Eliminación de Motivos

Cada motivo tendrá una opción X para eliminarlo antes del registro.

---

#### RN-ED-023

Los motivos podrán modificarse antes de registrar la nueva devolución.

---

## 24. Confirmación Exitosa de Nueva Devolución

El sistema mostrará:

El encuentro ha sido devuelto a {Nombre Ejecutivo de Admisión} vía bandeja de admisión.

Ejemplo:

El encuentro ha sido devuelto a César Augusto Melgar Obregón vía bandeja de admisión.

---

#### RN-ED-024

El nombre deberá corresponder al Ejecutivo de Admisión responsable.

---

## 25. Auditoría

El sistema deberá registrar:

- Usuario que devuelve.
- Usuario destinatario.
- Fecha y hora.
- Motivos de devolución.
- Comentarios registrados.
- Motivos resueltos.
- Nuevas devoluciones.
- Estados previos y posteriores.
- Responsable de Facturación que reasignó.
- Ejecutivo de Facturación asignado.

---

## 26. Trazabilidad

Todo encuentro deberá mantener trazabilidad completa:

Facturación
→ Devolución
→ Admisión
→ Regularización
→ Facturación
→ Nueva Devolución (si aplica)

Sin pérdida de historial.

---

## 27. Filtros Avanzados (Ejecutivo de Admisión)

### Objetivo

Permitir al Ejecutivo de Admisión filtrar los encuentros devueltos mediante modales interactivos con controles específicos para cada columna, facilitando la búsqueda y análisis de encuentros según criterios específicos.

---

### 27.1 Filtros Disponibles

El Ejecutivo de Admisión puede filtrar por las siguientes columnas:

1. **Estado**
2. **Fecha de apertura**
3. **Garante**
4. **Tipo de encuentro**
5. **Prioridad**

---

### 27.2 Comportamiento del Modal de Filtros

#### Apertura del Modal

- Cada columna filtrable muestra un **icono de filtro** en su encabezado
- Al hacer clic en el icono, se abre un modal específico para esa columna
- El modal se posiciona cerca de la columna para mejor contexto visual

#### Estructura General del Modal

Todos los modales de filtro contienen:

- **Título:** Nombre de la columna a filtrar
- **Controles de filtrado:** Varían según el tipo de columna
- **Botones de acción:**
  - **Limpiar:** Elimina todos los filtros aplicados en esa columna
  - **Aplicar:** Confirma y ejecuta el filtrado

#### Cierre del Modal

El modal se cierra cuando:
- El usuario hace clic en "Aplicar"
- El usuario hace clic en "Limpiar"
- El usuario hace clic fuera del modal
- El usuario presiona la tecla ESC

---

### 27.3 Filtro por Estado

#### Controles Disponibles

**Caja de búsqueda:**
- Ubicada en la parte superior del modal
- Permite buscar estados por texto
- Filtra la lista de estados mientras el usuario escribe

**Opciones de selección:**
- ☑ **Seleccionar todo:** Marca/desmarca todos los estados visibles
- ☐ Devuelto
- ☐ No facturable
- ☐ Error de facturación
- ☐ Regularizado
- ☐ Derivado a Supervisor
- ☐ Derivado a Dirección Médica

#### Comportamiento

**Búsqueda interna:**
- La búsqueda filtra los estados mostrados en el modal
- Los estados que no coinciden con la búsqueda se ocultan temporalmente
- Al limpiar la búsqueda, se muestran nuevamente todos los estados

**Seleccionar todo:**
- Al activar "Seleccionar todo", se marcan todos los checkboxes de estados visibles
- Al desactivar "Seleccionar todo", se desmarcan todos los checkboxes
- Si la búsqueda está activa, "Seleccionar todo" afecta solo a los estados filtrados

**Aplicar filtro:**
- Al hacer clic en "Aplicar", el sistema filtra la grilla mostrando solo encuentros con los estados seleccionados
- Si no se selecciona ningún estado, no se aplica filtro

**Limpiar filtro:**
- Al hacer clic en "Limpiar", se desmarcan todos los checkboxes
- El filtro de estado se elimina de la grilla

---

### 27.4 Filtro por Fecha de Apertura

#### Controles Disponibles

**Selector de operador:**
- Dropdown con las siguientes opciones:
  - **Igual a**
  - **Entre**
  - **Antes**
  - **Después**

**Campos de fecha:**
- Campos de entrada de fecha con calendario desplegable (date picker)
- Formato: DD/MM/AAAA
- Los campos disponibles cambian según el operador seleccionado

#### Comportamiento por Operador

**Igual a:**
- Muestra 1 campo de fecha
- Filtra encuentros cuya fecha de apertura coincide exactamente con la fecha seleccionada

**Entre:**
- Muestra 2 campos de fecha: "Desde" y "Hasta"
- Filtra encuentros cuya fecha de apertura está dentro del rango (inclusive)
- Validación: La fecha "Desde" no puede ser posterior a "Hasta"

**Antes:**
- Muestra 1 campo de fecha
- Filtra encuentros cuya fecha de apertura es anterior a la fecha seleccionada (no inclusive)

**Después:**
- Muestra 1 campo de fecha
- Filtra encuentros cuya fecha de apertura es posterior a la fecha seleccionada (no inclusive)

#### Validaciones

- No se permite aplicar el filtro si los campos requeridos están vacíos
- No se permite aplicar el filtro si la fecha "Desde" es posterior a "Hasta" (operador "Entre")
- Si las fechas son inválidas, se muestra un mensaje de error

**Limpiar filtro:**
- Al hacer clic en "Limpiar", se eliminan todas las fechas ingresadas
- El operador se mantiene en la última selección
- El filtro de fecha se elimina de la grilla

---

### 27.5 Filtro por Garante

#### Controles Disponibles

**Selector de operador:**
- Dropdown con la opción:
  - **Contiene** (deshabilitado - valor fijo)

**Campo de texto:**
- Input de texto libre
- Permite ingresar el nombre o parte del nombre del garante

#### Comportamiento

**Búsqueda por texto:**
- El sistema busca encuentros cuyo garante contiene el texto ingresado
- La búsqueda es case-insensitive (no distingue mayúsculas/minúsculas)
- La búsqueda es parcial (busca coincidencias en cualquier parte del nombre)

**Aplicar filtro:**
- Al hacer clic en "Aplicar", el sistema filtra mostrando solo encuentros cuyo garante contiene el texto ingresado
- Si el campo está vacío, no se aplica filtro

**Limpiar filtro:**
- Al hacer clic en "Limpiar", se elimina el texto ingresado
- El filtro de garante se elimina de la grilla

---

### 27.6 Filtro por Tipo de Encuentro

#### Controles Disponibles

**Caja de búsqueda:**
- Ubicada en la parte superior del modal
- Permite buscar tipos de encuentro por texto
- Filtra la lista de tipos mientras el usuario escribe

**Opciones de selección:**
- ☑ **Seleccionar todo:** Marca/desmarca todos los tipos visibles
- ☐ Ambulatorio
- ☐ Emergencia

#### Comportamiento

**Búsqueda interna:**
- La búsqueda filtra los tipos mostrados en el modal
- Los tipos que no coinciden con la búsqueda se ocultan temporalmente
- Al limpiar la búsqueda, se muestran nuevamente todos los tipos

**Seleccionar todo:**
- Al activar "Seleccionar todo", se marcan ambos checkboxes
- Al desactivar "Seleccionar todo", se desmarcan ambos checkboxes
- Si la búsqueda está activa, "Seleccionar todo" afecta solo a los tipos filtrados

**Aplicar filtro:**
- Al hacer clic en "Aplicar", el sistema filtra mostrando solo encuentros con los tipos seleccionados
- Si no se selecciona ningún tipo, no se aplica filtro

**Limpiar filtro:**
- Al hacer clic en "Limpiar", se desmarcan todos los checkboxes
- El filtro de tipo de encuentro se elimina de la grilla

---

### 27.7 Filtro por Prioridad

#### Controles Disponibles

**Caja de búsqueda:**
- Ubicada en la parte superior del modal
- Permite buscar prioridades por texto
- Filtra la lista de prioridades mientras el usuario escribe

**Opciones de selección:**
- ☑ **Seleccionar todo:** Marca/desmarca todas las prioridades visibles
- ☐ Alta
- ☐ Media
- ☐ Baja

#### Comportamiento

**Búsqueda interna:**
- La búsqueda filtra las prioridades mostradas en el modal
- Las prioridades que no coinciden con la búsqueda se ocultan temporalmente
- Al limpiar la búsqueda, se muestran nuevamente todas las prioridades

**Seleccionar todo:**
- Al activar "Seleccionar todo", se marcan todos los checkboxes
- Al desactivar "Seleccionar todo", se desmarcan todos los checkboxes
- Si la búsqueda está activa, "Seleccionar todo" afecta solo a las prioridades filtradas

**Aplicar filtro:**
- Al hacer clic en "Aplicar", el sistema filtra mostrando solo encuentros con las prioridades seleccionadas
- Si no se selecciona ninguna prioridad, no se aplica filtro

**Limpiar filtro:**
- Al hacer clic en "Limpiar", se desmarcan todos los checkboxes
- El filtro de prioridad se elimina de la grilla

---

### 27.8 Combinación de Filtros

**Múltiples filtros activos:**
- El Ejecutivo de Admisión puede aplicar múltiples filtros simultáneamente
- Los filtros se aplican con lógica **AND** (se muestran solo encuentros que cumplan TODOS los filtros)
- Ejemplo: Estado = "Devuelto" AND Prioridad = "Alta" AND Garante contiene "MAPFRE"

**Indicadores visuales:**
- Cada columna con filtro activo debe mostrar un indicador visual
- El indicador permite identificar rápidamente qué filtros están aplicados

**Persistencia:**
- Los filtros se mantienen al hacer scroll infinito
- Los filtros se mantienen al ordenar columnas
- Los filtros NO se mantienen al cerrar sesión

---

### 27.9 Restablecer Vista

Al seleccionar "Restablecer vista":
- Se eliminan TODOS los filtros aplicados
- Se eliminan las búsquedas por texto (caja de búsqueda general)
- Se restaura el ordenamiento por defecto (fecha de devolución descendente)
- Se muestra la grilla completa sin filtros

---

### 27.10 Validaciones Generales

**Filtros sin selección:**
- Si el usuario abre un modal de filtro y hace clic en "Aplicar" sin seleccionar ninguna opción, no se aplica filtro

**Fechas inválidas:**
- El sistema valida que las fechas ingresadas sean válidas
- No permite aplicar filtros con fechas mal formadas
- Muestra mensajes de error claros al usuario

**Búsqueda interna vs Filtro de grilla:**
- La búsqueda dentro del modal NO filtra la grilla, solo filtra las opciones del modal
- Para filtrar la grilla, el usuario debe seleccionar opciones y hacer clic en "Aplicar"

---

## 28. Ordenamiento de la Grilla

### Objetivo

Permitir a todos los usuarios ordenar la grilla de encuentros devueltos por columnas específicas para facilitar el análisis y gestión. Las columnas disponibles varían según el rol del usuario.

---

### 28.1 Roles con Permiso de Ordenamiento

**Todos los roles** (Ejecutivo de Admisión, Gestor TA, Superusuario de Admisión) pueden ordenar la grilla, pero con columnas diferentes según su rol.

---

### 28.2 Columnas Ordenables por Rol

#### Ejecutivo de Admisión

Puede ordenar por las siguientes **7 columnas**:

1. **Encuentro** - Ascendente / Descendente
2. **NºHC** - Ascendente / Descendente
3. **Apellidos** - Ascendente / Descendente
4. **Nombres** - Ascendente / Descendente
5. **Fecha apert.** - Ascendente / Descendente
6. **Garante** - Ascendente / Descendente
7. **Tipo de encuentro** - Ascendente / Descendente

**NO puede ordenar por:** Usuario, Monto

#### Gestor TA y Superusuario de Admisión

Pueden ordenar por las siguientes **8 columnas**:

1. **Encuentro** - Ascendente / Descendente
2. **Apellidos** - Ascendente / Descendente
3. **Nombres** - Ascendente / Descendente
4. **NºHC** - Ascendente / Descendente
5. **Usuario** - Ascendente / Descendente
6. **Garante** - Ascendente / Descendente
7. **Fecha apert.** - Ascendente / Descendente
8. **Monto** - Ascendente / Descendente

**NO pueden ordenar por:** Tipo de encuentro

---

### 28.3 Columnas NO Ordenables (Todos los Roles)

Las siguientes columnas NO permiten ordenamiento para ningún rol:

- Sede
- Estado
- Prioridad
- Devoluciones administrativas
- Devoluciones médicas
- Devoluciones de proceso

---

### 28.4 Orden por Defecto

Al acceder a la bandeja "Encuentros Devueltos", los encuentros se muestran ordenados por:

- **Fecha de devolución** en orden **descendente**
- Los encuentros más recientes aparecen primero

---

### 28.5 Comportamiento del Ordenamiento

**Persistencia:**
- El ordenamiento se mantiene al aplicar filtros
- El ordenamiento se mantiene al realizar búsquedas
- El ordenamiento se mantiene al hacer scroll infinito

**Cambio de ordenamiento:**
- Al ordenar por una columna diferente, el ordenamiento anterior se cancela
- Solo puede haber un ordenamiento activo a la vez

**Indicador visual:**
- Se muestra un indicador visual en la columna ordenada
- El indicador muestra la dirección del ordenamiento (ascendente/descendente)

**Valores vacíos o nulos:**
- En orden ascendente: valores vacíos aparecen al final
- En orden descendente: valores vacíos aparecen al principio

---

### 28.6 Restablecer Vista

Al seleccionar "Restablecer vista":
- El ordenamiento vuelve al orden por defecto
- Los encuentros se muestran ordenados por fecha de devolución descendente
- Se limpian todos los filtros aplicados

---

## 29. Exportación de Encuentros Devueltos

### Objetivo

Permitir a los usuarios descargar los datos de encuentros devueltos visibles en la grilla en formato Excel para análisis externos y reportes operativos.

---

### 29.1 Formato del Archivo

**Nombre del archivo:**
- Formato: `Encuentros_Devueltos_<hash>.xlsx`
- El hash es un identificador alfanumérico de 8 caracteres único por descarga
- Ejemplo: `Encuentros_Devueltos_RypkFtcu.xlsx`

**Extensión:**
- `.xlsx` (Microsoft Excel)

**Estructura:**
- Fila 1: Encabezados de columnas
- Fila 2 en adelante: Datos de encuentros devueltos

---

### 29.2 Columnas Exportadas

Todos los roles (Ejecutivo de Admisión, Gestor TA, Superusuario de Admisión) exportan las mismas 15 columnas en el siguiente orden:

1. Sede
2. Encuentro
3. Estado
4. Nº HC
5. Apellidos
6. Nombres
7. Fecha Apert.
8. Usuario
9. Garante
10. Tipo encuentro
11. Prioridad
12. Devoluciones administrativas
13. Devoluciones médicas
14. Devoluciones de proceso
15. Monto

**Nota importante:** El Ejecutivo de Admisión exporta columnas que NO visualiza en la grilla (Sede, Usuario, Devoluciones administrativas, Devoluciones médicas, Devoluciones de proceso).

---

### 29.3 Formato de Datos

**Fechas:**
- Formato: DD/MM/AAAA
- Ejemplo: 03/06/2026

**Encuentro:**
- Numérico de 8 dígitos sin notación científica

**Prioridad:**
- Valores: Alta, Media, Baja

**Devoluciones múltiples:**
- Separadas por coma (,)
- Ejemplo: "Acta Conformidad, Actualizar Datos Económicos"
- Si no hay devoluciones: guion (-)

**Monto:**
- Formato decimal con separadores correctos

---

### 29.4 Alcance de la Exportación

**Registros incluidos:**
- Se exportan TODOS los registros que cumplen con los filtros aplicados
- NO se limita a los registros visibles en pantalla (scroll infinito)
- Sin límite máximo de registros

**Filtros:**
- La exportación respeta todos los filtros activos
- La exportación respeta las búsquedas aplicadas
- La exportación respeta las restricciones de rol del usuario

---

### 29.5 Restricciones por Rol

**Ejecutivo de Admisión:**
- Solo exporta encuentros devueltos creados por él en su sede
- Aunque exporta 15 columnas, solo visualiza 10 en la grilla

**Gestor TA y Superusuario de Admisión:**
- Exportan todos los encuentros devueltos del sistema
- Las columnas exportadas coinciden con las visualizadas en la grilla

---

### 29.6 Tipo de Descarga

**Todos los roles:**
- Descarga inmediata al presionar el botón "Descargar"
- El archivo se genera y descarga sin demoras

---

### 29.7 Estado del Botón "Descargar"

**Habilitado:**
- Cuando existen encuentros devueltos visibles en la grilla

**Deshabilitado:**
- Cuando no hay encuentros devueltos
- Cuando se muestra el mensaje "No encontramos resultados por atender"

---

### 29.8 Compatibilidad

El archivo exportado debe poder abrirse correctamente en:
- Microsoft Excel
- Google Sheets
- LibreOffice Calc

---

## 30. Fuente de Verdad

Este documento constituye la especificación funcional oficial de la funcionalidad Encuentros Devueltos del sistema AUNADOS y deberá ser utilizado como referencia para Análisis Funcional, Desarrollo, QA, Automatización y UAT.
