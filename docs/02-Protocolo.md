# 02-Protocolo.md

# Módulo de Protocolo

## 1. Objetivo

La bandeja de Protocolo tiene como finalidad concentrar aquellos encuentros que ya cumplieron las validaciones administrativas, médicas y de proceso requeridas para salir de Admisión, pero que aún no han alcanzado la antigüedad necesaria para ser enviados a Facturación.

Esta bandeja actúa como una etapa intermedia de control operativo antes del proceso de facturación.

---

# 2. Relación con el Job de Admisión

La clasificación de encuentros hacia Protocolo es responsabilidad exclusiva del Job de Admisión.

Ningún usuario podrá mover manualmente un encuentro desde Admisión hacia Protocolo.

Ningún cambio de estado operativo provocará el ingreso o salida de un encuentro de esta bandeja.

---

# 3. Requisitos para Ingresar a Protocolo

Un encuentro podrá ingresar a la bandeja de Protocolo únicamente cuando cumpla todas las condiciones siguientes:

## 3.1 Documentación Administrativa

- Completa.
- Sin sustentos administrativos pendientes.

## 3.2 Sustentos Médicos

- Completos.
- Sin laboratorios pendientes.

## 3.3 Sustentos de Proceso

- Todos los laboratorios imputados.

**Nota sobre estado de exámenes de laboratorio:**

- **Imputado**: El examen de laboratorio ha sido procesado y asociado contablemente al encuentro.
- **Citado**: El examen de laboratorio aún NO ha sido imputado. Está pendiente de procesamiento contable.

Para ingresar a Protocolo, **todos** los exámenes de laboratorio deben estar **imputados** (ninguno puede estar citado).

## 3.4 Clasificación por Antigüedad

Además de cumplir las condiciones anteriores, deberá encontrarse dentro del rango de antigüedad permitido.

---

# 4. Reglas de Clasificación

## 4.1 Consulta Externa No Oncosalud

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor a 7 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

## 4.2 Consulta Externa Oncosalud

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor o igual a 31 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

## 4.3 Emergencia

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor o igual a 2 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

# 5. Salida de Protocolo

La salida de Protocolo será determinada únicamente por el Job de Admisión.

---

## 5.1 Consulta Externa No Oncosalud

### Condición

Mayor a 7 días.

### Resultado

Facturación.

---

## 5.2 Consulta Externa Oncosalud

### Condición

Mayor a 31 días.

### Resultado

Facturación.

---

## 5.3 Emergencia

### Condición

Mayor a 2 días.

### Resultado

Facturación.

---

# 6. Principios Funcionales

## PF-PRO-01

La bandeja de Protocolo no corrige documentación administrativa.

## PF-PRO-02

La bandeja de Protocolo no corrige sustentos médicos.

## PF-PRO-03

La bandeja de Protocolo no corrige laboratorios no imputados.

## PF-PRO-04

Todo encuentro visible en Protocolo debe haber superado las validaciones de Admisión.

## PF-PRO-05

La permanencia en Protocolo depende exclusivamente de la antigüedad del encuentro.

---

# 7. Relación entre Estados y Protocolo

Los estados operativos son independientes de la clasificación.

Ejemplo:

Bandeja:
- Protocolo

Estado:
- Tramitado

Resultado:
- El encuentro continuará en Protocolo hasta que el Job determine su pase a Facturación.

---

# 8. Escenarios de Ejemplo

## Escenario 1

### Datos

Tipo:
- Consulta Externa No Oncosalud

Antigüedad:
- 3 días

Documentación:
- Completa

Laboratorios:
- Completos

Exámenes de laboratorio:
- Imputados

### Resultado

Protocolo.

---

## Escenario 2

### Datos

Tipo:
- Consulta Externa No Oncosalud

Antigüedad:
- 9 días

Documentación:
- Completa

Laboratorios:
- Completos

Exámenes de laboratorio:
- Imputados

### Resultado

Facturación.

---

## Escenario 3

### Datos

Tipo:
- Emergencia

Antigüedad:
- 1 día

Documentación:
- Completa

Laboratorios:
- Completos

Exámenes de laboratorio:
- Imputados

### Resultado

Protocolo.

---

## Escenario 4

### Datos

Tipo:
- Emergencia

Antigüedad:
- 4 días

Documentación:
- Completa

