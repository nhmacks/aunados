# language: es

Característica: Selector de Fechas (Date Picker) en Asignaciones Masivas
  Como Responsable de Facturación
  Quiero interactuar con el selector de fechas
  Para seleccionar rangos de fechas de manera intuitiva

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Asignaciones masivas"

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DEL DATE PICKER
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-01 - Visualizar calendario doble al abrir selector de fecha inicio
    Dado que el campo "Fecha de inicio" está vacío
    Cuando hago clic en el campo "Fecha de inicio"
    Entonces debe abrirse un calendario desplegable
    Y debe mostrarse 2 meses simultáneamente (mes actual y mes siguiente)
    Y debe mostrarse el nombre del mes y año en cada calendario
    Y deben mostrarse los días de la semana en formato abreviado (D, L, M, M, J, V, S)
    Y debe mostrarse navegación con flechas < > para cambiar de mes
    Y debe mostrarse el botón "Limpiar" debajo del calendario

  @responsableFacturacion @happyPath
  Escenario: DP-02 - Visualizar calendario doble al abrir selector de fecha fin
    Dado que el campo "Fecha fin" está vacío
    Cuando hago clic en el campo "Fecha fin"
    Entonces debe abrirse un calendario desplegable
    Y debe mostrarse 2 meses simultáneamente (mes actual y mes siguiente)
    Y debe mostrarse navegación con flechas < > para cambiar de mes
    Y debe mostrarse el botón "Limpiar" debajo del calendario

  # ========================================================================
  # TÉCNICA: NAVEGACIÓN ENTRE MESES
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-03 - Navegar hacia adelante entre meses
    Dado que he abierto el selector de fecha
    Y se muestran "Junio 2026" y "Julio 2026"
    Cuando hago clic en la flecha derecha (>)
    Entonces debe mostrarse "Julio 2026" y "Agosto 2026"
    Y el calendario debe desplazarse un mes adelante
    Y la navegación debe ser fluida

  @responsableFacturacion @happyPath
  Escenario: DP-04 - Navegar hacia atrás entre meses
    Dado que he abierto el selector de fecha
    Y se muestran "Junio 2026" y "Julio 2026"
    Cuando hago clic en la flecha izquierda (<)
    Entonces debe mostrarse "Mayo 2026" y "Junio 2026"
    Y el calendario debe desplazarse un mes atrás
    Y la navegación debe ser fluida

  @responsableFacturacion @happyPath
  Escenario: DP-05 - Navegar múltiples meses consecutivamente
    Dado que he abierto el selector de fecha
    Y se muestran "Junio 2026" y "Julio 2026"
    Cuando hago clic 3 veces en la flecha derecha (>)
    Entonces debe mostrarse "Septiembre 2026" y "Octubre 2026"
    Y el calendario debe reflejar el desplazamiento correcto

  # ========================================================================
  # TÉCNICA: SELECCIÓN DE FECHA
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-06 - Seleccionar una fecha del calendario
    Dado que he abierto el selector de "Fecha de inicio"
    Y se muestra el calendario de Junio 2026
    Cuando hago clic en el día 27 (sábado)
    Entonces la fecha debe seleccionarse
    Y el calendario debe cerrarse automáticamente
    Y el campo "Fecha de inicio" debe mostrar "sáb, 27 jun. 2026."
    Y el formato debe ser "día_semana_abrev, DD mes_abrev. AAAA."

  @responsableFacturacion @happyPath
  Esquema del escenario: DP-07 - Validar formato de fecha para diferentes días
    Dado que he abierto el selector de fecha
    Cuando selecciono el <dia> de <mes> de <año> que es <dia_semana>
    Entonces el campo debe mostrar "<formato_esperado>"
    Y el formato debe incluir el día de la semana abreviado

    Ejemplos:
      | dia | mes   | año  | dia_semana | formato_esperado       |
      | 1   | marzo | 2026 | domingo    | dom, 01 mar. 2026.     |
      | 27  | junio | 2026 | sábado     | sáb, 27 jun. 2026.     |
      | 15  | julio | 2026 | miércoles  | mié, 15 jul. 2026.     |
      | 31  | julio | 2026 | viernes    | vie, 31 jul. 2026.     |

  @responsableFacturacion @happyPath
  Escenario: DP-08 - Seleccionar fecha de mes siguiente en calendario doble
    Dado que he abierto el selector de "Fecha fin"
    Y se muestran "Junio 2026" y "Julio 2026"
    Cuando hago clic en el día 26 de Julio 2026 (domingo)
    Entonces el campo "Fecha fin" debe mostrar "dom, 26 jul. 2026."
    Y el calendario debe cerrarse
    Y la fecha debe seleccionarse correctamente del segundo mes

  # ========================================================================
  # TÉCNICA: BOTÓN LIMPIAR DENTRO DEL DATE PICKER
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-09 - Limpiar fecha seleccionada usando botón del calendario
    Dado que he abierto el selector de "Fecha de inicio"
    Y he seleccionado previamente "sáb, 27 jun. 2026."
    Y he vuelto a abrir el selector
    Cuando hago clic en el botón "Limpiar" dentro del calendario
    Entonces el campo "Fecha de inicio" debe vaciarse
    Y debe mostrarse nuevamente el placeholder "Selecciona"
    Y el calendario debe permanecer abierto

  @responsableFacturacion @happyPath
  Escenario: DP-10 - Limpiar y seleccionar nueva fecha
    Dado que he abierto el selector de "Fecha de inicio"
    Y el campo muestra "sáb, 27 jun. 2026."
    Y he vuelto a abrir el selector
    Cuando hago clic en el botón "Limpiar" dentro del calendario
    Y selecciono el día 1 de Marzo 2026
    Entonces el campo debe mostrar "dom, 01 mar. 2026."
    Y la fecha anterior debe haberse eliminado correctamente

  # ========================================================================
  # TÉCNICA: PLACEHOLDER EN CAMPOS VACÍOS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-11 - Validar placeholder en campo fecha inicio vacío
    Cuando visualizo el campo "Fecha de inicio" sin seleccionar
    Entonces debe mostrarse el placeholder "Selecciona"
    Y el placeholder debe tener estilo de texto en gris claro
    Y debe desaparecer al abrir el selector

  @responsableFacturacion @happyPath
  Escenario: DP-12 - Validar placeholder en campo fecha fin vacío
    Cuando visualizo el campo "Fecha fin" sin seleccionar
    Entonces debe mostrarse el placeholder "Selecciona"
    Y el placeholder debe tener estilo de texto en gris claro
    Y debe desaparecer al abrir el selector

  # ========================================================================
  # TÉCNICA: INTERACCIÓN CON TECLADO
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-13 - Cerrar calendario presionando ESC
    Dado que he abierto el selector de fecha
    Y el calendario está visible
    Cuando presiono la tecla ESC
    Entonces el calendario debe cerrarse
    Y NO debe seleccionarse ninguna fecha
    Y el campo debe mantener su valor anterior

  @responsableFacturacion @happyPath
  Escenario: DP-14 - Cerrar calendario haciendo clic fuera
    Dado que he abierto el selector de fecha
    Y el calendario está visible
    Cuando hago clic fuera del calendario
    Entonces el calendario debe cerrarse
    Y NO debe seleccionarse ninguna fecha
    Y el campo debe mantener su valor anterior

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE RESTRICCIONES DE FECHAS
  # ========================================================================

  @responsableFacturacion @unhappyPath
  Escenario: DP-15 - Deshabilitar fechas fuera del rango permitido (más de 6 meses atrás)
    Dado que he abierto el selector de "Fecha de inicio"
    Y hoy es 17 de Junio de 2026
    Cuando navego a Noviembre 2025 (7 meses atrás)
    Entonces los días de Noviembre 2025 deben estar deshabilitados visualmente
    Y NO debo poder seleccionar ningún día de Noviembre 2025
    Y debe mostrarse un indicador visual de que están fuera de rango

  @responsableFacturacion @happyPath
  Escenario: DP-16 - Habilitar fechas dentro del rango permitido (últimos 6 meses)
    Dado que he abierto el selector de "Fecha de inicio"
    Y hoy es 17 de Junio de 2026
    Cuando navego a Enero 2026 (5 meses atrás)
    Entonces los días de Enero 2026 deben estar habilitados
    Y debo poder seleccionar cualquier día de Enero 2026
    Y los días deben tener estilo normal (no deshabilitado)

  # ========================================================================
  # TÉCNICA: RESALTADO VISUAL DE FECHA ACTUAL
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-17 - Resaltar la fecha actual en el calendario
    Dado que he abierto el selector de fecha
    Y hoy es 17 de Junio de 2026
    Y el calendario muestra Junio 2026
    Cuando visualizo el calendario
    Entonces el día 17 debe tener un resaltado visual especial
    Y debe diferenciarse claramente de los demás días
    Y debe indicarse que es "Hoy"

  # ========================================================================
  # TÉCNICA: RANGO DE FECHAS COMPLETO
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-18 - Seleccionar rango completo de fechas (inicio y fin)
    Dado que he seleccionado "Fecha de inicio" como "dom, 01 mar. 2026."
    Cuando abro el selector de "Fecha fin"
    Y selecciono "dom, 26 jul. 2026."
    Entonces ambos campos deben mostrar las fechas correctamente
    Y el campo "Fecha de inicio" debe mostrar "dom, 01 mar. 2026."
    Y el campo "Fecha fin" debe mostrar "dom, 26 jul. 2026."
    Y el botón "Buscar" debe habilitarse si hay garante seleccionado

  @responsableFacturacion @unhappyPath
  Escenario: DP-19 - Validar que fecha fin no puede ser anterior a fecha inicio
    Dado que he seleccionado "Fecha de inicio" como "sáb, 27 jun. 2026."
    Cuando abro el selector de "Fecha fin"
    Entonces los días anteriores al 27 de Junio 2026 deben estar deshabilitados
    Y solo debo poder seleccionar fechas iguales o posteriores al 27 de Junio
    Y debe haber un indicador visual de fechas no permitidas

  # ========================================================================
  # TÉCNICA: IDIOMA Y LOCALIZACIÓN
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: DP-20 - Validar que los nombres de meses están en español
    Dado que he abierto el selector de fecha
    Cuando navego por los diferentes meses
    Entonces los nombres deben mostrarse en español:
      | Mes en español |
      | Enero          |
      | Febrero        |
      | Marzo          |
      | Abril          |
      | Mayo           |
      | Junio          |
      | Julio          |
      | Agosto         |
      | Septiembre     |
      | Octubre        |
      | Noviembre      |
      | Diciembre      |

  @responsableFacturacion @happyPath
  Escenario: DP-21 - Validar que los días de la semana están en español abreviado
    Dado que he abierto el selector de fecha
    Cuando visualizo el calendario
    Entonces los encabezados de días deben mostrarse como: "D, L, M, M, J, V, S"
    Y deben corresponder a Domingo, Lunes, Martes, Miércoles, Jueves, Viernes, Sábado
