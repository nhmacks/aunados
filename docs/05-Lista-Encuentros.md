# 03-Lista-Encuentros.md

# Lista de Encuentros

## 1. Objetivo

La funcionalidad **Lista de Encuentros** permite visualizar, consultar, filtrar, buscar, descargar y gestionar los encuentros clasificados para la bandeja de Admisión.

Esta funcionalidad constituye la principal bandeja operativa del proceso de Admisión y es utilizada para realizar el seguimiento de los encuentros que requieren revisión administrativa antes de continuar su flujo hacia Protocolo o Facturación.

---

# 2. Alcance

La funcionalidad permite:

* Visualizar encuentros clasificados para Admisión.
* Buscar encuentros.
* Filtrar encuentros.
* Descargar resultados.
* Acceder al detalle del encuentro.
* Actualizar estados del encuentro según permisos del perfil.
* Consultar información clínica, administrativa y de seguros asociada al encuentro.

---

# 3. Roles Autorizados

## 3.1 Superusuario de Admisión

Puede:

* Visualizar todos los encuentros clasificados para Admisión.
* Visualizar encuentros de todas las sedes.
* Visualizar encuentros creados por cualquier usuario.
* Buscar encuentros.
* Aplicar filtros.
* Ordenar información.
* Descargar resultados.
* Acceder al detalle del encuentro.
* Modificar estados.

---

## 3.2 Ejecutivo de Admisión

Puede:

* Visualizar únicamente encuentros:

  * Clasificados para Admisión.
  * Creados por su usuario.
  * Asociados a su sede.
* Buscar encuentros.
* Aplicar filtros habilitados.
* Descargar resultados.
* Acceder al detalle del encuentro.
* Modificar únicamente estados permitidos.

---

## 3.3 Gestor TA

Puede:

* Visualizar todos los encuentros clasificados para Admisión.
* Visualizar encuentros de todas las sedes.
* Buscar encuentros.
* Aplicar filtros.
* Descargar resultados.
* Acceder al detalle del encuentro.

No puede:

* Modificar estados.
* Visualizar controles de cambio de estado.

---

# 4. Acceso a la Funcionalidad

Al iniciar sesión:

## Superusuario de Admisión

Visualizará la pantalla Lista de Encuentros.

---

## Ejecutivo de Admisión

Visualizará la pantalla Lista de Encuentros.

---

## Gestor TA

Visualizará la pantalla Lista de Encuentros.

---

# 5. Definición de Encuentro en Admisión

Un encuentro visible en la bandeja Lista de Encuentros es aquel que ha sido clasificado por el Job de Admisión como pendiente de gestión administrativa.

---

## Estado Inicial

### RN-LE-001

Todo encuentro que ingrese por primera vez a la bandeja Lista de Encuentros deberá registrarse con estado:

**Pendiente**

---

# 6. Paginación

### RN-LE-002

La grilla mostrará 50 registros por página.

### RN-LE-003

Los encuentros más recientes deberán visualizarse primero.

### RN-LE-004

Los encuentros más antiguos deberán visualizarse al final.

---

# 7. Búsqueda

La pantalla contará con una caja de búsqueda.

---

## Criterios Permitidos

* Número de Encuentro
* Nombres
* Apellidos

---

## Funcionamiento

### RN-LE-005

La búsqueda se ejecutará al presionar la tecla Enter.

### RN-LE-006

La grilla se actualizará mostrando únicamente los resultados encontrados.

---

## Validaciones de Búsqueda

### RN-LE-038

**Validación de mínimo de caracteres**

La búsqueda requiere un mínimo de 3 caracteres para ejecutarse.

**Comportamiento:**

* Al ingresar el primer carácter en la caja de búsqueda, el sistema mostrará debajo de la caja de texto el mensaje: **"Mínimo 3 caracteres"**
* El mensaje se mantendrá visible mientras se tengan menos de 3 caracteres ingresados
* Al completar el tercer carácter, el mensaje desaparecerá automáticamente
* La búsqueda se habilitará solo cuando se hayan ingresado 3 o más caracteres

### RN-LE-039

**Validación de caracteres especiales**

El sistema no permite el ingreso de caracteres especiales en la búsqueda.

**Comportamiento:**

