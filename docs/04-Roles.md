# 04-Roles.md

# Roles y Permisos del Sistema AUNADOS

## 1. Objetivo

Definir los perfiles autorizados para interactuar con las bandejas operativas del sistema AUNADOS y establecer claramente los permisos, restricciones y capacidades de cada rol.

---

# 2. Roles Definidos

Actualmente el sistema contempla los siguientes perfiles:

## 2.1 Roles de Admisión

- Superusuario de Admisión
- Gestor de A
- Ejecutivo de Admisión

## 2.2 Roles de Facturación

- Responsable de Facturación
- Ejecutivo de Facturación

---

# 3. Principios Generales de Seguridad

## PR01

Todo acceso debe realizarse mediante autenticación previa.

## PR02

La información visible dependerá del rol autenticado.

## PR03

Los permisos se aplican tanto a la visualización como a las acciones disponibles.

## PR04

Los usuarios únicamente podrán visualizar información autorizada para su perfil.

---

# 4. Superusuario de Admisión

## 4.1 Descripción

Perfil con acceso operativo completo sobre la bandeja de Admisión.

Puede gestionar encuentros clasificados en Admisión independientemente de la sede o usuario creador.

---

## 4.2 Funcionalidades Disponibles

El Superusuario de Admisión tiene acceso a las siguientes funcionalidades:

- Cuadro de Control
- Encuentros Devueltos
- Lista de Encuentros

---

## 4.3 Visibilidad

Puede visualizar:

- Todas las sedes.
- Todos los usuarios.
- Todos los encuentros clasificados para Admisión.
- Todos los garantes.
- Todos los estados.
- Todos los sustentos.

---

## 4.4 Lista de Encuentros

Visualiza las columnas:

- Sede
- Encuentro
- Estado
- NHC
- Apellidos
- Nombres
- Fecha de Apertura
- Prioridad
- Usuario
- Garante
- Tipo de Encuentro
- Sustentos Administrativos
- Sustentos Médicos
- Sustentos de Proceso
- Monto

---

## 4.5 Filtros Disponibles

Puede utilizar:

- Sede
- Estado
- Fecha Apertura
- Prioridad
- Usuario
- Garante
- Tipo de Encuentro
- Sustentos Administrativos
- Sustentos Médicos

---

## 4.6 Ordenamiento

Puede ordenar por:

- Encuentro
- NHC
- Apellidos
- Nombres
- Fecha de Apertura
- Usuario
- Garante
- Tipo de Encuentro
- Monto

---

## 4.7 Exportación

Puede descargar:

- Todos los registros visibles.
- Registros filtrados.
- Registros resultantes de búsquedas.

La descarga es inmediata.

---

## 4.8 Detalle del Encuentro

Puede visualizar:

### Datos Generales

- Paciente
- NHC
- Ejecutivo Responsable

### Datos del Encuentro

- Número de Encuentro
- Fecha de Apertura
- Tipo de Encuentro
- Prestación

### Datos del Seguro

- Garante
- Producto
- Plan Copago
- Beneficio
- Código de Autorización

### Sustentos

- Sustentos Administrativos
- Sustentos Médicos
- Sustentos de Proceso

---

## 4.9 Cambio de Estado

Puede asignar:

- Pago por Adelantado
- No Facturable
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- En Proceso
- Error de Facturación
- Tramitado

---

# 5. Gestor de A

## 5.1 Descripción

Perfil con capacidades funcionales equivalentes al Superusuario de Admisión para la funcionalidad actualmente definida.

---

## 5.2 Permisos

Posee exactamente los mismos permisos que:

- Superusuario de Admisión

Incluyendo:

- Visualización
- Filtros
- Exportación
- Ordenamiento
- Gestión de Estados
- Consulta de Detalles

---

## 5.3 Restricciones

Actualmente no existen diferencias funcionales documentadas respecto al Superusuario.

---

# 6. Ejecutivo de Admisión

## 6.1 Descripción

Perfil operativo encargado de gestionar encuentros creados por él mismo dentro de su sede asignada.

---

## 6.2 Funcionalidades Disponibles

El Ejecutivo de Admisión tiene acceso a las siguientes funcionalidades:

- Encuentros Devueltos
- Lista de Encuentros
- Cambio de Beneficio

---

## 6.3 Restricciones de Visibilidad

Solo podrá visualizar encuentros que cumplan simultáneamente:

- Fueron creados por el usuario autenticado.
- Corresponden a su sede.
- Fueron clasificados para Admisión.

---

## 6.4 Lista de Encuentros

Visualiza únicamente:

- Encuentro
- Estado
- NHC
- Apellidos
- Nombres
- Fecha de Apertura
- Prioridad
- Garante
- Tipo de Encuentro

---

## 6.5 Filtros Disponibles

Puede utilizar:

- Estado
- Fecha Apertura
- Prioridad
- Garante
- Tipo de Encuentro

Además:

- Búsqueda por Nombre.
- Búsqueda por Apellido.
- Búsqueda por Número de Encuentro.

---

## 6.6 Ordenamiento

No posee permisos de ordenamiento.

---

## 6.7 Exportación

La exportación es asíncrona.

Flujo:

1. Solicita la descarga.
2. El sistema genera el archivo.
3. Se crea una notificación.
4. El usuario descarga el archivo desde la campana.

---

## 6.8 Detalle del Encuentro

Puede visualizar:

### Datos del Paciente

- Nombres
- Apellidos
- NHC

### Datos del Encuentro

- Encuentro
- Fecha de Apertura
- Tipo de Encuentro
- Prestación

### Datos del Seguro

- Garante
- Producto
- Plan Copago
- Beneficio
- Código de Autorización