Laboratorios:
- Completos

Exámenes de laboratorio:
- Imputados

### Resultado

Facturación.

---

# 9. Reglas de Negocio Asociadas

- RN35
- RN36
- RN37
- RN38
- RN39
- RN49
- RN52
- RN53
- RN54

---

# 10. Dependencias

La correcta clasificación de Protocolo depende de:

- XHIS.
- Job de Admisión.
- Información de laboratorios.
- Información de sustentos administrativos.
- Información de exámenes de laboratorio imputados.

---

# 11. Consideraciones Importantes

La bandeja de Protocolo no constituye una aprobación manual.

La existencia de un encuentro en esta bandeja significa únicamente que:

1. Cumplió todas las validaciones requeridas.
2. Aún no alcanzó la antigüedad necesaria para ser enviado a Facturación.
3. El Job de Admisión lo clasificó como candidato para Protocolo.

---

# 12. Funcionalidad: Encuentros en Protocolo

## 12.1 Propósito de la Funcionalidad

La pantalla "Encuentros en Protocolo" es una funcionalidad de visualización y seguimiento operativo que permite consultar los encuentros que se encuentran actualmente clasificados en la bandeja de Protocolo.

Esta funcionalidad es de **solo lectura** y está diseñada exclusivamente para:

- Visualizar encuentros que completaron las validaciones de Admisión.
- Monitorear encuentros que esperan alcanzar la antigüedad necesaria para pasar a Facturación.
- Realizar seguimiento operativo de encuentros en estado de Protocolo.
- Exportar información para análisis y reportes externos.

---

## 12.2 Permisos de Acceso

### Acceso Autorizado

**Gestor TA** es el ÚNICO rol autorizado para acceder a esta funcionalidad.

El acceso incluye:
- Visualización de la pantalla "Encuentros en Protocolo" en el menú de Admisión.
- Capacidad de visualizar todos los encuentros clasificados en Protocolo.
- Uso de todas las funcionalidades (búsqueda, filtros, exportación).

### Acceso Denegado

Los siguientes roles **NO tienen acceso** a esta funcionalidad:

- Superusuario de Admisión
- Ejecutivo de Admisión
- Responsable de Facturación
- Ejecutivo de Facturación

**Comportamiento ante acceso no autorizado:**

- La opción "Encuentros en Protocolo" no se muestra en el menú.
- El acceso directo por URL (/admision/encuentros-protocolo) es bloqueado.
- Se muestra mensaje: "Acceso denegado. No tiene permisos para acceder a esta funcionalidad."
- El usuario es redirigido a su pantalla de inicio.
- El intento de acceso queda registrado en el log de auditoría.

### Validación de Permisos en Backend

El backend debe validar el rol del usuario en:

- Peticiones al endpoint `/api/admision/encuentros-protocolo`
- Peticiones al endpoint `/api/admision/encuentros-protocolo/exportar`

**Respuestas HTTP:**

- **200 OK**: Usuario con rol Gestor TA autorizado.
- **403 Forbidden**: Usuario sin permisos.

---

## 12.3 Estructura de la Pantalla

### Elementos Principales

1. **Caja de búsqueda general**: Para buscar por número de encuentro, nombres o apellidos del paciente.
2. **Selector "Solo Positivos"**: Filtro rápido para mostrar únicamente encuentros con Tipo de Protocolo = Positivo.
3. **Botón "Restablecer Vista"**: Limpia todos los filtros y búsquedas aplicados.
4. **Botón "Descargar"**: Permite exportar la información visible a un archivo Excel.
5. **Contador de registros**: Muestra la cantidad de registros encontrados (ejemplo: "33 registros encontrados").
6. **Grilla de encuentros**: Tabla con 12 columnas que muestra los encuentros en Protocolo.

### Estado Inicial de la Pantalla

Al acceder por primera vez:

- Selector "Solo Positivos": Desactivado
- Caja de búsqueda: Vacía
- Filtros por columna: Ninguno aplicado
- Grilla: Muestra TODOS los encuentros (positivos y negativos)
- Contador: Muestra el total de encuentros disponibles

---

## 12.4 Columnas de la Grilla

La grilla muestra **12 columnas** en el siguiente orden:

