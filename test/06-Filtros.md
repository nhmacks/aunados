# 06-Filtros.md

# Gestión de Filtros - Lista de Encuentros

## 1. Objetivo

Permitir al usuario restringir la información mostrada en la Lista de Encuentros mediante criterios específicos de búsqueda.

Los filtros permiten localizar rápidamente encuentros según atributos operativos, administrativos o médicos.

---

# 2. Principios Generales

## FIL-01

Los filtros pueden utilizarse de forma individual o combinada.

## FIL-02

Los filtros permanecen activos hasta que sean eliminados manualmente.

## FIL-03

El contador de resultados debe actualizarse automáticamente.

## FIL-04

La grilla deberá actualizarse después de aplicar cada filtro.

## FIL-05

Los filtros deben respetar las restricciones del rol autenticado.

---

# 3. Roles y Disponibilidad

| Filtro | Superusuario | Gestor A | Ejecutivo |
|----------|----------|----------|----------|
| Sede | Sí | Sí | No |
| Estado | Sí | Sí | Sí |
| Fecha Apertura | Sí | Sí | Sí |
| Prioridad | Sí | Sí | Sí |
| Usuario | Sí | Sí | No |
| Garante | Sí | Sí | Sí |
| Tipo Encuentro | Sí | Sí | Sí |
| Sustento Administrativo | Sí | Sí | No |
| Sustento Médico | Sí | Sí | No |

---

# 4. Filtro por Sede

## Objetivo

Permitir localizar encuentros pertenecientes a una o varias sedes.

---

## Componentes

### Buscador

Permite buscar sedes por descripción.

### Lista de Selección

Contendrá todas las sedes disponibles.

### Checkboxes

Permite selección múltiple.

### Botón Aplicar

Ejecuta el filtro.

### Botón Limpiar

Elimina únicamente el filtro de sede.

---

## Ejemplos

- Auna Guardia Civil
- Las Flores
- Centro de Bienestar
- Delgado
- Onco Center San Borja
- Servimédicos

---

## Comportamiento de Búsqueda

La búsqueda es dinámica.

Ejemplo:

Texto ingresado:

Auna

Resultado:

Todas las sedes que contengan Auna.

---

# 5. Filtro por Estado

## Objetivo

Permitir localizar encuentros según su estado operativo.

---

## Componentes

- Buscador.
- Lista de estados.
- Checkboxes.
- Aplicar.
- Limpiar.

---

## Estados Posibles

- Pendiente
- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- En Proceso
- Error de Facturación
- No Facturable
- Tramitado

---

## Selección

Permite múltiples estados simultáneamente.

---

# 6. Filtro por Fecha de Apertura

## Objetivo

Permitir localizar encuentros utilizando criterios temporales.

---

## Operadores Disponibles

### Igual a

Muestra registros con fecha exacta.

### Entre

Permite indicar:

- Fecha Inicio
- Fecha Fin

### Antes de

Muestra registros anteriores a la fecha indicada.

### Después de

Muestra registros posteriores a la fecha indicada.

---

## Selección de Fecha

Puede realizarse mediante:

- Digitación manual.
- Calendario visual.

---

## Botones

- Aplicar
- Limpiar

---

# 7. Filtro por Prioridad

## Objetivo

Permitir localizar encuentros según su prioridad operativa.

---

## Prioridades Definidas

### Prioridad 1

Mes de castigo.

### Prioridad 2

Mes en curso y dos meses previos.

### Prioridad 3

Meses anteriores al castigo.

---

## Componentes

### Buscador

Permite localizar prioridades por descripción.

### Lista de Prioridades

Muestra las prioridades disponibles.

### Checkbox

Permite seleccionar una única prioridad.

---

## Restricción

Solo puede seleccionarse una prioridad.

---

## Regla de Búsqueda

La búsqueda iniciará desde el segundo carácter digitado.

Ejemplo:

Texto:

ca

Resultado:

Mes de castigo.

---

## Sin Coincidencias

Mensaje:

Sin coincidencias

---

# 8. Filtro por Usuario

## Objetivo

Permitir localizar encuentros asociados a un usuario específico.

---

## Roles Disponibles

- Superusuario
- Gestor A

---

## Componentes

### Operador

Contiene

Valor fijo.

### Campo Filtro

Permite ingresar texto.

### Botón Aplicar

Ejecuta el filtro.

### Botón Limpiar

Elimina el filtro.

---

## Ejemplo

Texto:

Lucía

Resultado:

Todos los usuarios que contengan Lucía.

---

# 9. Filtro por Garante

## Objetivo

