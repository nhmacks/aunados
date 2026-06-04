# 10-Reglas-Negocio.md

# Reglas de Negocio del Sistema AUNADOS

## 1. Objetivo

Este documento consolida las reglas de negocio que gobiernan el comportamiento funcional del sistema AUNADOS.

Las reglas aquí definidas constituyen la fuente oficial para:

- Desarrollo.
- QA.
- UAT.
- Auditoría.
- Soporte.
- Operaciones.

---

# 2. Principios Generales

## RN01

La clasificación de encuentros es responsabilidad exclusiva del Job de Admisión.

## RN02

Los usuarios no pueden mover manualmente encuentros entre bandejas.

## RN03

Los estados operativos son independientes de la clasificación.

## RN04

Toda información visible deberá respetar las restricciones definidas por rol.

## RN05

Toda modificación de estado debe quedar registrada para auditoría.

---

# 3. Reglas del Job de Admisión

## RN06

El Job de Admisión obtiene información desde XHIS.

## RN07

El Job evaluará reglas administrativas, médicas y de proceso.

## RN08

El Job determinará si un encuentro pertenece a:

- Admisión
- Protocolo
- Facturación

## RN09

La clasificación realizada por el Job prevalece sobre cualquier estado operativo.

## RN10

Los encuentros podrán ser reclasificados durante ejecuciones posteriores.

---

# 4. Reglas de Admisión

## RN11

Un encuentro permanecerá en Admisión cuando tenga documentación administrativa pendiente.

## RN12

Un encuentro permanecerá en Admisión cuando tenga exámenes de laboratorio pendientes.

## RN13

Un encuentro permanecerá en Admisión cuando tenga laboratorios no imputados.

## RN14

Basta una condición pendiente para permanecer en Admisión.

## RN15

Los encuentros permanecerán visibles hasta que el Job determine otra clasificación.

---

# 5. Reglas de Protocolo

## RN16

Un encuentro podrá ingresar a Protocolo únicamente cuando toda la documentación administrativa esté completa.

## RN17

Un encuentro podrá ingresar a Protocolo únicamente cuando los laboratorios estén completos.

## RN18

Un encuentro podrá ingresar a Protocolo únicamente cuando los laboratorios estén imputados.

## RN19

Consulta Externa No Oncosalud con menos de 7 días será clasificada en Protocolo.

## RN20

Consulta Externa Oncosalud con hasta 31 días será clasificada en Protocolo.

## RN21

Emergencia con hasta 2 días será clasificada en Protocolo.

---

# 6. Reglas de Facturación

## RN22

Consulta Externa No Oncosalud con más de 7 días será clasificada en Facturación.

## RN23

Consulta Externa Oncosalud con más de 31 días será clasificada en Facturación.

## RN24

Emergencia con más de 2 días será clasificada en Facturación.

## RN25

Facturación requiere documentación administrativa completa.

## RN26

Facturación requiere laboratorios completos.

## RN27

Facturación requiere laboratorios imputados.

---

# 7. Reglas de Roles

## RN28

El Superusuario visualizará todos los encuentros clasificados para Admisión.

## RN29

El Gestor de A tendrá los mismos permisos que el Superusuario.

## RN30

El Ejecutivo visualizará únicamente encuentros creados por él.

## RN31

El Ejecutivo visualizará únicamente encuentros de su sede.

## RN32

El Ejecutivo visualizará únicamente encuentros clasificados para Admisión.

---

# 8. Reglas de Lista de Encuentros

## RN33

La Lista de Encuentros será la pantalla inicial después del login.

## RN34

La carga inicial mostrará 50 registros.

## RN35

Los registros más recientes se mostrarán primero.

## RN36

La carga adicional se realizará mediante scroll infinito.

## RN37

Los registros se cargarán de 50 en 50.

## RN38

El contador deberá reflejar la cantidad real de resultados visibles.

---

# 9. Reglas de Búsqueda

## RN39

