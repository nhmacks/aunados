# language: es

Característica: Filtros en Cuadro de Control - Encuentros Asignados
  Como Responsable de Facturación o Gestor TA
  Quiero filtrar el cuadro de control por Garante, Sede y Ejecutivo
  Para analizar el desempeño de forma segmentada

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación" o "Gestor TA"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"

  # ========================================================================
  # TÉCNICA: FILTRO POR GARANTE CON CHECKBOXES MÚLTIPLES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-01 - Abrir dropdown de filtro Garante y visualizar opciones
    Cuando hago clic en el dropdown "Garante"
    Entonces debe desplegarse una lista con checkboxes
    Y debe mostrarse el botón "Seleccionar todo"
    Y debe mostrarse el botón "Limpiar"
    Y debe mostrarse la lista de garantes disponibles con checkboxes:
      | Garante              |
      | IAFAS PÚBLICAS       |
      | INTERNACIONAL        |
      | LA POSITIVA          |
      | LA PROTECTORA        |
    Y todos los checkboxes deben estar desmarcados inicialmente

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-02 - Seleccionar uno o más garantes y aplicar filtro
    Dado que he abierto el dropdown "Garante"
    Cuando selecciono el checkbox "IAFAS PÚBLICAS"
    Y selecciono el checkbox "INTERNACIONAL"
    Y cierro el dropdown
    Y presiono el botón "Filtrar"
    Entonces la grilla debe mostrar solo ejecutivos con encuentros de garantes "IAFAS PÚBLICAS" o "INTERNACIONAL"
    Y las tarjetas de métricas deben actualizarse con datos filtrados
    Y el gráfico circular debe actualizarse con datos filtrados
    Y el contador de registros debe actualizarse

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-03 - Seleccionar todos los garantes con botón "Seleccionar todo"
    Dado que he abierto el dropdown "Garante"
    Y existen 10 garantes en la lista
    Cuando presiono el botón "Seleccionar todo"
    Entonces todos los 10 checkboxes deben marcarse
    Y el dropdown debe permanecer abierto

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-04 - Limpiar selección de garantes con botón "Limpiar"
    Dado que he abierto el dropdown "Garante"
    Y he seleccionado 3 garantes
    Cuando presiono el botón "Limpiar" dentro del dropdown
    Entonces todos los checkboxes deben desmarcarse
    Y el dropdown debe permanecer abierto

  # ========================================================================
  # TÉCNICA: FILTRO POR SEDE CON CHECKBOXES MÚLTIPLES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-05 - Abrir dropdown de filtro Sede y visualizar opciones
    Cuando hago clic en el dropdown "Sede"
    Entonces debe desplegarse una lista con checkboxes
    Y debe mostrarse el botón "Seleccionar todo"
    Y debe mostrarse el botón "Limpiar"
    Y debe mostrarse la lista de sedes disponibles con checkboxes
    Y todos los checkboxes deben estar desmarcados inicialmente

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: FIL-06 - Filtrar por una o más sedes
    Dado que he abierto el dropdown "Sede"
    Cuando selecciono el checkbox "<sede1>"
    Y selecciono el checkbox "<sede2>"
    Y cierro el dropdown
    Y presiono el botón "Filtrar"
    Entonces la grilla debe mostrar solo ejecutivos con encuentros de sedes "<sede1>" o "<sede2>"
    Y las métricas deben reflejar solo datos de las sedes seleccionadas

    Ejemplos:
      | sede1              | sede2          |
      | Auna Guardia Civil | Las Flores     |
      | Bellavista         | Camino Real    |
      | Delgado            | Auna Cañete    |

  # ========================================================================
  # TÉCNICA: FILTRO POR EJECUTIVO CON CHECKBOXES MÚLTIPLES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-07 - Abrir dropdown de filtro Ejecutivo y visualizar opciones
    Cuando hago clic en el dropdown "Ejecutivo"
    Entonces debe desplegarse una lista con checkboxes
    Y debe mostrarse el botón "Seleccionar todo"
    Y debe mostrarse el botón "Limpiar"
    Y debe mostrarse la lista de ejecutivos de facturación con checkboxes
    Y todos los checkboxes deben estar desmarcados inicialmente

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-08 - Filtrar por ejecutivos específicos
    Dado que he abierto el dropdown "Ejecutivo"
    Cuando selecciono el checkbox "Luis Medrano"
    Y selecciono el checkbox "DANILO BELTRAN SALAZAR"
    Y cierro el dropdown
    Y presiono el botón "Filtrar"
    Entonces la grilla debe mostrar únicamente las filas de "Luis Medrano" y "DANILO BELTRAN SALAZAR"
    Y las tarjetas de métricas deben mostrar solo datos de estos 2 ejecutivos
    Y el gráfico debe mostrar solo datos de estos 2 ejecutivos
    Y el contador debe mostrar "2 registros encontrados"

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS MÚLTIPLES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-09 - Aplicar filtros combinados de Garante, Sede y Ejecutivo
    Dado que he seleccionado 2 garantes en el filtro "Garante"
    Y he seleccionado 1 sede en el filtro "Sede"
    Y he seleccionado 3 ejecutivos en el filtro "Ejecutivo"
    Cuando presiono el botón "Filtrar"
    Entonces la grilla debe mostrar solo ejecutivos que cumplan TODOS los filtros:
      - Pertenecen a los 3 ejecutivos seleccionados
      - Tienen encuentros de los 2 garantes seleccionados
      - Tienen encuentros de la 1 sede seleccionada
    Y todas las métricas deben reflejar la combinación de filtros

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-10 - Limpiar todos los filtros con botón "Limpiar"
    Dado que he aplicado filtros en "Garante", "Sede" y "Ejecutivo"
    Y la grilla muestra datos filtrados
    Cuando presiono el botón "Limpiar"
    Entonces todos los dropdowns deben volver a "Todos"
    Y todos los checkboxes deben desmarcarse
    Y la grilla debe mostrar todos los ejecutivos
    Y las tarjetas deben mostrar datos de todos los ejecutivos
    Y el gráfico debe mostrar datos de todos los ejecutivos

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BOTÓN FILTRAR
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-11 - Validar que el botón Filtrar aplica los filtros seleccionados
    Dado que he seleccionado filtros en los dropdowns
    Y NO he presionado el botón "Filtrar"
    Cuando visualizo la grilla
    Entonces debe mostrar todos los datos sin filtrar
    Y las métricas deben mostrar datos completos
    Cuando presiono el botón "Filtrar"
    Entonces los filtros deben aplicarse inmediatamente
    Y la grilla debe actualizarse con datos filtrados
    Y las métricas deben actualizarse

  @responsableFacturacion @gestorTA @unhappyPath
  Escenario: FIL-12 - Filtros sin resultados
    Dado que he seleccionado un garante que no tiene encuentros asignados
    Cuando presiono el botón "Filtrar"
    Entonces debe mostrarse "0 registros encontrados"
    Y la grilla debe estar vacía
    Y las tarjetas deben mostrar "S/ 0.00" y "Cant. 0"
    Y el gráfico debe mostrar "S/ 0.00" y "Cant. 0"
    Y debe mostrarse un mensaje "No hay resultados para los filtros aplicados"

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE FILTROS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-13 - Validar que los filtros persisten al hacer scroll en la grilla
    Dado que he aplicado filtros por "Garante" y "Sede"
    Y la grilla muestra 50 ejecutivos filtrados
    Cuando hago scroll hacia abajo en la grilla
    Entonces los filtros deben permanecer activos
    Y la grilla debe seguir mostrando solo datos filtrados

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-14 - Modificar filtros existentes y reaplicar
    Dado que he aplicado filtros y la grilla muestra 10 registros
    Cuando abro nuevamente el dropdown "Garante"
    Y deselecciono 1 garante previamente seleccionado
    Y selecciono 1 nuevo garante
    Y presiono el botón "Filtrar"
    Entonces la grilla debe actualizarse con los nuevos filtros
    Y el contador debe reflejar la nueva cantidad de registros

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES DE FILTROS ACTIVOS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: FIL-15 - Validar indicador visual cuando hay filtros activos
    Dado que he seleccionado "<cantidad>" opciones en el filtro "<filtro>"
    Y he presionado el botón "Filtrar"
    Cuando visualizo el dropdown "<filtro>"
    Entonces debe mostrarse un indicador de que hay filtros activos
    Y el dropdown debe mostrar "<cantidad> seleccionados" en lugar de "Todos"

    Ejemplos:
      | filtro    | cantidad |
      | Garante   | 2        |
      | Sede      | 3        |
      | Ejecutivo | 5        |

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON FILTROS ACTIVOS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-16 - Exportar datos con filtros aplicados respeta los filtros
    Dado que he aplicado filtros por "Garante" = "IAFAS PÚBLICAS"
    Y la grilla muestra 25 ejecutivos filtrados
    Cuando presiono el botón "Descargar"
    Entonces el archivo exportado debe contener únicamente los 25 ejecutivos filtrados
    Y debe respetar los filtros de "Garante" aplicados
    Y NO debe incluir datos de otros garantes

  # ========================================================================
  # TÉCNICA: BOTÓN RESTABLECER VISTA
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-17 - Restablecer vista limpia filtros y restablece estado inicial
    Dado que he aplicado múltiples filtros
    Y he hecho scroll en la grilla
    Cuando presiono el botón "Restablecer vista"
    Entonces todos los filtros deben limpiarse
    Y todos los dropdowns deben volver a "Todos"
    Y la grilla debe volver a la posición inicial
    Y debe mostrarse todos los ejecutivos
    Y las métricas deben mostrar datos completos

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONTADORES CON FILTROS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: FIL-18 - Validar actualización de contador con filtros
    Dado que existen <total> ejecutivos en total
    Cuando aplico filtros que resultan en <filtrados> ejecutivos
    Y presiono el botón "Filtrar"
    Entonces el contador debe mostrar "<filtrados> registros encontrados"
    Y las tarjetas deben sumar datos solo de los <filtrados> ejecutivos

    Ejemplos:
      | total | filtrados |
      | 135   | 25        |
      | 135   | 1         |
      | 135   | 135       |
      | 135   | 0         |

  # ========================================================================
  # TÉCNICA: CERRAR DROPDOWN SIN APLICAR
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-19 - Cerrar dropdown sin presionar Filtrar no aplica cambios
    Dado que he abierto el dropdown "Garante"
    Y he seleccionado 2 garantes
    Cuando cierro el dropdown sin presionar "Filtrar"
    Entonces la grilla NO debe actualizarse
    Y debe seguir mostrando los datos previos
    Y los filtros NO deben aplicarse hasta presionar "Filtrar"

  @responsableFacturacion @gestorTA @happyPath
  Escenario: FIL-20 - Validar que se puede hacer clic fuera del dropdown para cerrarlo
    Dado que he abierto el dropdown "Sede"
    Y he seleccionado algunas opciones
    Cuando hago clic fuera del dropdown
    Entonces el dropdown debe cerrarse
    Y las selecciones deben mantenerse
    Y debo poder presionar "Filtrar" para aplicar los cambios
