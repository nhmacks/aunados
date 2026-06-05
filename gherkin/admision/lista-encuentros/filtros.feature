# language: es

Característica: Filtros en Lista de Encuentros de Admisión
  Como usuario del sistema AUNADOS
  Quiero aplicar filtros a la lista de encuentros
  Para localizar rápidamente encuentros según criterios específicos

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y estoy en la pantalla "Lista de Encuentros"

  # ========================================================================
  # DISPONIBILIDAD DE FILTROS POR ROL
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-01 - Superusuario y Gestor visualizan todos los filtros disponibles
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando accedo a la sección de filtros
    Entonces debo visualizar los siguientes filtros disponibles:
      | Filtro                    |
      | Sede                      |
      | Estado                    |
      | Fecha Apertura            |
      | Prioridad                 |
      | Usuario                   |
      | Garante                   |
      | Tipo de Encuentro         |
      | Sustento Administrativo   |
      | Sustento Médico           |

  @ejecutivoAdmision
  Escenario: FIL-02 - Ejecutivo visualiza solo filtros permitidos para su rol
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando accedo a la sección de filtros
    Entonces debo visualizar los siguientes filtros disponibles:
      | Filtro            |
      | Estado            |
      | Fecha Apertura    |
      | Prioridad         |
      | Garante           |
      | Tipo de Encuentro |
    Y NO debo visualizar los siguientes filtros:
      | Filtro                    |
      | Sede                      |
      | Usuario                   |
      | Sustento Administrativo   |
      | Sustento Médico           |

  # ========================================================================
  # FILTRO POR SEDE
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-03 - Filtrar por una sede específica
    Dado que existen encuentros de múltiples sedes
    Cuando selecciono el filtro "Sede"
    Y selecciono la sede "Auna Guardia Civil"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros de la sede "Auna Guardia Civil"
    Y el contador debe actualizarse automáticamente
    Y el filtro debe permanecer activo

  @superusuarioAdmision @gestorTA
  Escenario: FIL-04 - Filtrar por múltiples sedes simultáneamente
    Dado que existen encuentros de múltiples sedes
    Cuando selecciono el filtro "Sede"
    Y selecciono las sedes:
      | Sede                |
      | Auna Guardia Civil  |
      | Las Flores          |
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros de ambas sedes seleccionadas
    Y el contador debe mostrar la suma de encuentros de ambas sedes

  @superusuarioAdmision @gestorTA
  Escenario: FIL-05 - Buscar sede dentro del filtro de Sede
    Dado que he abierto el filtro "Sede"
    Cuando ingreso "Auna" en el campo de búsqueda del filtro
    Entonces el sistema debe mostrar únicamente las sedes que contengan "Auna"
    Y debe permitir seleccionarlas

  @superusuarioAdmision @gestorTA
  Escenario: FIL-06 - Limpiar filtro de Sede sin afectar otros filtros
    Dado que he aplicado el filtro "Sede" con valor "Auna Guardia Civil"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Cuando presiono el botón "Limpiar" del filtro "Sede"
    Entonces el filtro "Sede" debe eliminarse
    Y el filtro "Estado" debe permanecer activo
    Y la grilla debe actualizarse mostrando todos los encuentros con estado "Pendiente"

  # ========================================================================
  # FILTRO POR ESTADO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-07 - Filtrar por un estado específico
    Dado que existen encuentros en diferentes estados
    Cuando selecciono el filtro "Estado"
    Y selecciono el estado "Pendiente"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con estado "Pendiente"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-08 - Filtrar por múltiples estados simultáneamente
    Dado que existen encuentros en diferentes estados
    Cuando selecciono el filtro "Estado"
    Y selecciono los estados:
      | Estado              |
      | Pendiente           |
      | Tramitado           |
      | Pago por Adelantado |
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros de los tres estados seleccionados
    Y el contador debe reflejar la suma de encuentros de todos los estados

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-09 - Buscar estado dentro del filtro de Estado
    Dado que he abierto el filtro "Estado"
    Cuando ingreso "Pend" en el campo de búsqueda del filtro
    Entonces el sistema debe mostrar los estados que contengan "Pend":
      | Estado                |
      | Pendiente             |
      | Pendiente de Revisión |

  # ========================================================================
  # FILTRO POR FECHA DE APERTURA
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-10 - Filtrar por fecha exacta usando operador "Igual a"
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando selecciono el filtro "Fecha Apertura"
    Y selecciono el operador "Igual a"
    Y ingreso la fecha "03/06/2026"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con fecha de apertura "03/06/2026"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-11 - Filtrar por rango de fechas usando operador "Entre"
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando selecciono el filtro "Fecha Apertura"
    Y selecciono el operador "Entre"
    Y ingreso la fecha inicio "01/06/2026"
    Y ingreso la fecha fin "05/06/2026"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con fecha de apertura entre "01/06/2026" y "05/06/2026"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-12 - Filtrar por fechas anteriores usando operador "Antes de"
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando selecciono el filtro "Fecha Apertura"
    Y selecciono el operador "Antes de"
    Y ingreso la fecha "01/06/2026"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con fecha de apertura anterior a "01/06/2026"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-13 - Filtrar por fechas posteriores usando operador "Después de"
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando selecciono el filtro "Fecha Apertura"
    Y selecciono el operador "Después de"
    Y ingreso la fecha "01/06/2026"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con fecha de apertura posterior a "01/06/2026"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-14 - Seleccionar fecha mediante calendario visual
    Dado que he abierto el filtro "Fecha Apertura"
    Y he seleccionado el operador "Igual a"
    Cuando abro el calendario visual
    Y selecciono la fecha "03/06/2026" desde el calendario
    Entonces el campo de fecha debe mostrar "03/06/2026"
    Y debe permitir aplicar el filtro

  # ========================================================================
  # FILTRO POR PRIORIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-15 - Filtrar por Prioridad 1 (única selección)
    Dado que existen encuentros con diferentes prioridades
    Cuando selecciono el filtro "Prioridad"
    Y selecciono "Prioridad 1 - Mes de castigo"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con Prioridad 1
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-16 - Intentar seleccionar múltiples prioridades (no permitido)
    Dado que he abierto el filtro "Prioridad"
    Y he seleccionado "Prioridad 1 - Mes de castigo"
    Cuando intento seleccionar "Prioridad 2 - Mes en curso y dos meses previos"
    Entonces el sistema debe mantener una única selección
    Y debe deseleccionar la prioridad previamente seleccionada
    Y debe seleccionar la nueva prioridad

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-17 - Buscar prioridad dentro del filtro (búsqueda desde segundo carácter)
    Dado que he abierto el filtro "Prioridad"
    Cuando ingreso "ca" en el campo de búsqueda del filtro
    Entonces el sistema debe iniciar la búsqueda
    Y debe mostrar "Prioridad 1 - Mes de castigo"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-18 - Buscar prioridad sin coincidencias
    Dado que he abierto el filtro "Prioridad"
    Cuando ingreso "xyz" en el campo de búsqueda del filtro
    Entonces el sistema debe mostrar el mensaje "Sin coincidencias"

  # ========================================================================
  # FILTRO POR USUARIO
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-19 - Filtrar por usuario usando operador "Contiene"
    Dado que existen encuentros creados por diferentes usuarios
    Cuando selecciono el filtro "Usuario"
    Y el operador debe estar fijo en "Contiene"
    Y ingreso "Lucía" en el campo de filtro
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros de usuarios que contengan "Lucía"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA
  Escenario: FIL-20 - Limpiar filtro de Usuario
    Dado que he aplicado el filtro "Usuario" con valor "Lucía"
    Cuando presiono el botón "Limpiar" del filtro "Usuario"
    Entonces el filtro "Usuario" debe eliminarse
    Y la grilla debe mostrar todos los encuentros disponibles para mi rol

  # ========================================================================
  # FILTRO POR GARANTE
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-21 - Filtrar por garante usando operador "Contiene"
    Dado que existen encuentros con diferentes garantes
    Cuando selecciono el filtro "Garante"
    Y el operador debe estar fijo en "Contiene"
    Y ingreso "MAPFRE" en el campo de filtro
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con garante que contenga "MAPFRE"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-22 - Filtrar garante con búsqueda parcial
    Dado que existen encuentros con garante "Oncosalud" y "La Positiva"
    Cuando selecciono el filtro "Garante"
    Y ingreso "Onco" en el campo de filtro
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con garante "Oncosalud"

  # ========================================================================
  # FILTRO POR TIPO DE ENCUENTRO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-23 - Filtrar por Tipo de Encuentro Ambulatorio
    Dado que existen encuentros ambulatorios y de emergencia
    Cuando selecciono el filtro "Tipo de Encuentro"
    Y selecciono "Ambulatorio"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros ambulatorios
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-24 - Filtrar por Tipo de Encuentro Emergencia
    Dado que existen encuentros ambulatorios y de emergencia
    Cuando selecciono el filtro "Tipo de Encuentro"
    Y selecciono "Emergencia"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros de emergencia

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-25 - Seleccionar todos los tipos de encuentro
    Dado que he abierto el filtro "Tipo de Encuentro"
    Cuando selecciono el checkbox "Seleccionar Todos"
    Entonces deben seleccionarse automáticamente:
      | Tipo        |
      | Ambulatorio |
      | Emergencia  |
    Y al aplicar el filtro debe mostrar ambos tipos

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-26 - Buscar tipo de encuentro sin coincidencias
    Dado que he abierto el filtro "Tipo de Encuentro"
    Cuando ingreso "XYZ" en el campo de búsqueda del filtro
    Entonces el sistema debe mostrar el mensaje "Sin coincidencias"

  # ========================================================================
  # FILTRO POR SUSTENTO ADMINISTRATIVO
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-27 - Filtrar por un sustento administrativo específico
    Dado que existen encuentros con diferentes sustentos administrativos
    Cuando selecciono el filtro "Sustento Administrativo"
    Y selecciono "Carta de Garantía"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con sustento "Carta de Garantía"
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA
  Escenario: FIL-28 - Filtrar por múltiples sustentos administrativos
    Dado que existen encuentros con diferentes sustentos administrativos
    Cuando selecciono el filtro "Sustento Administrativo"
    Y selecciono los sustentos:
      | Sustento          |
      | Carta de Garantía |
      | Hoja SITEDS       |
      | Denuncia Policial |
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros que tengan cualquiera de los tres sustentos seleccionados
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA
  Escenario: FIL-29 - Seleccionar todos los sustentos administrativos
    Dado que he abierto el filtro "Sustento Administrativo"
    Cuando selecciono el checkbox "Seleccionar Todos"
    Entonces deben seleccionarse todos los sustentos administrativos disponibles
    Y al aplicar debe mostrar encuentros con cualquier sustento administrativo

  @superusuarioAdmision @gestorTA
  Escenario: FIL-30 - Buscar sustento administrativo dentro del filtro
    Dado que he abierto el filtro "Sustento Administrativo"
    Cuando ingreso "Carta" en el campo de búsqueda del filtro
    Entonces el sistema debe mostrar "Carta de Garantía"
    Y debe permitir seleccionarlo

  # ========================================================================
  # FILTRO POR SUSTENTO MÉDICO
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-31 - Filtrar por Sustento Médico "Laboratorio"
    Dado que existen encuentros con y sin sustentos médicos pendientes
    Cuando selecciono el filtro "Sustento Médico"
    Y selecciono "Laboratorio"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con pendientes de laboratorio
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA
  Escenario: FIL-32 - Filtrar por Sustento Médico "-" (sin pendientes)
    Dado que existen encuentros con y sin sustentos médicos pendientes
    Cuando selecciono el filtro "Sustento Médico"
    Y selecciono "-"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros sin pendientes médicos
    Y el contador debe actualizarse automáticamente

  @superusuarioAdmision @gestorTA
  Escenario: FIL-33 - Seleccionar ambos valores de Sustento Médico
    Dado que existen encuentros con y sin sustentos médicos pendientes
    Cuando selecciono el filtro "Sustento Médico"
    Y selecciono "Laboratorio" y "-"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar todos los encuentros
    Y el contador debe reflejar el total

  # ========================================================================
  # FILTROS COMBINADOS
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: FIL-34 - Combinar múltiples filtros simultáneamente
    Dado que existen 1000 encuentros clasificados para Admisión
    Cuando aplico el filtro "Sede" con valor "Auna Guardia Civil"
    Y aplico el filtro "Estado" con valor "Pendiente"
    Y aplico el filtro "Prioridad" con valor "Prioridad 1"
    Entonces la grilla debe mostrar únicamente encuentros que cumplan los tres criterios:
      | Criterio  | Valor              |
      | Sede      | Auna Guardia Civil |
      | Estado    | Pendiente          |
      | Prioridad | Prioridad 1        |
    Y el contador debe mostrar solo los encuentros que cumplen todos los filtros

  @ejecutivoAdmision
  Escenario: FIL-35 - Ejecutivo combina filtros permitidos para su rol
    Dado que existen encuentros disponibles para mi rol
    Cuando aplico el filtro "Estado" con valor "Tramitado"
    Y aplico el filtro "Tipo de Encuentro" con valor "Ambulatorio"
    Y aplico el filtro "Prioridad" con valor "Prioridad 2"
    Entonces la grilla debe mostrar únicamente encuentros que cumplan los tres criterios
    Y el contador debe reflejar la cantidad de encuentros filtrados

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-36 - Los filtros permanecen activos hasta ser eliminados
    Dado que he aplicado el filtro "Estado" con valor "Pendiente"
    Y la grilla muestra 50 encuentros filtrados
    Cuando realizo scroll infinito para cargar más registros
    Entonces el filtro "Estado" debe permanecer activo
    Y los nuevos registros cargados deben cumplir el filtro aplicado
    Y solo deben mostrarse encuentros con estado "Pendiente"

  # ========================================================================
  # LIMPIEZA Y RESTABLECIMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-37 - Limpiar filtro individual sin afectar otros
    Dado que he aplicado los siguientes filtros:
      | Filtro         | Valor       |
      | Estado         | Pendiente   |
      | Prioridad      | Prioridad 1 |
      | Tipo Encuentro | Ambulatorio |
    Cuando presiono el botón "Limpiar" del filtro "Prioridad"
    Entonces el filtro "Prioridad" debe eliminarse
    Y los filtros "Estado" y "Tipo Encuentro" deben permanecer activos
    Y la grilla debe actualizarse mostrando encuentros que cumplan los dos filtros restantes

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-38 - Restablecer vista elimina todos los filtros
    Dado que he aplicado los siguientes filtros:
      | Filtro         | Valor       |
      | Estado         | Pendiente   |
      | Prioridad      | Prioridad 1 |
      | Tipo Encuentro | Ambulatorio |
      | Garante        | MAPFRE      |
    Cuando presiono el botón "Restablecer Vista"
    Entonces todos los filtros deben eliminarse
    Y la grilla debe mostrar todos los encuentros disponibles para mi rol
    Y el contador debe mostrar el total de encuentros sin filtros

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-39 - Restablecer vista también elimina búsquedas y ordenamientos
    Dado que he aplicado un filtro "Estado" con valor "Pendiente"
    Y he realizado una búsqueda por nombre "Juan"
    Y he ordenado por "Fecha de Apertura"
    Cuando presiono el botón "Restablecer Vista"
    Entonces el filtro "Estado" debe eliminarse
    Y la búsqueda debe eliminarse
    Y el ordenamiento debe restablecerse al orden por defecto (más recientes primero)
    Y la grilla debe volver a su estado inicial

  # ========================================================================
  # MENSAJES Y VALIDACIONES
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-40 - Mensaje cuando filtro no retorna resultados
    Dado que existen encuentros en la lista
    Cuando aplico un filtro que no tiene coincidencias
    Entonces debe mostrarse el mensaje "No encontramos resultados para atender"
    Y debe mostrarse la descripción "Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro"
    Y la grilla debe estar vacía
    Y el contador debe mostrar "0 registros encontrados"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-41 - Contador se actualiza automáticamente al aplicar filtro
    Dado que existen 500 encuentros en la lista
    Y el contador muestra "500 registros encontrados"
    Cuando aplico el filtro "Estado" con valor "Pendiente"
    Y el filtro retorna 75 registros
    Entonces el contador debe actualizarse automáticamente
    Y debe mostrar "75 registros encontrados"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-42 - Contador se actualiza al limpiar un filtro
    Dado que he aplicado el filtro "Estado" con valor "Pendiente"
    Y el contador muestra "75 registros encontrados"
    Cuando presiono el botón "Limpiar" del filtro "Estado"
    Entonces el contador debe actualizarse automáticamente
    Y debe mostrar la cantidad total de encuentros disponibles para mi rol

  # ========================================================================
  # REGLAS DE NEGOCIO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-43 - Validar RN-FIL-01: Los filtros pueden combinarse
    Dado que existen encuentros en la lista
    Cuando aplico el filtro "Estado" con valor "Pendiente"
    Y aplico el filtro "Prioridad" con valor "Prioridad 1"
    Y aplico el filtro "Tipo de Encuentro" con valor "Ambulatorio"
    Entonces los tres filtros deben aplicarse simultáneamente
    Y la grilla debe mostrar solo encuentros que cumplan todos los criterios
    Y el sistema debe permitir agregar más filtros adicionales

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-44 - Validar RN-FIL-02: Contador refleja resultados filtrados
    Dado que he aplicado filtros que retornan 42 registros
    Cuando visualizo el contador de resultados
    Entonces el contador debe mostrar exactamente "42 registros encontrados"
    Y la cantidad mostrada debe coincidir con los registros visibles en la grilla

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-45 - Validar RN-FIL-03: Aplicar ejecuta el filtro seleccionado
    Dado que he configurado el filtro "Estado" con valor "Pendiente"
    Y NO he presionado el botón "Aplicar"
    Entonces la grilla NO debe aplicar el filtro aún
    Cuando presiono el botón "Aplicar"
    Entonces el filtro debe ejecutarse
    Y la grilla debe actualizarse mostrando solo encuentros con estado "Pendiente"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-46 - Validar RN-FIL-04: Limpiar elimina solo el filtro correspondiente
    Dado que he aplicado el filtro "Estado" con valor "Pendiente"
    Y he aplicado el filtro "Prioridad" con valor "Prioridad 1"
    Cuando presiono el botón "Limpiar" del filtro "Estado"
    Entonces solo el filtro "Estado" debe eliminarse
    Y el filtro "Prioridad" debe permanecer activo y aplicado

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-47 - Validar RN-FIL-05: Restablecer Vista elimina todos los filtros
    Dado que he aplicado múltiples filtros
    Cuando presiono el botón "Restablecer Vista"
    Entonces todos los filtros activos deben eliminarse
    Y todas las búsquedas deben eliminarse
    Y todos los ordenamientos deben restablecerse

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-48 - Validar RN-FIL-06: Prioridad permite una única selección
    Dado que he abierto el filtro "Prioridad"
    Y he seleccionado "Prioridad 1"
    Cuando intento seleccionar "Prioridad 2"
    Entonces el sistema debe mantener solo una prioridad seleccionada
    Y "Prioridad 1" debe deseleccionarse automáticamente
    Y "Prioridad 2" debe quedar seleccionada

  @superusuarioAdmision @gestorTA
  Escenario: FIL-49 - Validar RN-FIL-07: Sede permite múltiples selecciones
    Dado que he abierto el filtro "Sede"
    Cuando selecciono las sedes:
      | Sede                |
      | Auna Guardia Civil  |
      | Las Flores          |
      | Centro de Bienestar |
    Entonces las tres sedes deben permanecer seleccionadas simultáneamente
    Y al aplicar el filtro debe mostrar encuentros de las tres sedes

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-50 - Validar RN-FIL-08: Estado permite múltiples selecciones
    Dado que he abierto el filtro "Estado"
    Cuando selecciono los estados:
      | Estado     |
      | Pendiente  |
      | Tramitado  |
      | En Proceso |
    Entonces los tres estados deben permanecer seleccionados simultáneamente
    Y al aplicar el filtro debe mostrar encuentros de los tres estados

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: FIL-51 - Validar RN-FIL-09: Tipo de Encuentro permite múltiples selecciones
    Dado que he abierto el filtro "Tipo de Encuentro"
    Cuando selecciono "Ambulatorio" y "Emergencia"
    Entonces ambos tipos deben permanecer seleccionados simultáneamente
    Y al aplicar el filtro debe mostrar encuentros de ambos tipos

  @superusuarioAdmision @gestorTA
  Escenario: FIL-52 - Validar RN-FIL-10: Sustentos Administrativos permite múltiples selecciones
    Dado que he abierto el filtro "Sustento Administrativo"
    Cuando selecciono los sustentos:
      | Sustento            |
      | Carta de Garantía   |
      | Hoja SITEDS         |
      | Denuncia Policial   |
      | SOAT Tarjeta Física |
    Entonces los cuatro sustentos deben permanecer seleccionados simultáneamente
    Y al aplicar el filtro debe mostrar encuentros con cualquiera de los cuatro sustentos

  @superusuarioAdmision @gestorTA
  Escenario: FIL-53 - Validar RN-FIL-11: Sustentos Médicos permite múltiples selecciones
    Dado que he abierto el filtro "Sustento Médico"
    Cuando selecciono "Laboratorio" y "-"
    Entonces ambos valores deben permanecer seleccionados simultáneamente
    Y al aplicar el filtro debe mostrar todos los encuentros (con y sin pendientes médicos)

  # ========================================================================
  # RESPETO A RESTRICCIONES DE ROL
  # ========================================================================

  @ejecutivoAdmision
  Escenario: FIL-54 - Filtros respetan restricciones de visibilidad del Ejecutivo
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01"
    Y estoy asignado a la sede "Auna Guardia Civil"
    Cuando aplico cualquier filtro permitido para mi rol
    Entonces el resultado siempre debe mostrar únicamente:
      | Restricción                                |
      | Encuentros creados por mí                  |
      | Encuentros de mi sede (Auna Guardia Civil) |
      | Encuentros clasificados para Admisión      |
    Y NO debo visualizar encuentros de otros usuarios
    Y NO debo visualizar encuentros de otras sedes

  @superusuarioAdmision @gestorTA
  Escenario: FIL-55 - Filtros no restringen visibilidad de Superusuario y Gestor
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando aplico cualquier filtro disponible
    Entonces el resultado debe incluir encuentros de todas las sedes
    Y debe incluir encuentros de todos los usuarios
    Y debe incluir todos los encuentros clasificados para Admisión que cumplan el filtro