La búsqueda general permitirá buscar por:

- Nombre
- Apellido
- Número de Encuentro

## RN40

La búsqueda se ejecutará al presionar Enter.

## RN41

La búsqueda actualizará automáticamente la grilla.

## RN42

La búsqueda actualizará automáticamente el contador.

---

# 10. Reglas de Filtros

## RN43

Los filtros podrán combinarse.

## RN44

Los filtros permanecerán activos hasta ser eliminados.

## RN45

El botón Aplicar ejecutará el filtro seleccionado.

## RN46

El botón Limpiar eliminará únicamente el filtro actual.

## RN47

Restablecer Vista eliminará todos los filtros activos.

## RN48

Prioridad permite únicamente una selección.

## RN49

Sede permite múltiples selecciones.

## RN50

Estado permite múltiples selecciones.

## RN51

Tipo de Encuentro permite múltiples selecciones.

## RN52

Sustentos Administrativos permite múltiples selecciones.

## RN53

Sustentos Médicos permite múltiples selecciones.

---

# 11. Reglas de Ordenamiento

## RN54

Solo Superusuario y Gestor pueden ordenar resultados.

## RN55

Las columnas ordenables son:

- Encuentro
- NHC
- Apellidos
- Nombres
- Fecha Apertura
- Usuario
- Garante
- Tipo Encuentro
- Monto

## RN56

El primer clic ordenará ascendentemente.

## RN57

El segundo clic ordenará descendentemente.

---

# 12. Reglas del Detalle del Encuentro

## RN58

El detalle será accesible desde Lista de Encuentros.

## RN59

La información será de solo lectura.

## RN60

Los sustentos se mostrarán únicamente cuando existan pendientes.

## RN61

Los agrupadores Datos del Encuentro y Datos del Seguro serán expandibles.

---

# 13. Reglas de Estados

## RN62

Los cambios de estado requerirán confirmación.

## RN63

Los estados operativos no modifican la clasificación.

## RN64

No Facturable provoca salida temporal de Admisión.

## RN65

Error de Facturación provoca salida temporal de Admisión.

## RN66

El Job reevaluará posteriormente estos encuentros.

## RN67

Los encuentros podrán regresar a Admisión después de la reevaluación.

---

# 14. Reglas de Exportación

## RN68

La exportación respetará filtros activos.

## RN69

La exportación respetará búsquedas activas.

## RN70

La exportación respetará restricciones del rol.

## RN71

La exportación para Superusuario será inmediata.

## RN72

La exportación para Gestor será inmediata.

## RN73

La exportación para Ejecutivo será asíncrona.

## RN74

Los reportes generados para Ejecutivo tendrán una vigencia de una hora.

## RN75

Los reportes expirados requerirán una nueva generación.

---

# 15. Reglas de Auditoría

## RN76

Todo cambio de estado deberá registrarse.

## RN77

Toda exportación deberá registrarse.

## RN78

Todo acceso al detalle del encuentro podrá ser auditado.

## RN79

Las búsquedas ejecutadas podrán ser auditadas.

## RN80

Los filtros aplicados podrán ser auditados.

---

# 16. Reglas de Seguridad

## RN81

Todo acceso requiere autenticación.

## RN82

La información visible dependerá del rol autenticado.

## RN83

Las acciones disponibles dependerán del rol autenticado.

## RN84

Los usuarios no podrán acceder a información fuera de su alcance funcional.

---

# 17. Reglas de Rendimiento

## RN85

La Lista de Encuentros deberá soportar miles de registros.

## RN86

La carga incremental deberá minimizar tiempos de espera.

## RN87

La exportación asíncrona evitará afectar el rendimiento general.

---

# 18. Fuente de Verdad

Todas las funcionalidades documentadas en:

- Admisión
- Protocolo
- Facturación
- Roles
- Lista de Encuentros
- Filtros
- Detalle del Encuentro
- Estados
- Exportaciones

deberán respetar las reglas definidas en este documento.
