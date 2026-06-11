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

La pantalla mostrará las siguientes columnas:

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

### 13.1 Descripción de Columnas Específicas

#### Devoluciones administrativas

Muestra la cantidad de motivos de devolución de tipo administrativo registrados para el encuentro.

#### Devoluciones médicas

Muestra la cantidad de motivos de devolución de tipo médico registrados para el encuentro.

#### Devoluciones de proceso

Muestra la cantidad de motivos de devolución de tipo proceso registrados para el encuentro.

---

## 14. Detalle del Encuentro Devuelto

Cuando el Ejecutivo de Admisión accede al detalle de un encuentro devuelto, el sistema muestra:

### Información Visualizada

- **Motivos de devolución:** Lista completa de motivos registrados por Facturación
- **Comentarios:** Comentarios adicionales registrados durante la devolución (si los hay)
- **Estado del encuentro:** "Devuelto"
- **Datos del paciente:** Información completa del paciente
- **Datos del encuentro:** Información general del encuentro
- **Datos del seguro:** Información de cobertura y garante

### Información NO Visualizada

El Ejecutivo de Admisión **NO** visualiza en el detalle:

- Fecha de la devolución
- Usuario que devolvió el encuentro

---

#### RN-ED-025

El detalle del encuentro devuelto debe mostrar únicamente los motivos de devolución, comentarios y estado, sin incluir la fecha ni el usuario que realizó la devolución.

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

## 27. Fuente de Verdad

Este documento constituye la especificación funcional oficial de la funcionalidad Encuentros Devueltos del sistema AUNADOS y deberá ser utilizado como referencia para Análisis Funcional, Desarrollo, QA, Automatización y UAT.
