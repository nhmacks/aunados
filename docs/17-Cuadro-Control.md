# 17-Cuadro-Control.md

# Cuadro de Control

## 1. Objetivo

El Cuadro de Control permite supervisar y monitorear la distribución de carga de trabajo entre los ejecutivos, facilitando la gestión operativa y el seguimiento de encuentros asignados.

---

## 2. Alcance

Esta funcionalidad está disponible en dos áreas operativas:

- Admisión
- Facturación

---

## 3. Roles Autorizados

### 3.1 Cuadro de Control - Admisión

- Superusuario de Admisión
- Gestor de A

### 3.2 Cuadro de Control - Facturación

- Responsable de Facturación

---

## 4. Descripción Funcional

### 4.1 Cuadro de Control de Admisión

Permite visualizar información consolidada de los encuentros gestionados por los Ejecutivos de Admisión.

Facilita:

- Monitoreo de la carga de trabajo.
- Identificación de cuellos de botella.
- Supervisión del desempeño operativo.

### 4.2 Cuadro de Control de Facturación

Permite visualizar los encuentros que han sido asignados a cada Ejecutivo de Facturación.

Facilita:

- Seguimiento de asignaciones realizadas.
- Monitoreo de la carga de trabajo distribuida.
- Identificación de ejecutivos con mayor o menor carga.
- Supervisión del progreso de facturación.

---

## 5. Información Visualizada

### 5.1 Métricas Principales

El Cuadro de Control debe mostrar:

- Cantidad de encuentros por ejecutivo.
- Estado de los encuentros asignados.
- Distribución de carga de trabajo.

### 5.2 Filtros y Agrupaciones

Debe permitir:

- Filtrar por ejecutivo.
- Filtrar por estado.
- Filtrar por fecha.
- Agrupar por sede (Admisión).

---

## 6. Casos de Uso

### CU-CC-01: Consultar Distribución de Carga

**Actor:** Superusuario de Admisión / Responsable de Facturación

**Flujo Principal:**

1. El usuario accede al Cuadro de Control.
2. El sistema muestra la distribución de encuentros por ejecutivo.
3. El usuario visualiza métricas consolidadas.

### CU-CC-02: Identificar Cuellos de Botella

**Actor:** Responsable de Facturación

**Flujo Principal:**

1. El usuario accede al Cuadro de Control.
2. El usuario identifica ejecutivos con alta carga de trabajo.
3. El usuario toma decisiones de redistribución si es necesario.

---

## 7. Reglas de Negocio

### RN-CC-01

El Cuadro de Control solo es visible para roles supervisores.

### RN-CC-02

La información mostrada debe reflejar el estado actual de las asignaciones.

### RN-CC-03

El Cuadro de Control no permite modificar asignaciones directamente.

### RN-CC-04

En Admisión, el Cuadro de Control muestra encuentros de todos los ejecutivos.

### RN-CC-05

En Facturación, el Cuadro de Control muestra solo encuentros asignados.

---

## 8. Consideraciones de Rendimiento

- La carga de datos debe ser eficiente.
- Debe soportar grandes volúmenes de encuentros.
- Debe actualizarse en tiempo real o con frecuencia definida.

---

## 9. Consideraciones de Auditoría

- Los accesos al Cuadro de Control deben quedar registrados.
- Los filtros aplicados deben ser auditables.

---

## 10. Fuente de Verdad

Este documento constituye la referencia oficial para la funcionalidad Cuadro de Control en el sistema AUNADOS.

Audiencias:

- Desarrollo
- QA
- UAT
- Negocio