Permitir localizar encuentros asociados a un garante.

---

## Componentes

### Operador

Contiene

Valor fijo.

### Campo Filtro

Permite ingresar texto.

### Botón Aplicar

Ejecuta el filtro.

### Botón Limpiar

Elimina el filtro.

---

## Ejemplos

- MAPFRE
- Pacífico
- Oncosalud
- La Positiva

---

# 10. Filtro por Tipo de Encuentro

## Objetivo

Permitir localizar encuentros según su tipo.

---

## Componentes

### Campo Buscar

Permite localizar tipos disponibles.

### Checkbox Seleccionar Todos

Selecciona todas las opciones.

### Checkbox Ambulatorio

Filtra encuentros ambulatorios.

### Checkbox Emergencia

Filtra encuentros de emergencia.

### Botón Aplicar

Ejecuta el filtro.

### Botón Limpiar

Elimina el filtro.

---

## Reglas

### Seleccionar Todos

Activa:

- Ambulatorio
- Emergencia

### Selección Individual

Puede seleccionarse:

- Ambulatorio
- Emergencia

---

## Sin Coincidencias

Mensaje:

Sin coincidencias

---

# 11. Filtro por Sustentos Administrativos

## Objetivo

Permitir localizar encuentros según documentación administrativa pendiente.

---

## Roles Disponibles

- Superusuario
- Gestor A

---

## Componentes

### Campo Buscar

Permite localizar sustentos.

### Checkbox Seleccionar Todos

Selecciona todos los sustentos.

### Lista de Sustentos

Muestra los sustentos disponibles.

### Aplicar

Ejecuta filtro.

### Limpiar

Elimina filtro.

---

## Ejemplos

- -
- Carta de Garantía
- Hoja SITEDS
- Denuncia Policial
- SOAT Tarjeta Física
- Accidentes Personales
- Accidentes Estudiantiles
- Conformidad
- Operación 1OCG
- Ampliación 1CG
- Ampliación 2CG
- Ampliación 3CG
- Ampliación 7CG

---

## Selección

Permite múltiples selecciones.

---

# 12. Filtro por Sustentos Médicos

## Objetivo

Permitir localizar encuentros según pendientes médicos.

---

## Roles Disponibles

- Superusuario
- Gestor A

---

## Valores Posibles

### Laboratorio

Existen pendientes médicos.

### -

No existen pendientes médicos.

---

## Componentes

- Campo Buscar
- Seleccionar Todos
- Checkboxes
- Aplicar
- Limpiar

---

## Selección

Permite múltiples selecciones.

---

# 13. Aplicación de Filtros

## Flujo General

1. Usuario selecciona filtro.
2. Configura criterios.
3. Selecciona Aplicar.
4. Sistema ejecuta búsqueda.
5. Sistema actualiza grilla.
6. Sistema actualiza contador.

---

# 14. Limpieza de Filtros

## Botón Limpiar

Elimina únicamente el filtro actual.

---

## Botón Restablecer Vista

Elimina:

- Todos los filtros.
- Todas las búsquedas.
- Ordenamientos activos.

---

# 15. Mensajes de Filtros

## Sin Coincidencias

Título:

No encontramos resultados para atender.

Descripción:

Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro.

---

## Búsqueda Interna

Mensaje:

Sin coincidencias

---

# 16. Reglas de Negocio

## RN-FIL-01

Los filtros pueden combinarse.

## RN-FIL-02

El contador debe reflejar los resultados filtrados.

## RN-FIL-03

Aplicar ejecuta el filtro seleccionado.

## RN-FIL-04

Limpiar elimina únicamente el filtro correspondiente.

## RN-FIL-05

Restablecer Vista elimina todos los filtros.

## RN-FIL-06

Prioridad permite una única selección.

## RN-FIL-07

Sede permite múltiples selecciones.

## RN-FIL-08

Estado permite múltiples selecciones.

## RN-FIL-09

Tipo de Encuentro permite múltiples selecciones.

## RN-FIL-10

Sustentos Administrativos permite múltiples selecciones.

## RN-FIL-11

Sustentos Médicos permite múltiples selecciones.

---

# 17. Consideraciones de Auditoría

Debe registrarse:

- Filtros utilizados.
- Usuario que ejecutó la búsqueda.
- Fecha y hora.
- Cantidad de resultados obtenidos.

---

# 18. Fuente de Verdad

Los filtros constituyen el principal mecanismo de consulta operativa de la Lista de Encuentros y deberán respetar siempre las restricciones definidas por rol y las reglas de clasificación establecidas por el Job de Admisión.