---

## 6.9 Cambio de Estado

Puede asignar:

- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- Tramitado

---

# 7. Responsable de Facturación

## 7.1 Descripción

Perfil con acceso operativo sobre la bandeja de Facturación.

Responsable de asignar encuentros a los Ejecutivos de Facturación y supervisar el proceso de facturación.

---

## 7.2 Funcionalidades Disponibles

El Responsable de Facturación tiene acceso a las siguientes funcionalidades:

- Asignaciones Masivas
- Lista de Encuentros (Bandeja de Facturación)
- Cuadro de Control

---

## 7.3 Asignaciones Masivas

Permite asignar múltiples encuentros de facturación a los Ejecutivos de Facturación de forma masiva.

---

## 7.4 Lista de Encuentros

Visualiza los encuentros clasificados en la bandeja de Facturación para poder realizar las asignaciones correspondientes.

---

## 7.5 Cuadro de Control

Permite visualizar los encuentros que han sido asignados a cada Ejecutivo de Facturación.

Facilita el seguimiento y monitoreo de la carga de trabajo distribuida.

---

# 8. Ejecutivo de Facturación

## 8.1 Descripción

Perfil operativo encargado de procesar la facturación de encuentros asignados a su usuario.

---

## 8.2 Funcionalidades Disponibles

El Ejecutivo de Facturación tiene acceso únicamente a:

- Pendientes por Facturar

---

## 8.3 Restricciones de Visibilidad

Solo podrá visualizar:

- Encuentros asignados específicamente a su usuario.
- Encuentros clasificados para Facturación.

---

## 8.4 Pendientes por Facturar

Visualiza únicamente los encuentros de facturación que han sido asignados a su usuario por el Responsable de Facturación.

No puede visualizar encuentros de otros ejecutivos ni encuentros sin asignar.

---

# 9. Comparativo de Roles

## 9.1 Comparativo de Roles de Admisión

| Funcionalidad | Superusuario | Gestor A | Ejecutivo |
|--------------|-------------|-----------|-----------|
| Cuadro de Control | Sí | Sí | No |
| Encuentros Devueltos | Sí | Sí | Sí |
| Lista de Encuentros | Sí | Sí | Sí |
| Cambio de Beneficio | No | No | Sí |
| Ver todos los encuentros | Sí | Sí | No |
| Ver encuentros propios | Sí | Sí | Sí |
| Ver todas las sedes | Sí | Sí | No |
| Filtro por Sede | Sí | Sí | No |
| Filtro por Usuario | Sí | Sí | No |
| Filtro por Estado | Sí | Sí | Sí |
| Ordenamiento | Sí | Sí | No |
| Exportación | Sí | Sí | Sí |
| Cambio de Estado | Sí | Sí | Sí |
| No Facturable | Sí | Sí | No |
| Error Facturación | Sí | Sí | No |

---

## 9.2 Comparativo de Roles de Facturación

| Funcionalidad | Responsable Facturación | Ejecutivo Facturación |
|--------------|------------------------|----------------------|
| Asignaciones Masivas | Sí | No |
| Lista de Encuentros (Facturación) | Sí | No |
| Cuadro de Control | Sí | No |
| Pendientes por Facturar | No | Sí |
| Ver encuentros asignados propios | No | Sí |
| Ver todos los encuentros de facturación | Sí | No |
| Asignar encuentros a ejecutivos | Sí | No |

---

## 9.3 Comparativo General de Funcionalidades

| Funcionalidad | Área | Roles con Acceso |
|--------------|------|------------------|
| Cuadro de Control | Admisión | Superusuario, Gestor A |
| Cuadro de Control | Facturación | Responsable Facturación |
| Encuentros Devueltos | Admisión | Superusuario, Gestor A, Ejecutivo |
| Lista de Encuentros | Admisión | Superusuario, Gestor A, Ejecutivo |
| Lista de Encuentros | Facturación | Responsable Facturación |
| Cambio de Beneficio | Admisión | Ejecutivo |
| Asignaciones Masivas | Facturación | Responsable Facturación |
| Pendientes por Facturar | Facturación | Ejecutivo Facturación |

---

# 10. Reglas de Negocio Asociadas

- RN06
- RN07
- RN08
- RN21
- RN22
- RN44
- RN45
- RN55
- RN56
- RN57
- RN58
- RN59
- RN60
- RN61
- RN62
- RN63
- RN65
- RN66
- RN67

---

# 11. Consideraciones Importantes

## CI01

El rol no determina la bandeja de un encuentro.

## CI02

La clasificación de bandejas depende exclusivamente del Job de Admisión.

## CI03

Los estados operativos son independientes de la clasificación.

## CI04

La exportación debe respetar la visibilidad permitida para cada rol.

## CI05

Toda acción de cambio de estado debe quedar registrada para auditoría.

## CI06

El Responsable de Facturación es el único autorizado para realizar asignaciones masivas de encuentros.

## CI07

El Ejecutivo de Facturación solo visualiza encuentros que le han sido asignados explícitamente.

## CI08

El Cuadro de Control permite supervisar la distribución de carga de trabajo entre ejecutivos.

## CI09

La funcionalidad de Cambio de Beneficio está restringida exclusivamente al Ejecutivo de Admisión.

## CI10

Las asignaciones de encuentros a ejecutivos de facturación deben ser rastreables para auditoría.

---

# 12. Fuente de Verdad

Este documento constituye la referencia oficial para:

- Desarrollo.
- QA.
- Seguridad.
- UAT.
- Auditoría.

Toda funcionalidad deberá respetar las restricciones definidas para cada perfil.