* Si el usuario ingresa un carácter especial (ejemplos: `@`, `#`, `$`, `%`, `&`, `*`, `(`, `)`, `{`, `}`, `[`, `]`, `<`, `>`, `/`, `\`, `|`, etc.), el sistema mostrará debajo de la caja de texto el mensaje: **"No se permiten caracteres especiales en la búsqueda."**
* El mensaje se mostrará mientras existan caracteres especiales en el campo
* Al eliminar todos los caracteres especiales, el mensaje desaparecerá
* La búsqueda no se ejecutará mientras existan caracteres especiales en el campo

**Nota:** Los caracteres permitidos son:
* Letras (a-z, A-Z)
* Números (0-9)
* Espacios
* Caracteres con tilde (á, é, í, ó, ú)
* Ñ, ñ

---

## Manejo de Errores en Búsqueda

### Pendiente por Definir

**NOTA IMPORTANTE:** El comportamiento del sistema ante errores durante la búsqueda está pendiente de definir. Se requiere especificar:

1. **Error del servicio:**
   - Mensaje de error a mostrar (título y descripción)
   - Comportamiento de la grilla (¿se mantienen datos previos o se vacía?)
   - Estado del contador de resultados

2. **Timeout del servicio:**
   - Tiempo de timeout configurado
   - Mensaje específico para timeout
   - Indicador visual durante la espera (loader/spinner)
   - Opción de cancelar la búsqueda

3. **Error de conexión:**
   - Mensaje específico para pérdida de conexión
   - Diferenciación con error general del servicio
   - Mecanismo de reintento automático

4. **Interacción con filtros:**
   - Comportamiento cuando hay filtros activos y la búsqueda falla
   - Preservación del estado de la grilla
   - Disponibilidad de otras funcionalidades durante el error

5. **Recuperación de errores:**
   - Opción de "Reintentar" búsqueda
   - Preservación del término de búsqueda ingresado
   - Comportamiento del sistema al recuperarse del error

**Referencia:** Ver escenarios BUS-32 a BUS-38 en `busqueda.feature`

---

# 8. Botones Disponibles

## Descargar

Permite exportar los resultados mostrados en la grilla.

---

## Restablecer Vista

Permite eliminar todos los filtros aplicados.

---

# 9. Visualización para Superusuario de Admisión

La grilla mostrará:

* Sede
* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Prioridad
* Usuario
* Garante
* Tipo de Encuentro
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso
* Monto

---

# 10. Visualización para Ejecutivo de Admisión

La grilla mostrará:

* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Prioridad
* Garante
* Tipo de Encuentro

---

# 11. Visualización para Gestor TA

La grilla mostrará:

* Sede
* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Prioridad
* Usuario
* Garante
* Tipo de Encuentro
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso
* Monto

---

# 12. Ordenamiento

Aplica para:

* Superusuario de Admisión
* Gestor TA
* Ejecutivo de Admisión

---

## Campos Ordenables para Superusuario de Admisión y Gestor TA

* Encuentro
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Usuario
* Garante
* Tipo de Encuentro
* Monto

---

## Campos Ordenables para Ejecutivo de Admisión

* Encuentro
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Garante
* Tipo de Encuentro

**Nota:** El campo "Usuario" no está disponible para ordenamiento en el perfil de Ejecutivo de Admisión porque este campo no está visible en su grilla.

---

### RN-LE-007

El ordenamiento permitirá:

* Ascendente (ASC)
* Descendente (DESC)

---

# 13. Filtros

## Superusuario de Admisión

Podrá filtrar por:
* Sede
* Estado
* Fecha Apert.
* Prioridad
* Usuario
* Garante
* Tipo de Encuentro
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso

---

## Ejecutivo de Admisión

Podrá filtrar por:

* Estado
* Fecha Apert.
* Prioridad
* Garante
* Tipo de Encuentro

---

## Gestor TA

Podrá filtrar por:

* Sede
* Estado
* Fecha Apert.
* Prioridad
* Usuario
* Garante
* Tipo de Encuentro
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso

---

# 14. Sin Resultados

Cuando no existan registros para mostrar:

## Mensaje

Hubo un inconveniente.

En estos momentos no podemos mostrar la información que necesita.

Por favor, inténtelo nuevamente.

---

# 15. Descarga de Información

## Generación

La descarga no será inmediata.

---

### RN-LE-008

Al solicitar una descarga, el sistema iniciará un proceso asíncrono de generación.

---

### RN-LE-009

Una notificación será enviada a la campana de notificaciones cuando el archivo se encuentre disponible.

---

## Mensaje de Notificación

El reporte solicitado ya está listo.

Tienes una hora para descargarlo.

---

## Acción Disponible

Botón:

Descargar

---

# 16. Archivo Generado

## Nombre

Lista de Encuentros de Admisión.xlsx

---

## Formato

.xlsx

---

# 17. Información Exportada

## 17.1 Columnas para Superusuario de Admisión

El archivo contendrá 14 columnas:

* Sede
* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Usuario
* Garante
* Prioridad
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso
* Monto

---

## 17.2 Columnas para Gestor TA

El archivo contendrá 14 columnas:

* Sede
* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Usuario
* Garante
* Prioridad
* Sustentos Administrativos
* Sustentos Médicos
* Sustento de Proceso
* Monto

---

## 17.3 Columnas para Ejecutivo de Admisión

El archivo contendrá 13 columnas:

* Sede
* Encuentro
* Estado
* Nº HC
* Apellidos
* Nombres
* Fecha Apert.
* Usuario
* Garante
* Prioridad
* Sustentos Administrativos
* Sustentos Médicos
* Monto

**Nota:** El Ejecutivo de Admisión NO exporta la columna "Sustento de Proceso".

**Importante:** El Ejecutivo de Admisión puede exportar columnas que no visualiza en su grilla (Sede, Usuario, Sustentos Administrativos, Sustentos Médicos, Monto).

---

## Descripción de Campos

### Sede

Descripción de la sede.

Ejemplos:

* Minas Flores
* Centro de Bienestar
* AUNA Guardia Civil
* Delgado

---

### Encuentro

Número de encuentro de 8 dígitos.

---

### Estado

Descripción funcional del estado.

---

### NHC

Número de Historia Clínica.

---

### Apellidos

Apellidos del paciente.

---

### Nombres

Nombres del paciente.

---

### Fecha de Apertura

Formato:

YYYY-MM-DD

Ejemplo:

2026-06-03

---

### Usuario

Nombre completo del usuario asociado.

---

### Garante

Descripción del garante.

Ejemplos:

* Oncosalud
* MAPFRE EPS
* AUNA No Oncológico
* La Positiva

---

### Prioridad

Valor de prioridad asociado al encuentro.

---

### Sustentos Administrativos

Lista de documentos administrativos pendientes.

Ejemplos:

* Carta de Garantía Iniciada
* Hoja SITEDS
* Denuncia Policial
* SOAT Tarjeta Física

Pueden mostrarse múltiples valores separados por ";".

---

### Sustentos Médicos

Si existen sustentos médicos pendientes:

Laboratorio

Caso contrario:

*

---

### Sustento de Proceso

Si existen laboratorios no imputados:

Laboratorio

Caso contrario:

*

---

### Monto

Monto asociado al encuentro.

---

# 18. Acceso al Detalle del Encuentro

El usuario podrá seleccionar cualquier encuentro mostrado en la grilla.

---

### RN-LE-010

Al seleccionar un encuentro, el sistema mostrará la pantalla Detalle del Encuentro.

---

# 19. Relación con Encuentros Devueltos

### RN-LE-011

La bandeja Lista de Encuentros no mostrará encuentros devueltos.

### RN-LE-012

Los encuentros devueltos deberán visualizarse exclusivamente en la funcionalidad Encuentros Devueltos.

---

# 20. Relación con Facturación

### RN-LE-013

Los estados No Facturable y Error de Facturación provocarán la salida inmediata del encuentro de la bandeja Lista de Encuentros.

### RN-LE-014

La llegada posterior del encuentro a Facturación dependerá exclusivamente de la ejecución del Job de Admisión.

### RN-LE-015

El Responsable de Facturación visualizará dichos encuentros únicamente cuando el Job determine que corresponden a Facturación.

---

# 21. Relación con el Job de Admisión

### RN-LE-016

La clasificación de los encuentros es responsabilidad exclusiva del Job de Admisión.

### RN-LE-017

Un cambio de estado no determina la bandeja donde se visualizará el encuentro.

### RN-LE-018

El estado operativo y la bandeja son conceptos independientes.

### RN-LE-019

El Job evaluará periódicamente los encuentros y determinará si corresponden a:

* Admisión
* Protocolo
* Facturación

### RN-LE-020

Un encuentro podrá retornar desde Facturación hacia Admisión cuando el Job detecte:

* Exámenes imputados sin resultado.
* Exámenes con resultado no imputados.
* Documentación administrativa pendiente.
* Cualquier otra condición definida por negocio.

---

## 21.1 Encuentros en Cualquier Estado Permanecen en Admisión

### RN-LE-023

Un encuentro puede encontrarse en cualquier estado operativo (Pendiente, Tramitado, Derivado a Dirección Médica, En Proceso, etc.) y permanecer en la bandeja Lista de Encuentros.

### RN-LE-024

El estado operativo del encuentro NO determina su salida de la bandeja Lista de Encuentros.

### RN-LE-025

Solo el Job de Admisión puede determinar cuándo un encuentro debe salir de la bandeja Lista de Encuentros.

---

## 21.2 Criterios de Salida de Admisión

El Job de Admisión evaluará los siguientes criterios para determinar si un encuentro debe salir de Admisión:

### RN-LE-026

**Documentación Administrativa Completa:**
- Todos los documentos administrativos requeridos deben estar completos.
- Ejemplos: Carta de Garantía, Hoja SITEDS, SOAT, Autorización de Seguro.

### RN-LE-027

**Resultados de Laboratorio Cargados:**
- Todos los exámenes solicitados deben tener resultados cargados en el sistema.
- No deben existir exámenes pendientes de resultado.

### RN-LE-028

**Exámenes Médicos Imputados:**
- Todos los exámenes con resultado deben estar imputados correctamente.
- No deben existir exámenes con resultado pendiente de imputación.

### RN-LE-029

**Criterio de Completitud:**
- Un encuentro sale de Admisión SOLO cuando se cumplen los tres criterios simultáneamente:
  1. Documentación administrativa completa
  2. Resultados de laboratorio cargados
  3. Exámenes médicos imputados

### RN-LE-030

Si falta cualquiera de los tres criterios, el encuentro permanecerá en la bandeja Lista de Encuentros independientemente de su estado operativo.

---

## 21.3 Destino: Facturación vs Protocolo

### RN-LE-031

Cuando un encuentro cumple todos los criterios de completitud, el Job de Admisión evaluará el **tipo de encuentro**, el **garante** y la **fecha de creación** para determinar su destino.

---

### RN-LE-032

**Consulta Externa NO Oncosalud:**
- Requisitos previos:
  - Documentación administrativa completa
  - Exámenes de laboratorio completos (con resultado e imputados)
- Criterio temporal:
  - **< 7 días de creación** → **Protocolo**
  - **≥ 7 días de creación** → **Facturación**

---

### RN-LE-033

**Consulta Externa Oncosalud:**
- Requisitos previos:
  - Documentación administrativa completa
  - Exámenes de laboratorio completos (con resultado e imputados)
- Criterio temporal:
  - **< 31 días de creación** → **Protocolo**
  - **≥ 31 días de creación** → **Facturación**

---

### RN-LE-034

**Emergencia:**
- Requisitos previos:
  - Documentación administrativa completa
  - Exámenes de laboratorio completos (con resultado e imputados)
- Criterio temporal:
  - **< 2 días de creación** → **Protocolo**
  - **≥ 2 días de creación** → **Facturación**

---

### RN-LE-035

El Job de Admisión evaluará en el siguiente orden:
1. Tipo de encuentro (Consulta Externa o Emergencia)
2. Garante (si es Consulta Externa: Oncosalud o No Oncosalud)
3. Días desde la creación del encuentro
4. Aplicará el umbral correspondiente según el tipo y garante

---

### RN-LE-036

**Resumen de clasificación:**
- **Admisión**: Encuentros con documentación o laboratorios INCOMPLETOS (sin importar tipo, garante o fecha)
- **Protocolo**: Encuentros con TODO COMPLETO + dentro del umbral de días según tipo y garante
- **Facturación**: Encuentros con TODO COMPLETO + fuera del umbral de días según tipo y garante

---

### RN-LE-037

**Tabla resumen de umbrales:**

| Tipo de Encuentro  | Garante      | Umbral      | Protocolo        | Facturación    |
|--------------------|--------------|-------------|------------------|----------------|
| Consulta Externa   | NO Oncosalud | 7 días      | < 7 días         | ≥ 7 días       |
| Consulta Externa   | Oncosalud    | 31 días     | < 31 días        | ≥ 31 días      |
| Emergencia         | Cualquiera   | 2 días      | < 2 días         | ≥ 2 días       |

---

## 21.4 Flujo de Completitud

**Ejemplo 1: Consulta Externa NO Oncosalud (< 7 días) → Protocolo**

1. Encuentro de Consulta Externa ingresa a Admisión (Garante: MAPFRE EPS, creado hace 3 días)
2. Estado inicial: "Pendiente"
3. Ejecutivo cambia estado a "En Proceso" → Permanece en Admisión (documentación incompleta)
4. Se completa documentación administrativa → Permanece en Admisión (laboratorios sin resultado)
5. Se cargan resultados de laboratorio → Permanece en Admisión (exámenes no imputados)
6. Se imputan todos los exámenes → **Job evalúa y reclasifica**
7. Job determina:
   - Tipo: Consulta Externa
   - Garante: MAPFRE (NO Oncosalud)
   - Días: 3 (< 7 días)
   - **Destino: Protocolo**

**Ejemplo 2: Consulta Externa Oncosalud (≥ 31 días) → Facturación**

1. Encuentro de Consulta Externa ingresa a Admisión (Garante: Oncosalud, creado hace 45 días)
2. Estado inicial: "Pendiente"
3. Se completa documentación administrativa → Permanece en Admisión (laboratorios sin resultado)
4. Se cargan resultados de laboratorio → Permanece en Admisión (exámenes no imputados)
5. Se imputan todos los exámenes → **Job evalúa y reclasifica**
6. Job determina:
   - Tipo: Consulta Externa
   - Garante: Oncosalud
   - Días: 45 (≥ 31 días)
   - **Destino: Facturación**

**Ejemplo 3: Emergencia (< 2 días) → Protocolo**

1. Encuentro de Emergencia ingresa a Admisión (Garante: Pacífico EPS, creado hace 1 día)
2. Estado inicial: "Pendiente"
3. Se completa documentación administrativa y laboratorios el mismo día
4. Se imputan todos los exámenes → **Job evalúa y reclasifica**
5. Job determina:
   - Tipo: Emergencia
   - Días: 1 (< 2 días)
   - **Destino: Protocolo**

**Ejemplo 4: Emergencia (≥ 2 días) → Facturación**

1. Encuentro de Emergencia ingresa a Admisión (Garante: La Positiva, creado hace 5 días)
2. Estado inicial: "Pendiente"
3. Se completa documentación administrativa → Permanece en Admisión (laboratorios sin resultado)
4. Se cargan resultados después de 3 días → Permanece en Admisión (exámenes no imputados)
5. Se imputan todos los exámenes → **Job evalúa y reclasifica**
6. Job determina:
   - Tipo: Emergencia
   - Días: 5 (≥ 2 días)
   - **Destino: Facturación**

**Importante:** El encuentro puede tener múltiples cambios de estado operativo, pero solo el Job de Admisión determina cuándo y hacia dónde debe salir, basándose en el tipo de encuentro, garante, y días desde creación.

---

# 22. Historial de Estados

### RN-LE-021

Cada actualización de estado deberá generar un nuevo registro en:

toyota.visit_occurrence_status_history

### RN-LE-022

El registro deberá generarse por cada servicio asociado al encuentro.

---

# 23. Consideraciones Funcionales

## 23.1 Permisos y Estados

* El Gestor TA no visualiza el componente de estado dentro del detalle del encuentro.
* El Gestor TA no puede modificar estados.
* El Ejecutivo de Admisión únicamente puede visualizar los estados habilitados para su perfil.
* El estado actual del encuentro no deberá mostrarse dentro del listado de estados disponibles.
* Si múltiples usuarios actualizan el mismo encuentro, prevalecerá el último estado registrado exitosamente.
* Los estados Derivado a Dirección Médica y Derivado a Supervisor son estados informativos.
* Terapia en Proceso es un estado informativo y posteriormente podrá ser modificado por el Ejecutivo de Admisión.
* Los estados exportados deberán mostrarse exactamente como son visualizados por el usuario.

## 23.2 Job de Admisión y Clasificación

* Un encuentro puede permanecer en la bandeja Lista de Encuentros independientemente de su estado operativo.
* El cambio de estado NO provoca la salida del encuentro de Admisión (excepto estados especiales: No Facturable y Error de Facturación).
* Solo el Job de Admisión determina cuándo un encuentro debe salir de la bandeja Lista de Encuentros.
* El Job evalúa tres criterios de completitud: documentación administrativa, resultados de laboratorio, e imputación de exámenes.
* Un encuentro permanecerá en Admisión hasta que los tres criterios estén completos, sin importar su estado.
* El destino (Protocolo o Facturación) se determina por: tipo de encuentro (Consulta Externa o Emergencia), garante (Oncosalud o No Oncosalud), y días desde creación.
* Umbrales temporales: Consulta Externa NO Oncosalud (7 días), Consulta Externa Oncosalud (31 días), Emergencia (2 días).
* Un encuentro puede tener múltiples cambios de estado a lo largo del tiempo, pero solo el Job decide su clasificación final.
* El Job evalúa periódicamente todos los encuentros, sin importar su estado operativo actual.
