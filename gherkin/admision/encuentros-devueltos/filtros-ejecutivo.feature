# language: es

Característica: Filtros Avanzados con Modales - Ejecutivo de Admisión
  Como Ejecutivo de Admisión
  Quiero filtrar encuentros devueltos usando modales interactivos
  Para encontrar rápidamente los encuentros específicos que necesito gestionar

  # ========================================================================
  # TÉCNICA: FILTRO POR ESTADO CON MODAL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-01 - Abrir modal de filtro de Estado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando hago clic en el icono de filtro de la columna "Estado"
    Entonces debe abrirse un modal de filtro
    Y el modal debe mostrar una lista de checks con los estados disponibles
    Y el modal debe mostrar una caja de búsqueda en la parte superior
    Y el modal debe mostrar un check "Seleccionar todo"
    Y el modal debe mostrar los botones "Limpiar" y "Aplicar"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-EST-02 - Filtrar por un solo estado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes estados
    Y he abierto el modal de filtro de "Estado"
    Cuando selecciono el check del estado "<estado>"
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros con estado "<estado>"
    Y el contador de resultados debe actualizarse

    Ejemplos:
      | estado                       |
      | Derivado a Dirección Médica  |
      | Derivado a Supervisor        |
      | Error de facturación         |
      | Pago por adelantado          |
      | Pendiente                    |

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-03 - Filtrar por múltiples estados
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes estados
    Y he abierto el modal de filtro de "Estado"
    Cuando selecciono el check "Derivado a Dirección Médica"
    Y selecciono el check "Error de facturación"
    Y selecciono el check "Pendiente"
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros con estados "Derivado a Dirección Médica", "Error de facturación" o "Pendiente"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-04 - Seleccionar todos los estados
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Estado"
    Cuando selecciono el check "Seleccionar todo"
    Entonces todos los checks de estados deben marcarse automáticamente
    Cuando presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros con todos los estados disponibles

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-05 - Buscar estado dentro del modal
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Estado"
    Cuando ingreso "error de vinculación" en la caja de búsqueda del modal
    Entonces debe mostrarse únicamente el check con "Error de vinculación"
    Y los demás checks deben ocultarse
    Cuando limpio la búsqueda
    Entonces deben mostrarse todos los checks de estados nuevamente

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-06 - Limpiar filtros de estado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Estado"
    Y he seleccionado varios checks de estados
    Cuando presiono el botón "Limpiar"
    Entonces todos los checks deben desmarcarse
    Y la caja de búsqueda debe limpiarse

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-EST-07 - Cerrar modal sin aplicar cambios
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Estado"
    Y he seleccionado varios checks
    Cuando hago clic fuera del modal
    Entonces el modal debe cerrarse
    Y los filtros NO deben aplicarse
    Y la grilla debe mantener los resultados anteriores

  # ========================================================================
  # TÉCNICA: FILTRO POR FECHA DE APERTURA CON MODAL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-FEC-01 - Abrir modal de filtro de Fecha de apertura
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando hago clic en el icono de filtro de la columna "Fecha apert."
    Entonces debe abrirse un modal de filtro
    Y el modal debe mostrar un select con opciones "Igual a", "Entre", "Antes", "Después"
    Y el modal debe mostrar una caja de texto para ingresar fecha
    Y el modal debe mostrar un icono de calendario
    Y el modal debe mostrar los botones "Limpiar" y "Aplicar"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-FEC-02 - Filtrar por fecha igual a
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes fechas de apertura
    Y he abierto el modal de filtro de "Fecha apert."
    Cuando selecciono la opción "Igual a"
    Y ingreso la fecha "15/06/2024" en formato DD/MM/AAAA
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros con fecha de apertura "15/06/2024"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-FEC-03 - Filtrar por fecha usando calendario
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Fecha apert."
    Y he seleccionado la opción "Igual a"
    Cuando hago clic en el icono del calendario
    Entonces debe abrirse un calendario
    Cuando selecciono la fecha "15/06/2024" del calendario
    Entonces la fecha debe aparecer en la caja de texto en formato DD/MM/AAAA
    Cuando presiono el botón "Aplicar"
    Entonces la grilla debe filtrar por la fecha seleccionada

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-FEC-04 - Filtrar por rango de fechas (Entre)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes fechas de apertura
    Y he abierto el modal de filtro de "Fecha apert."
    Cuando selecciono la opción "Entre"
    Entonces deben habilitarse dos cajas de texto para ingresar fechas
    Cuando ingreso "01/06/2024" en la primera caja de texto
    Y ingreso "30/06/2024" en la segunda caja de texto
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar únicamente encuentros con fecha de apertura entre "01/06/2024" y "30/06/2024"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-FEC-05 - Filtrar por fecha con operadores
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes fechas de apertura
    Y he abierto el modal de filtro de "Fecha apert."
    Cuando selecciono la opción "<operador>"
    Y ingreso la fecha "<fecha>"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros según el criterio "<resultado_esperado>"

    Ejemplos:
      | operador | fecha      | resultado_esperado                    |
      | Antes    | 15/06/2024 | Fecha de apertura antes de 15/06/2024 |
      | Después  | 15/06/2024 | Fecha de apertura después de 15/06/2024|

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-FEC-06 - Limpiar filtro de fecha
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Fecha apert."
    Y he ingresado una fecha
    Cuando presiono el botón "Limpiar"
    Entonces el select debe volver al valor por defecto
    Y las cajas de texto deben limpiarse

  # ========================================================================
  # TÉCNICA: FILTRO POR GARANTE CON MODAL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-GAR-01 - Abrir modal de filtro de Garante
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando hago clic en el icono de filtro de la columna "Garante"
    Entonces debe abrirse un modal de filtro
    Y el modal debe mostrar una caja de texto con valor "Contiene" deshabilitada
    Y el modal debe mostrar una caja de texto "Filtro" habilitada
    Y el modal debe mostrar los botones "Limpiar" y "Aplicar"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-GAR-02 - Filtrar por garante contiene texto
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes garantes
    Y he abierto el modal de filtro de "Garante"
    Cuando ingreso "Banco Salud" en la caja de texto "Filtro"
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros cuyo garante contenga "Banco Salud"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-GAR-03 - Validar que el operador Contiene está deshabilitado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Garante"
    Cuando visualizo la primera caja de texto
    Entonces debe mostrar el valor "Contiene"
    Y debe estar deshabilitada para edición
    Y NO debe poder cambiar el valor

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-GAR-04 - Limpiar filtro de garante
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Garante"
    Y he ingresado un valor en la caja de texto "Filtro"
    Cuando presiono el botón "Limpiar"
    Entonces la caja de texto "Filtro" debe limpiarse

  # ========================================================================
  # TÉCNICA: FILTRO POR TIPO DE ENCUENTRO CON MODAL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-TIP-01 - Abrir modal de filtro de Tipo de encuentro
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando hago clic en el icono de filtro de la columna "Tipo de encuentro"
    Entonces debe abrirse un modal de filtro
    Y el modal debe mostrar una lista de checks con "Ambulatorio" y "Emergencia"
    Y el modal debe mostrar un check "Seleccionar todo"
    Y el modal debe mostrar una caja de búsqueda
    Y el modal debe mostrar los botones "Limpiar" y "Aplicar"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-TIP-02 - Filtrar por tipo de encuentro
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos de diferentes tipos
    Y he abierto el modal de filtro de "Tipo de encuentro"
    Cuando selecciono el check "<tipo>"
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros de tipo "<tipo>"

    Ejemplos:
      | tipo        |
      | Ambulatorio |
      | Emergencia  |

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-TIP-03 - Filtrar por múltiples tipos de encuentro
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos de diferentes tipos
    Y he abierto el modal de filtro de "Tipo de encuentro"
    Cuando selecciono el check "Ambulatorio"
    Y selecciono el check "Emergencia"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros de tipo "Ambulatorio" o "Emergencia"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-TIP-04 - Seleccionar todos los tipos de encuentro
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Tipo de encuentro"
    Cuando selecciono el check "Seleccionar todo"
    Entonces los checks "Ambulatorio" y "Emergencia" deben marcarse automáticamente

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-TIP-05 - Buscar tipo de encuentro dentro del modal
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Tipo de encuentro"
    Cuando ingreso "Ambulatorio" en la caja de búsqueda del modal
    Entonces debe mostrarse únicamente el check con "Ambulatorio"
    Y el check "Emergencia" debe ocultarse

  # ========================================================================
  # TÉCNICA: FILTRO POR PRIORIDAD CON MODAL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-PRI-01 - Abrir modal de filtro de Prioridad
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando hago clic en el icono de filtro de la columna "Prioridad"
    Entonces debe abrirse un modal de filtro
    Y el modal debe mostrar una lista de checks con las prioridades disponibles
    Y el modal debe mostrar una caja de búsqueda
    Y el modal debe mostrar los botones "Aplicar" y "Cancelar"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-PRI-02 - Filtrar por prioridad
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes prioridades
    Y he abierto el modal de filtro de "Prioridad"
    Cuando selecciono el check "<prioridad>"
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y la grilla debe mostrar únicamente encuentros con prioridad "<prioridad>"

    Ejemplos:
      | prioridad |
      | Alta      |
      | Media     |
      | Baja      |

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-PRI-03 - Filtrar por múltiples prioridades
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos con diferentes prioridades
    Y he abierto el modal de filtro de "Prioridad"
    Cuando selecciono el check "Alta"
    Y selecciono el check "Media"
    Y presiono el botón "Aplicar"
    Entonces la grilla debe mostrar encuentros con prioridad "Alta" o "Media"

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-PRI-04 - Cancelar filtro de prioridad
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Prioridad"
    Y he seleccionado varios checks
    Cuando presiono el botón "Cancelar"
    Entonces el modal debe cerrarse
    Y los filtros NO deben aplicarse
    Y la grilla debe mantener los resultados anteriores

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-PRI-05 - Buscar prioridad dentro del modal
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Prioridad"
    Cuando ingreso "Alta" en la caja de búsqueda del modal
    Entonces debe mostrarse únicamente el check con "Alta"
    Y los demás checks deben ocultarse

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE MÚLTIPLES FILTROS
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-COMB-01 - Aplicar múltiples filtros simultáneamente
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando aplico el filtro "Estado" seleccionando "Pendiente"
    Y aplico el filtro "Prioridad" seleccionando "Alta"
    Y aplico el filtro "Tipo de encuentro" seleccionando "Emergencia"
    Entonces la grilla debe mostrar únicamente encuentros que cumplan TODOS los filtros aplicados
    Y el contador debe mostrar la cantidad de resultados filtrados

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-COMB-02 - Indicador visual de filtros activos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos en la grilla
    Cuando aplico un filtro en la columna "Estado"
    Entonces el icono de filtro de la columna "Estado" debe cambiar de color o mostrar un indicador
    Y debe indicar que hay un filtro activo en esa columna

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-COMB-03 - Limpiar todos los filtros con Restablecer vista
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he aplicado múltiples filtros en diferentes columnas
    Y la grilla muestra resultados filtrados
    Cuando selecciono "Restablecer vista"
    Entonces todos los filtros deben limpiarse
    Y los iconos de filtro deben volver a su estado normal
    Y la grilla debe mostrar todos mis encuentros devueltos

  # ========================================================================
  # TÉCNICA: VALIDACIONES Y CASOS EDGE
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: FIL-VAL-01 - Aplicar filtro sin seleccionar ninguna opción
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Estado"
    Cuando NO selecciono ningún check
    Y presiono el botón "Aplicar"
    Entonces el modal debe cerrarse
    Y NO debe aplicarse ningún filtro
    Y la grilla debe mostrar los mismos resultados que antes

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: FIL-VAL-02 - Filtro de fecha con formato inválido
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Fecha apert."
    Cuando ingreso una fecha con formato inválido "32/13/2024"
    Y presiono el botón "Aplicar"
    Entonces debe mostrarse un mensaje de error "Formato de fecha inválido"
    Y el botón "Aplicar" debe permanecer deshabilitado

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: FIL-VAL-03 - Filtro Entre con rango inválido
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he abierto el modal de filtro de "Fecha apert."
    Y he seleccionado la opción "Entre"
    Cuando ingreso "30/06/2024" en la primera caja de texto
    Y ingreso "01/06/2024" en la segunda caja de texto
    Y presiono el botón "Aplicar"
    Entonces debe mostrarse un mensaje "La fecha inicial debe ser menor que la fecha final"
    Y NO debe aplicarse el filtro