| # | Columna | Descripción |
|---|---------|-------------|
| 1 | Encuentro | Número identificador del encuentro |
| 2 | Tipo de Encuentro | Consulta Externa No Oncosalud / Consulta Externa Oncosalud / Emergencia |
| 3 | Tipo de Protocolo | Positivo / Negativo |
| 4 | Fecha de Apertura | Fecha de creación del encuentro (formato DD/MM/YYYY) |
| 5 | Sede | Sede donde se realizó el encuentro |
| 6 | Apellidos | Apellidos del paciente |
| 7 | Nombres | Nombres del paciente |
| 8 | Garante | Aseguradora o garante del encuentro |
| 9 | Producto | Producto del seguro |
| 10 | Beneficio | Beneficio asociado |
| 11 | Mecanismo | Mecanismo de pago (ejemplo: CAPITA, CÁPITA, etc.) |
| 12 | Monto | Monto del encuentro (formato: S/ 1,250.00) |

**Optimización visual:**

- Todas las 12 columnas deben ser visibles sin scroll horizontal excesivo.
- El diseño debe optimizar el espacio disponible en pantalla.

---

## 12.5 Tipo de Protocolo: Positivo vs Negativo

Los encuentros clasificados en Protocolo se dividen en dos tipos:

### Positivo

Encuentros que **SÍ cumplen** criterios específicos de protocolo establecidos por el negocio.

### Negativo

Encuentros que **NO cumplen** criterios específicos de protocolo, pero que aún así están clasificados en la bandeja de Protocolo porque cumplieron todas las validaciones de Admisión y están dentro del rango de antigüedad permitido.

**Visualización:**

- La columna "Tipo de Protocolo" debe mostrar claramente "Positivo" o "Negativo".
- Puede aplicarse diferenciación visual mediante colores, badges o iconos.
- Por defecto, la grilla muestra AMBOS tipos (positivos y negativos).

---

## 12.6 Funcionalidad de Búsqueda

### Búsqueda General

La caja de búsqueda permite buscar por:

- **Número de encuentro**: Búsqueda exacta.
- **Nombres del paciente**: Búsqueda parcial por coincidencia.
- **Apellidos del paciente**: Búsqueda parcial por coincidencia.

**Comportamiento:**

- El usuario ingresa el texto y presiona Enter.
- La grilla filtra y muestra solo los resultados que coinciden.
- El contador se actualiza dinámicamente.
- Si no hay resultados: Muestra "0 registros encontrados" y mensaje "No se encontraron coincidencias".

**Limpiar búsqueda:**

- El usuario borra el contenido de la caja y presiona Enter.
- La grilla vuelve a mostrar todos los encuentros.

---

## 12.7 Funcionalidad de Filtros

### Filtro "Solo Positivos"

Selector tipo toggle que permite mostrar únicamente encuentros con **Tipo de Protocolo = Positivo**.

**Comportamiento:**

- **Desactivado** (por defecto): Muestra todos los encuentros (positivos y negativos).
- **Activado**: Muestra solo encuentros positivos.
- Al activar/desactivar, el contador se actualiza automáticamente.

### Filtros por Encabezado de Columna

Las siguientes columnas **permiten filtrado**:

- Tipo de Encuentro
- Tipo de Protocolo
- Fecha de Apertura (rango de fechas)
- Sede
- Garante
- Producto
- Beneficio

Las siguientes columnas **NO permiten filtrado**:

- Encuentro
- Apellidos
- Nombres
- Mecanismo
- Monto

**Comportamiento de filtros:**

- Se pueden aplicar múltiples filtros simultáneamente.
- Los filtros funcionan de manera acumulativa (AND lógico).
- El contador se actualiza dinámicamente con cada filtro aplicado.

### Combinación de Filtros

Es posible combinar:

- Búsqueda general + Filtro "Solo Positivos"
- Búsqueda general + Filtros por columna
- Filtro "Solo Positivos" + Filtros por columna
- Todas las anteriores simultáneamente

---

## 12.8 Funcionalidad "Restablecer Vista"

**Propósito:** Limpiar todos los filtros y búsquedas aplicados para volver al estado inicial.

**Comportamiento al presionar "Restablecer Vista":**

1. La caja de búsqueda se limpia.
2. El selector "Solo Positivos" se desactiva.
3. Todos los filtros por columna se eliminan.
4. La grilla muestra todos los encuentros disponibles.
5. El contador muestra el total de encuentros en Protocolo.

