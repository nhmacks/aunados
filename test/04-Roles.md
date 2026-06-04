# 04-Roles.md

# Roles y Permisos del Sistema AUNADOS

## 1. Objetivo

Definir los perfiles autorizados para interactuar con las bandejas operativas del sistema AUNADOS y establecer claramente los permisos, restricciones y capacidades de cada rol.

---

# 2. Roles Definidos

Actualmente el sistema contempla los siguientes perfiles:

- Superusuario de Admisión
- Gestor de A
- Ejecutivo de Admisión

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

## 4.2 Visibilidad

Puede visualizar:

- Todas las sedes.
- Todos los usuarios.
- Todos los encuentros clasificados para Admisión.
- Todos los garantes.
- Todos los estados.
- Todos los sustentos.

---

## 4.3 Lista de Encuentros

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

## 4.4 Filtros Disponibles

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

## 4.5 Ordenamiento

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

## 4.6 Exportación

Puede descargar:

- Todos los registros visibles.
- Registros filtrados.
- Registros resultantes de búsquedas.

La descarga es inmediata.

---

## 4.7 Detalle del Encuentro

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

## 4.8 Cambio de Estado

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

## 6.2 Restricciones de Visibilidad

Solo podrá visualizar encuentros que cumplan simultáneamente:

- Fueron creados por el usuario autenticado.
- Corresponden a su sede.
- Fueron clasificados para Admisión.

---

## 6.3 Lista de Encuentros

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

## 6.4 Filtros Disponibles

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

## 6.5 Ordenamiento

No posee permisos de ordenamiento.

---

## 6.6 Exportación

La exportación es asíncrona.

Flujo:

1. Solicita la descarga.
2. El sistema genera el archivo.
3. Se crea una notificación.
4. El usuario descarga el archivo desde la campana.

---

## 6.7 Detalle del Encuentro

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

## 6.8 Cambio de Estado

Puede asignar:

- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- Tramitado

---

# 7. Comparativo de Roles

| Funcionalidad | Superusuario | Gestor A | Ejecutivo |
|--------------|-------------|-----------|-----------|
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

# 8. Reglas de Negocio Asociadas

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

# 9. Consideraciones Importantes

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

---

# 10. Fuente de Verdad

Este documento constituye la referencia oficial para:

- Desarrollo.
- QA.
- Seguridad.
- UAT.
- Auditoría.

Toda funcionalidad deberá respetar las restricciones definidas para cada perfil.
