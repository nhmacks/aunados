# 09-Exportaciones.md

# Gestión de Exportaciones

## 1. Objetivo

La funcionalidad de exportación permite a los usuarios autorizados obtener un archivo en formato Excel con la información visible en la Lista de Encuentros.

La exportación debe respetar:

- Permisos del usuario.
- Restricciones de visibilidad por rol.
- Filtros aplicados.
- Búsquedas activas.
- Clasificación vigente determinada por el Job de Admisión.

---

# 2. Alcance

La funcionalidad aplica a:

- Superusuario de Admisión.
- Gestor de A.
- Ejecutivo de Admisión.

---

# 3. Principios Generales

## EXP-01

La exportación debe respetar los permisos del usuario autenticado.

## EXP-02

La exportación debe contener únicamente los registros visibles para el usuario.

## EXP-03

La exportación debe respetar filtros activos.

## EXP-04

La exportación debe respetar búsquedas activas.

## EXP-05

La información exportada debe coincidir exactamente con la información obtenida desde la consulta realizada sobre la Lista de Encuentros.

---

# 4. Acceso a la Funcionalidad

La opción:

Descargar

estará visible en la pantalla Lista de Encuentros.

---

# 5. Exportación para Superusuario de Admisión

## 5.1 Disponibilidad

Disponible permanentemente.

---

## 5.2 Comportamiento

Al seleccionar Descargar:

1. El sistema genera el archivo.
2. La descarga inicia inmediatamente.
3. El usuario recibe el archivo Excel.

---

## 5.3 Información Considerada

### Sin filtros

Todos los registros visibles.

### Con filtros

Solo registros filtrados.

### Con búsqueda

Solo coincidencias obtenidas.

---

# 6. Exportación para Gestor de A

## 6.1 Comportamiento

Posee el mismo comportamiento definido para el Superusuario.

---

## 6.2 Restricciones

Ninguna adicional.

---

# 7. Exportación para Ejecutivo de Admisión

## 7.1 Objetivo

Permitir la generación controlada de reportes sin afectar el rendimiento del sistema.

---

## 7.2 Comportamiento

Al seleccionar Descargar:

1. El sistema registra la solicitud.
2. El sistema genera el archivo en segundo plano.
3. No inicia una descarga inmediata.
4. El usuario puede continuar utilizando la aplicación.

---

## 7.3 Generación Asíncrona

La construcción del archivo se realiza fuera del flujo principal de navegación.

---

## 7.4 Finalización

Cuando el archivo se encuentre listo:

- Se genera una notificación.
- El archivo queda disponible para descarga.

---

# 8. Centro de Notificaciones

## 8.1 Ubicación

Campana ubicada en la parte superior de la aplicación.

---

## 8.2 Objetivo

Informar al usuario sobre la disponibilidad del reporte solicitado.

---

## 8.3 Mensaje

### Título

Reporte disponible

### Descripción

El reporte solicitado ya está listo. Tienes una hora para descargarlo.

---

## 8.4 Acción Disponible

Botón:

Descargar

---

## 8.5 Resultado

Al seleccionarlo:

1. Se inicia la descarga.
2. El archivo se descarga al equipo del usuario.

---

# 9. Vigencia del Archivo

## Tiempo Disponible

1 hora.

---

## Expiración

Cuando la vigencia finalice:

- El archivo deja de estar disponible.
- La descarga ya no será posible.
- El usuario deberá generar una nueva solicitud.

---

# 10. Formato del Archivo

## Tipo

Microsoft Excel.

---

## Extensión

.xlsx

---

## Codificación

Compatible con Microsoft Excel y herramientas equivalentes.

---

# 11. Nombre del Archivo

Nombre estándar:

Lista de Encuentros de Admisión.xlsx

---

# 12. Estructura del Reporte

## Columnas Exportadas

| Columna |
|----------|
| Sede |
| Encuentro |
| Estado |
| NHC |
| Apellidos |
| Nombres |
| Fecha de Apertura |
| Usuario |
| Garante |
| Prioridad |
| Sustentos Administrativos |
| Sustentos Médicos |
| Sustentos de Proceso |
| Monto |

---

# 13. Definición de Columnas

## Sede

Descripción de la sede asociada al encuentro.

Ejemplos:

- Auna Guardia Civil
- Delgado
- Las Flores
- Centro de Bienestar

---

## Encuentro

Número de encuentro.

Formato:

Numérico de 8 dígitos.

---

## Estado

Estado operativo actual.

---

## NHC

Número de Historia Clínica.

---

## Apellidos

Apellidos del paciente.

---

## Nombres

Nombres del paciente.

---

## Fecha de Apertura

Formato:

AAAA-MM-DD

Ejemplo:

2026-06-03

---

## Usuario

Nombre completo del usuario asociado.

---

## Garante

Descripción del garante.

Ejemplos:

- Oncosalud
- MAPFRE EPS
- Pacífico EPS
- La Positiva

---

## Prioridad

Valor numérico.

Posibles valores:

- 1
- 2
- 3

---

## Sustentos Administrativos

Puede contener uno o varios valores.

Ejemplo:

Denuncia Policial; SOAT Tarjeta Física

---

## Sustentos Médicos

Valores:

- Laboratorio
- -

---

## Sustentos de Proceso

Valores:

- Laboratorio
- -

---

## Monto

Monto asociado al encuentro.

Formato decimal.

---

# 14. Reglas de Visibilidad

## Superusuario

Visualiza toda la información disponible.

---

## Gestor de A

Visualiza toda la información disponible.

---

## Ejecutivo

La exportación deberá respetar únicamente los encuentros visibles para el usuario.

---

# 15. Casos de Uso

## Caso 1

Sin filtros.

Resultado:

Se exportan todos los registros visibles.

---

## Caso 2

Filtro por Estado.

Resultado:

Se exportan únicamente los registros filtrados.

---

## Caso 3

Filtro por Garante.

Resultado:

Se exportan únicamente los registros coincidentes.

---

## Caso 4

Búsqueda por Encuentro.

Resultado:

Se exporta únicamente el resultado encontrado.

---

# 16. Auditoría

Toda exportación deberá registrar:

- Usuario.
- Rol.
- Fecha.
- Hora.
- Cantidad de registros.
- Filtros aplicados.
- Estado de generación.

---

# 17. Reglas de Negocio

## RN-EXP-01

La exportación respetará los filtros activos.

## RN-EXP-02

La exportación respetará las búsquedas activas.

## RN-EXP-03

La exportación respetará las restricciones del rol.

## RN-EXP-04

La exportación para Ejecutivo será asíncrona.

## RN-EXP-05

La descarga para Superusuario será inmediata.

## RN-EXP-06

La descarga para Gestor será inmediata.

## RN-EXP-07

Los reportes del Ejecutivo expirarán después de una hora.

## RN-EXP-08

Los archivos expirados requerirán una nueva generación.

## RN-EXP-09

La estructura del Excel será estándar para todos los roles.

---

# 18. Fuente de Verdad

Este documento constituye la especificación oficial de exportaciones para el módulo de Admisión y deberá ser utilizado como referencia por los equipos de Desarrollo, QA, UAT y Auditoría.