**Estado del botón:**

- El botón está **siempre habilitado**.
- Funciona incluso si no hay filtros aplicados (en cuyo caso la pantalla permanece igual).

---

## 12.9 Funcionalidad de Exportación

### Botón "Descargar"

Permite exportar la información visible en la grilla a un archivo Excel (.xlsx).

**Estado del botón:**

- Siempre habilitado.
- Funciona incluso si no hay encuentros en la grilla.

### Comportamiento de la Exportación

**Con datos disponibles:**

- Se genera un archivo Excel con extensión `.xlsx`.
- El archivo contiene los encuentros actualmente visibles (respetando filtros aplicados).
- Nombre del archivo: `encuentros_protocolo_YYYYMMDD_HHMMSS.xlsx`
- Ejemplo: `encuentros_protocolo_20260608_143025.xlsx`

**Sin datos disponibles:**

- Se descarga un archivo Excel vacío.
- El archivo contiene únicamente los encabezados de las 12 columnas.
- Se muestra mensaje: "No hay datos para exportar" o "No hay datos que coincidan con la búsqueda".

### Estructura del Archivo Excel

**Encabezados (primera fila):**

- Formato destacado (negrita).
- Color de fondo diferente al de los datos.
- Filtro automático de Excel habilitado.

**Columnas:** Las mismas 12 columnas de la grilla en el mismo orden.

**Formato de datos:**

- **Fecha de Apertura**: Formato DD/MM/YYYY, editable en Excel (no texto plano).
- **Monto**: Formato numérico con símbolo de moneda, 2 decimales (ejemplo: S/ 1,250.00).
- **Valores vacíos**: Se muestran como celdas vacías o con "-" (nunca "NULL" o "undefined").

**Orden de registros:**

- Si hay ordenamiento aplicado en la grilla: Se respeta en el Excel.
- Si no hay ordenamiento: Se usa el orden por defecto del sistema.

### Exportación con Filtros

La exportación **respeta todos los filtros aplicados**:

- Si está activo "Solo Positivos": Solo exporta encuentros positivos.
- Si hay búsqueda aplicada: Solo exporta los resultados de la búsqueda.
- Si hay filtros por columna: Solo exporta los encuentros que cumplen todos los filtros.

**Consistencia con la UI:**

- El contenido del archivo Excel debe coincidir exactamente con lo mostrado en la grilla.
- La cantidad de registros en el Excel debe ser igual al contador mostrado en pantalla.

### Validación de Compatibilidad

El archivo descargado debe poder abrirse correctamente en:

- Microsoft Excel
- Google Sheets
- LibreOffice Calc

---

## 12.10 Restricciones de Interacción

### Pantalla de Solo Lectura

La pantalla "Encuentros en Protocolo" es **exclusivamente de visualización**.

**Acciones NO permitidas:**

- Hacer clic en un encuentro para ver su detalle.
- Abrir ventanas emergentes o modales con información adicional.
- Editar información de encuentros.
- Cambiar el estado de encuentros.
- Mover encuentros entre bandejas.
- Eliminar encuentros.

**Interacciones permitidas:**

- Visualizar información.
- Buscar y filtrar.
- Exportar a Excel.
- Restablecer vista.

### Sin Acceso al Detalle del Encuentro

- No existe enlace para acceder al detalle del encuentro.
- El doble clic sobre un encuentro NO abre ninguna ventana.
- No hay botones de "Ver detalle", "Editar" o "Cambiar estado".

---

## 12.11 Actualización de Datos

### Responsabilidad del Job de Admisión

La información mostrada en la pantalla es actualizada **exclusivamente por el Job de Admisión**.

La pantalla NO realiza:

- Clasificaciones de encuentros.
- Reclasificaciones de encuentros.
- Modificaciones de datos.

### Frecuencia de Actualización

Los datos en pantalla reflejan el resultado de la última ejecución del Job de Admisión.

Cuando el Job reclasifica un encuentro:

- Si un encuentro deja de cumplir las condiciones: Desaparece de la pantalla "Encuentros en Protocolo".
- Si un encuentro supera el período de antigüedad: Desaparece de la pantalla (pasó a Facturación).
- Si un encuentro recién cumple todas las condiciones: Aparece en la pantalla.

### Fuente de Verdad

