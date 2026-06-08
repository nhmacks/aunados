# language: es

Característica: Filtros y Búsqueda en Asignaciones Masivas
  Como Responsable de Facturación
  Quiero filtrar y buscar encuentros para asignar masivamente
  Para gestionar eficientemente las asignaciones a ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Asignaciones masivas"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FILTROS - FILTRO POR FECHAS Y GARANTE
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: FIL-01 - Aplicar filtros de fecha y tipo de garante exitosamente
    Dado que existen encuentros en el rango de los últimos 6 meses
    Y existen encuentros de diferentes tipos de garante
    Cuando selecciono una fecha de inicio dentro de los últimos 6 meses
    Y selecciono como fecha fin la fecha actual
    Y selecciono "todos los tipos de garante" en el filtro
    Y selecciono el botón "Buscar"
    Entonces el sistema debe mostrar los encuentros que cumplen los filtros
    Y debe mostrarse la tabla de resultados con las columnas: Garante, Cantidad de encuentros, Monto por facturar
    Y el contador debe mostrar la cantidad total de registros encontrados
    Y el botón "Asignar" debe estar deshabilitado hasta seleccionar registros

  @responsableFacturacion @happyPath
  Esquema del escenario: FIL-02 - Filtrar por diferentes cantidades de tipos de garante
    Dado que existen encuentros de múltiples tipos de garante
    Y he seleccionado una fecha de inicio dentro de los últimos 6 meses
    Y he seleccionado como fecha fin la fecha actual
    Cuando selecciono "<cantidad_garantes>" en el filtro de tipo de garante
    Y selecciono el botón "Buscar"
    Entonces el sistema debe mostrar únicamente los encuentros de los garantes seleccionados
    Y debe mostrarse "<registros_esperados>" registros en la tabla

    Ejemplos:
      | cantidad_garantes        | registros_esperados |
      | un tipo de garante       | 1 registro          |
      | 5 tipos de garante       | 5 registros         |
      | todos los tipos de garante | Todos los registros |

  @responsableFacturacion @unhappyPath
  Escenario: FIL-03 - Validar que fecha de inicio no puede ser mayor a 6 meses
    Dado que estoy en la bandeja "Asignaciones masivas"
    Cuando selecciono una fecha de inicio mayor a 6 meses atrás
    Entonces el sistema debe mostrar un mensaje de error "La fecha de inicio no puede ser mayor a 6 meses"
    Y el botón "Buscar" debe permanecer deshabilitado
    Y NO debe realizarse ninguna búsqueda

  @responsableFacturacion @unhappyPath
  Escenario: FIL-04 - Validar que fecha fin no puede ser menor a fecha inicio
    Dado que he seleccionado una fecha de inicio válida
    Cuando selecciono una fecha fin anterior a la fecha de inicio
    Entonces el sistema debe mostrar un mensaje de error "La fecha fin debe ser posterior a la fecha de inicio"
    Y el botón "Buscar" debe permanecer deshabilitado
    Y NO debe realizarse ninguna búsqueda

  # ========================================================================
  # TÉCNICA: LIMPIAR FILTROS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: FIL-05 - Limpiar filtros realizados
    Dado que he seleccionado una fecha de inicio dentro de los últimos 6 meses
    Y he seleccionado como fecha fin la fecha actual
    Y he seleccionado "todos los tipos de garante" en el filtro
    Y he seleccionado el botón "Buscar"
    Y el sistema muestra resultados en la grilla
    Cuando selecciono el botón "Limpiar"
    Entonces el sistema debe limpiar el campo "fecha de inicio"
    Y el sistema debe limpiar el campo "fecha fin"
    Y el sistema debe limpiar el filtro "Tipo de garante"
    Y el botón "Buscar" debe estar deshabilitado
    Y el botón "Asignar" debe estar deshabilitado
    Y la grilla debe limpiarse
    Y debe mostrarse el mensaje "Filtra para ver los resultados"

  @responsableFacturacion @happyPath
  Esquema del escenario: FIL-06 - Limpiar con diferentes cantidades de garantes seleccionados
    Dado que he aplicado filtros con "<cantidad_garantes>"
    Y he seleccionado el botón "Buscar"
    Y el sistema muestra resultados
    Cuando selecciono el botón "Limpiar"
    Entonces todos los filtros deben limpiarse
    Y la grilla debe vaciarse
    Y debe mostrarse el mensaje "Filtra para ver los resultados"

    Ejemplos:
      | cantidad_garantes        |
      | sin tipo de garante      |
      | un tipo de garante       |
      | 5 tipos de garante       |
      | todos los tipos de garante |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO DE RESULTADOS
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: FIL-07 - Ordenar resultados por diferentes criterios
    Dado que he aplicado filtros válidos
    Y he seleccionado el botón "Buscar"
    Y el sistema muestra múltiples resultados
    Cuando selecciono ordenar por "<criterio_ordenamiento>"
    Entonces el sistema debe ordenar los resultados por "<criterio_ordenamiento>" de forma ascendente
    Y la tabla debe reflejar el nuevo orden inmediatamente

    Ejemplos:
      | criterio_ordenamiento    |
      | Garante                  |
      | Cantidad de encuentros   |
      | Monto por facturar       |

  @responsableFacturacion @happyPath
  Escenario: FIL-08 - Ordenar ascendente y descendente alternadamente
    Dado que he aplicado filtros válidos
    Y he seleccionado el botón "Buscar"
    Y el sistema muestra resultados ordenados por "Garante" ascendente
    Cuando selecciono nuevamente el encabezado "Garante"
    Entonces el sistema debe cambiar el orden a descendente
    Y los resultados deben mostrarse de Z a A

  @responsableFacturacion @happyPath
  Escenario: FIL-09 - Mantener ordenamiento después de realizar nueva búsqueda
    Dado que he aplicado filtros y realizado una búsqueda
    Y he ordenado los resultados por "Monto por facturar"
    Cuando modifico los filtros de fecha
    Y selecciono nuevamente el botón "Buscar"
    Entonces el sistema debe restablecer el ordenamiento al valor por defecto
    Y los nuevos resultados deben mostrarse sin ordenamiento previo aplicado

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO INICIAL
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: FIL-10 - Validar estado inicial de la pantalla de asignaciones masivas
    Cuando accedo a la bandeja "Asignaciones masivas"
    Entonces el campo "fecha de inicio" debe estar vacío
    Y el campo "fecha fin" debe estar vacío
    Y el filtro "Tipo de garante" debe estar sin selección
    Y el botón "Buscar" debe estar deshabilitado
    Y el botón "Limpiar" debe estar deshabilitado
    Y el botón "Asignar" debe estar deshabilitado
    Y debe mostrarse el mensaje "Filtra para ver los resultados"
    Y la grilla debe estar vacía

  @responsableFacturacion @happyPath
  Escenario: FIL-11 - Habilitar botón Buscar al completar filtros mínimos requeridos
    Dado que el botón "Buscar" está deshabilitado
    Cuando selecciono una fecha de inicio válida
    Y selecciono una fecha fin válida
    Y selecciono al menos un tipo de garante
    Entonces el botón "Buscar" debe habilitarse
    Y debo poder realizar la búsqueda

  @responsableFacturacion @unhappyPath
  Escenario: FIL-12 - Validar mensaje cuando búsqueda no arroja resultados
    Dado que he seleccionado filtros válidos
    Y NO existen encuentros que cumplan los criterios de búsqueda
    Cuando selecciono el botón "Buscar"
    Entonces debe mostrarse el mensaje "No se encontraron resultados para los filtros aplicados"
    Y la grilla debe permanecer vacía
    Y el botón "Asignar" debe permanecer deshabilitado
    Y el contador debe mostrar "0 Registros encontrados"
