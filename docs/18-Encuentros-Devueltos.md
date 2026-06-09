# 18-Encuentros-Devueltos.md

# Encuentros Devueltos

## 1. Objetivo

Permitir la gestión y seguimiento de encuentros que han sido devueltos para corrección o completar información faltante antes de continuar con el proceso de facturación.

---

## 2. Alcance

Esta funcionalidad opera dentro del módulo de Admisión y permite gestionar encuentros que requieren atención especial por presentar inconsistencias o información incompleta.

---

## 3. Roles Autorizados

- Superusuario de Admisión
- Gestor TA
- Ejecutivo de Admisión

---

## 4. Descripción Funcional

### 4.1 Definición

Un encuentro devuelto es aquel que ha sido identificado con observaciones o pendientes que impiden su avance en el flujo normal de Admisión → Protocolo → Facturación.

### 4.2 Motivos de Devolución

Los encuentros pueden ser devueltos por:

- Documentación administrativa incompleta o incorrecta.
- Información de laboratorio inconsistente.
- Datos del seguro incorrectos o faltantes.
- Inconsistencias en la vinculación del encuentro.
- Observaciones de auditoria o control de calidad.

---

## 5. Visualización

### 5.1 Lista de Encuentros Devueltos

La pantalla debe mostrar:

- Encuentro
- Paciente (Nombre y Apellidos)
- NHC
- Fecha de Devolución
- Motivo de Devolución
- Usuario Responsable
- Estado Actual
- Sede
- Prioridad

### 5.2 Restricciones por Rol

#### Superusuario y Gestor TA

Visualizan todos los encuentros devueltos sin restricciones de sede o usuario.

#### Ejecutivo de Admisión

Visualiza únicamente:

- Encuentros devueltos creados por él mismo.
- Encuentros devueltos de su sede.

---

## 6. Funcionalidades

### 6.1 Búsqueda

Permite buscar encuentros devueltos por:

- Nombre del paciente
- Apellido del paciente
- Número de encuentro
- NHC

### 6.2 Filtros

Permite filtrar por:

- Fecha de Devolución
- Motivo de Devolución
- Estado
- Sede (solo Superusuario y Gestor)
- Usuario Responsable (solo Superusuario y Gestor)
- Prioridad

### 6.3 Acciones Disponibles

- Ver detalle del encuentro
- Corregir información
- Marcar como resuelto
- Agregar observaciones
- Cambiar prioridad

---

## 7. Flujo Operativo

### 7.1 Flujo Principal

1. Un encuentro es marcado como devuelto por el sistema o usuario autorizado.
2. El encuentro aparece en la bandeja de Encuentros Devueltos.
3. El ejecutivo responsable visualiza el encuentro y el motivo de devolución.
4. El ejecutivo corrige la información o completa los datos faltantes.
5. El ejecutivo marca el encuentro como resuelto.
6. El encuentro regresa al flujo normal de clasificación del Job de Admisión.

### 7.2 Flujo Alterno - Escalamiento

1. Si el ejecutivo no puede resolver la devolución.
2. El ejecutivo puede escalar el encuentro a Supervisor o Dirección Médica.
3. El estado del encuentro se actualiza a "Derivado a Supervisor" o "Derivado a Dirección Médica".

---

## 8. Detalle del Encuentro Devuelto

Al acceder al detalle, se debe visualizar:

### 8.1 Información General

- Datos del paciente
- Datos del encuentro
- Datos del seguro

### 8.2 Información de Devolución

- Motivo de devolución
- Fecha de devolución
- Usuario que realizó la devolución
- Observaciones adicionales

### 8.3 Historial de Devoluciones

- Registro de devoluciones previas del mismo encuentro
- Acciones realizadas
- Fechas de resolución

---

## 9. Reglas de Negocio

### RN-ED-01

Los encuentros devueltos no avanzan en el flujo normal hasta ser resueltos.

### RN-ED-02

Un encuentro puede ser devuelto múltiples veces si persisten las observaciones.

### RN-ED-03

La devolución de un encuentro debe incluir obligatoriamente el motivo.

### RN-ED-04

El Ejecutivo de Admisión solo puede gestionar encuentros devueltos de su responsabilidad.

### RN-ED-05

Al marcar un encuentro como resuelto, este regresa a la evaluación del Job de Admisión.

### RN-ED-06

Toda devolución y resolución debe quedar registrada para auditoría.

### RN-ED-07

Los encuentros devueltos tienen prioridad en la gestión operativa.

---

## 10. Casos de Uso

### CU-ED-01: Consultar Encuentros Devueltos

**Actor:** Ejecutivo de Admisión

**Flujo Principal:**

1. El usuario accede a Encuentros Devueltos.
2. El sistema muestra la lista de encuentros devueltos asignados al usuario.
3. El usuario visualiza los encuentros pendientes de resolución.

### CU-ED-02: Resolver Encuentro Devuelto

**Actor:** Ejecutivo de Admisión

**Flujo Principal:**

1. El usuario selecciona un encuentro devuelto.
2. El sistema muestra el detalle y motivo de devolución.
3. El usuario corrige la información.
4. El usuario marca el encuentro como resuelto.
5. El sistema registra la resolución y actualiza el estado.

### CU-ED-03: Escalar Encuentro Devuelto

**Actor:** Ejecutivo de Admisión

**Flujo Principal:**

1. El usuario selecciona un encuentro devuelto que no puede resolver.
2. El usuario selecciona "Derivar a Supervisor" o "Derivar a Dirección Médica".
3. El sistema actualiza el estado y notifica al responsable correspondiente.

---

## 11. Consideraciones de Rendimiento

- La carga de encuentros devueltos debe ser rápida (≤ 3 segundos).
- Debe soportar scroll infinito para grandes volúmenes.
- Los filtros y búsquedas deben responder en ≤ 3 segundos.

---

## 12. Consideraciones de Auditoría

Toda acción sobre encuentros devueltos debe ser auditable:

- Devolución de encuentro (quién, cuándo, motivo)
- Resolución de encuentro (quién, cuándo, acciones)
- Escalamientos realizados
- Modificaciones de información
- Cambios de prioridad

---

## 13. Mensajes del Sistema

### 13.1 Éxito

**Encuentro Resuelto**

El encuentro ha sido marcado como resuelto y regresará al flujo normal de evaluación.

### 13.2 Advertencia

**Encuentro sin Motivo**

Debe especificar el motivo de devolución antes de continuar.

### 13.3 Error

**No se pudo Resolver**

En estos momentos no podemos procesar la resolución. Por favor, inténtelo nuevamente.

---

## 14. Fuente de Verdad

Este documento constituye la referencia oficial para la funcionalidad Encuentros Devueltos en el sistema AUNADOS.

Audiencias:

- Desarrollo
- QA
- UAT
- Negocio
