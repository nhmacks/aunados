# 00-Contexto-General.md

# Contexto General del Sistema AUNADOS

## 1. Introducción

AUNADOS es una plataforma utilizada para la gestión operativa de encuentros de atención médica.

La gestión de encuentros se encuentra organizada mediante bandejas operativas:

- Admisión
- Protocolo
- Facturación

## 2. Objetivo del Sistema

Permitir el seguimiento integral de encuentros, validando documentación administrativa, sustentos médicos y exámenes de laboratorio antes de su facturación.

## 3. Fuente de Información

### XHIS

Sistema origen de los encuentros y datos asociados:

- Pacientes
- Encuentros
- Prestaciones
- Garantes
- Productos
- Beneficios
- Laboratorios

## 4. Job de Admisión

Proceso automático responsable de:

- Obtener información desde XHIS.
- Evaluar reglas de negocio.
- Clasificar encuentros.
- Determinar la bandeja correspondiente.

### Clasificaciones posibles

- Admisión
- Protocolo
- Facturación

### Consideración importante

La clasificación de bandejas es responsabilidad exclusiva del Job de Admisión.

## 5. Flujo General

XHIS → Job de Admisión → Admisión / Protocolo / Facturación

## 6. Bandeja de Admisión

Un encuentro permanece en Admisión cuando presenta al menos una condición:

- Documentación administrativa pendiente.
- Exámenes de laboratorio pendientes.
- Exámenes de laboratorio no imputados.

## 7. Bandeja de Protocolo

Requisitos:

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.

### Consulta Externa No Oncosalud

Menor a 7 días.

### Consulta Externa Oncosalud

Menor o igual a 31 días.

### Emergencia

Menor o igual a 2 días.

## 8. Bandeja de Facturación

Requisitos:

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.

### Consulta Externa No Oncosalud

Mayor a 7 días.

### Consulta Externa Oncosalud

Mayor a 31 días.

### Emergencia

Mayor a 2 días.

## 9. Estados Operativos

- Pendiente
- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- En Proceso
- Tramitado
- No Facturable
- Error de Facturación

### Importante

Los estados operativos NO determinan la bandeja donde se encuentra el encuentro.

## 10. Relación entre Estados y Bandejas

Los estados operativos y las bandejas son conceptos independientes.

La bandeja es determinada exclusivamente por el Job de Admisión.

## 11. Roles del Sistema

### 11.1 Roles de Admisión

#### Superusuario de Admisión

Visualiza todos los encuentros y puede gestionar estados.

Acceso a:
- Cuadro de Control
- Encuentros Devueltos
- Lista de Encuentros

#### Gestor de A

Posee los mismos permisos que el Superusuario de Admisión.

#### Ejecutivo de Admisión

Visualiza únicamente:

- Encuentros creados por él.
- Encuentros de su sede.
- Encuentros clasificados para Admisión.

Acceso a:
- Encuentros Devueltos
- Lista de Encuentros
- Cambio de Beneficio

### 11.2 Roles de Facturación

#### Responsable de Facturación

Perfil con acceso operativo sobre la bandeja de Facturación.

Responsable de asignar encuentros a los Ejecutivos de Facturación.

Acceso a:
- Asignaciones Masivas
- Lista de Encuentros (Bandeja de Facturación)
- Cuadro de Control

#### Ejecutivo de Facturación

Perfil operativo que procesa la facturación de encuentros asignados.

Visualiza únicamente:
- Encuentros asignados a su usuario.
- Encuentros clasificados para Facturación.

Acceso a:
- Pendientes por Facturar

## 12. Principios Funcionales

- PF01: La clasificación es responsabilidad exclusiva del Job de Admisión.
- PF02: Los estados operativos no participan en la clasificación.
- PF03: Los usuarios no pueden mover manualmente encuentros entre bandejas.
- PF04: La información mostrada depende del rol autenticado.
- PF05: Las exportaciones respetan restricciones por rol.
- PF06: Los cambios de estado deben ser auditables.

## 13. Documentación Relacionada

- 01-Admision.md
- 02-Protocolo.md
- 03-Facturacion.md
- 04-Roles.md
- 05-Lista-Encuentros.md
- 06-Filtros.md
- 07-Detalle-Encuentro.md
- 08-Estados.md
- 09-Exportaciones.md
- 10-Reglas-Negocio.md
- 11-Casos-Uso.md
- 12-Gherkin.md
- 13-Trazabilidad.md
