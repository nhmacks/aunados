# 05-Lista-Encuentros.md

# Pantalla Lista de Encuentros

## 1. Objetivo

La pantalla Lista de Encuentros constituye el punto principal de consulta y gestión de encuentros clasificados por el Job de Admisión.

Permite:

- Visualizar encuentros.
- Buscar encuentros.
- Aplicar filtros.
- Ordenar información.
- Exportar información.
- Acceder al detalle del encuentro.
- Gestionar el flujo operativo desde la bandeja de Admisión.

---

# 2. Acceso

## 2.1 Ingreso al Sistema

Una vez que el usuario inicia sesión correctamente, el sistema mostrará automáticamente la pantalla Lista de Encuentros.

No se requiere navegación adicional.

---

## 2.2 Roles Autorizados

- Superusuario de Admisión
- Gestor de A
- Ejecutivo de Admisión

---

# 3. Fuente de Información

La información mostrada proviene de:

- XHIS
- Job de Admisión

El Job de Admisión determina qué encuentros son visibles en la bandeja.

---

# 4. Carga Inicial

## 4.1 Cantidad de Registros

Al ingresar:

- Se mostrarán 50 registros inicialmente.

---

## 4.2 Orden Inicial

Los encuentros se visualizarán:

1. Más recientes primero.
2. Más antiguos al final.

La fecha considerada corresponde a la fecha de apertura.

---

## 4.3 Scroll Infinito

Cuando el usuario llegue al final de los registros cargados:

- El sistema cargará automáticamente los siguientes 50 registros.
- No recargará la página.
- Mantendrá filtros activos.

---

# 5. Comportamiento General

La grilla mostrará únicamente encuentros clasificados para Admisión.

Los resultados dependerán del rol autenticado.

---

# 6. Visualización para Superusuario y Gestor de A

## 6.1 Columnas Disponibles

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

# 7. Visualización para Ejecutivo de Admisión

## 7.1 Columnas Disponibles

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

## 7.2 Restricción

Solo visualizará:

- Encuentros creados por él mismo.
- Encuentros pertenecientes a su sede.
- Encuentros clasificados para Admisión.

---

# 8. Búsqueda General

## 8.1 Ubicación

Parte superior de la pantalla.

---

## 8.2 Criterios Permitidos

- Nombre
- Apellido
- Número de Encuentro

---

## 8.3 Ejecución

1. El usuario ingresa el criterio.
2. Presiona Enter.
3. El sistema ejecuta la búsqueda.
4. La grilla se actualiza.

---

## 8.4 Sin Resultados

Mensaje:

No encontramos resultados para atender.

Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro.

---

# 9. Contador de Resultados

## 9.1 Objetivo

Informar la cantidad de registros visibles.

---

## 9.2 Comportamiento

Debe actualizarse automáticamente cuando:

- Se realiza una búsqueda.
- Se aplica un filtro.
- Se limpia un filtro.
- Se restablece la vista.

---

## 9.3 Ejemplos

- 1 registro encontrado.
- 15 registros encontrados.
- 200 registros encontrados.

---

# 10. Botón Restablecer Vista

## 10.1 Objetivo

Eliminar todos los filtros y búsquedas activas.

---

## 10.2 Comportamiento

Al seleccionarlo:

- Elimina filtros.
- Elimina búsquedas.
- Reinicia ordenamientos.
- Regresa a la vista inicial.

---

# 11. Acceso al Detalle del Encuentro

## 11.1 Selección

El usuario podrá seleccionar cualquier encuentro visible en la grilla.

---

## 11.2 Resultado

El sistema abrirá la pantalla:

Detalle del Encuentro.

---

# 12. Ordenamiento

## 12.1 Roles Autorizados

- Superusuario
- Gestor de A

---

## 12.2 Columnas Ordenables

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

## 12.3 Comportamiento

Primer clic:

- Ascendente

Segundo clic:

- Descendente

---

# 13. Exportación

## 13.1 Superusuario y Gestor

Descarga inmediata.

Incluye los resultados visibles.

---

## 13.2 Ejecutivo

Descarga asíncrona.

Proceso:

1. Solicita reporte.
2. Sistema genera archivo.
3. Notificación disponible.
4. Descarga desde campana.

---

# 14. Mensajes del Sistema

## 14.1 Error General

Título:

Hubo un inconveniente.

Descripción:

En estos momentos no podemos mostrar la información que necesita. Por favor, inténtelo nuevamente.

---

## 14.2 Sin Resultados

Título:

No encontramos resultados para atender.

Descripción:

Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro.

---

# 15. Reglas de Negocio

## RN-LE-01

La pantalla será la pantalla inicial después del login.

## RN-LE-02

Solo mostrará encuentros clasificados para Admisión.

## RN-LE-03

La información visible dependerá del rol autenticado.

## RN-LE-04

Los registros se mostrarán de 50 en 50.

## RN-LE-05

Los registros más recientes aparecerán primero.

## RN-LE-06

La búsqueda general permitirá buscar por nombre, apellido o encuentro.

## RN-LE-07

El botón Restablecer Vista eliminará todos los filtros.

## RN-LE-08

La exportación respetará filtros y búsquedas activas.

## RN-LE-09

El contador deberá coincidir con la cantidad real de registros.

## RN-LE-10

La selección de un encuentro abrirá el Detalle del Encuentro.

---

# 16. Consideraciones de Rendimiento

La pantalla deberá:

- Soportar miles de registros.
- Utilizar scroll infinito.
- Mantener tiempos de respuesta aceptables.
- Evitar cargas completas innecesarias.

---

# 17. Consideraciones de Auditoría

Toda acción relevante deberá ser auditable:

- Búsquedas.
- Descargas.
- Cambios de estado.
- Accesos a detalle.

---

# 18. Fuente de Verdad

La Lista de Encuentros representa la vista operativa principal de la bandeja de Admisión.

Toda la información mostrada debe corresponder exactamente con la clasificación vigente determinada por el Job de Admisión.