- **Sistema origen**: XHIS y otros sistemas externos.
- **Clasificación**: Job de Admisión.
- **Pantalla**: Vista de solo lectura que refleja la clasificación actual.

---

## 12.12 Auditoría

### Registro de Accesos Autorizados

Cada vez que un Gestor TA accede exitosamente a "Encuentros en Protocolo", se registra:

| Campo | Valor |
|-------|-------|
| usuario | Nombre del Gestor TA |
| rol | Gestor TA |
| acción | Acceso a Encuentros Protocolo |
| fecha_hora | Timestamp actual |
| resultado | Exitoso |

### Registro de Intentos de Acceso Denegado

Cada vez que un usuario sin permisos intenta acceder, se registra:

| Campo | Valor |
|-------|-------|
| usuario | Nombre del usuario |
| rol | Rol del usuario |
| acción | Intento de acceso a Protocolo |
| fecha_hora | Timestamp actual |
| resultado | Denegado |
| motivo | Rol no autorizado |

---

## 12.13 Persistencia de Filtros

Los filtros y búsquedas aplicados **NO persisten**:

- Al recargar la página (F5): Se eliminan todos los filtros.
- Al salir y volver a entrar: La pantalla se carga en su estado inicial.
- Al cambiar de usuario: No se conservan filtros del usuario anterior.

**Estado inicial tras recarga:**

- Selector "Solo Positivos": Desactivado
- Caja de búsqueda: Vacía
- Filtros por columna: Ninguno
- Grilla: Muestra todos los encuentros

---

## 12.14 Reglas de Negocio Asociadas

Esta funcionalidad está vinculada a las siguientes reglas de negocio:

- **RN35**: Clasificación de encuentros en Protocolo (Consulta Externa No Oncosalud < 7 días)
- **RN36**: Clasificación de encuentros en Protocolo (Consulta Externa Oncosalud ≤ 31 días)
- **RN37**: Clasificación de encuentros en Protocolo (Emergencia ≤ 2 días)
- **RN38**: Salida de Protocolo por antigüedad
- **RN39**: Permanencia en Protocolo
- **RN49**: Validación de documentación administrativa
- **RN52**: Validación de laboratorios completos
- **RN53**: Validación de laboratorios finalizados
- **RN54**: Validación de laboratorios imputados

---

## 12.15 Mensajes al Usuario

### Mensajes de Estado

| Situación | Mensaje |
|-----------|---------|
| Sin encuentros disponibles | "No hay encuentros en protocolo disponibles" |
| Búsqueda sin resultados | "No se encontraron coincidencias" |
| Filtro Sin Positivos sin resultados | "No hay encuentros positivos disponibles" |
| Exportación exitosa | "Archivo descargado exitosamente" |
| Exportación con filtros | "Archivo con filtros aplicados descargado exitosamente" |
| Exportación sin datos | "No hay datos para exportar" |
| Exportación sin resultados de búsqueda | "No hay datos que coincidan con la búsqueda" |

### Mensajes de Error de Permisos

| Situación | Mensaje |
|-----------|---------|
| Acceso denegado (general) | "Acceso Denegado" |
| Sin permisos | "No tiene permisos para acceder a esta funcionalidad" |
| Acceso denegado (detallado) | "Acceso Denegado. No tiene permisos para acceder a la funcionalidad Encuentros en Protocolo. Esta funcionalidad es exclusiva para usuarios con rol Gestor TA." |
| Exportación sin permisos | "No tiene permisos para exportar esta información" |

---

## 12.16 Consideraciones Técnicas

### Performance

- La pantalla debe cargar rápidamente incluso con grandes volúmenes (hasta 5,000 encuentros).
- La exportación de grandes volúmenes no debe exceder 30 segundos.
- El contador y filtros deben actualizarse de forma dinámica sin necesidad de recargar la página.

### Seguridad

- Validación de permisos tanto en frontend como en backend.
- Bloqueo de acceso directo por URL para usuarios no autorizados.
- Validación de token de sesión en todas las peticiones.
- Registro de intentos de acceso no autorizado.
- Protección contra URL manipulation.

### Escalabilidad

- La funcionalidad debe soportar el crecimiento del volumen de encuentros.
- Si se establece un límite de exportación, debe informarse claramente al usuario.
- Sugerencia: "La exportación está limitada a X registros. Por favor aplique filtros."
