# language: es

Característica: Visualización de Lista de Encuentros para Asignar
  Como Responsable de Facturación
  Quiero visualizar la lista de encuentros para asignar
  Para gestionar la asignación de encuentros a ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTRUCTURA - ELEMENTOS DE UI
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-01 - Visualizar elementos principales de la pantalla Lista de Encuentros para Asignar
    Dado que estoy en el sistema AUNADOS
    Cuando accedo a la bandeja "Lista de encuentros para asignar"
    Entonces debe mostrarse el label "Lista de encuentros para asignar"
    Y debe mostrarse la caja de texto "Buscar por nombre, apellido o nro de encuentro"
    Y debe mostrarse el botón "Asignar" deshabilitado
    Y debe mostrarse el botón "Clasificar" deshabilitado
    Y debe mostrarse el botón "Descargar" habilitado
    Y debe mostrarse el botón "Restablecer vista" habilitado
    Y debe mostrarse el label con formato "###### Registros encontrados"

  @responsableFacturacion @happyPath
  Escenario: VIS-02 - Visualizar columnas de la tabla de encuentros para asignar
    Dado que estoy en el sistema AUNADOS
    Y he accedido a la bandeja "Lista de encuentros para asignar"
    Cuando visualizo la tabla de encuentros
    Entonces debe mostrarse la tabla con los siguientes encabezados en orden:
      | Columna            |
      | Encuentro          |
      | Clasific.          |
      | Sede               |
      | Apellidos          |
      | Nombres            |
      | Garante            |
      | Tipo de encuentro  |
      | Producto           |
      | Beneficio          |
      | Fecha apert.       |
      | Mec.               |
      | Servicio básico    |
      | Por Fact. Fin      |
      | Por Liq. Fin       |
      | Fact. Fin          |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADOS INICIALES - BOTONES
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-03 - Validar estado inicial de botones sin selección de encuentros
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y NO he seleccionado ningún encuentro
    Cuando visualizo los botones de acción
    Entonces el botón "Asignar" debe estar deshabilitado
    Y el botón "Clasificar" debe estar deshabilitado
    Y el botón "Descargar" debe estar habilitado
    Y el botón "Restablecer vista" debe estar habilitado

  @responsableFacturacion @happyPath
  Escenario: VIS-04 - Validar habilitación de botones al seleccionar un encuentro
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros en estado "Por asignar"
    Cuando selecciono un encuentro de la tabla
    Entonces el botón "Asignar" debe estar habilitado
    Y el botón "Clasificar" debe estar habilitado
    Y el botón "Descargar" debe estar habilitado
    Y el botón "Restablecer vista" debe estar habilitado

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-04B - Validar contador de encuentros seleccionados
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen <total> encuentros para asignar
    Cuando selecciono <seleccionados> encuentros de la tabla
    Entonces debe mostrarse "<seleccionados> registro seleccionado de <total>"

    Ejemplos:
      | total | seleccionados |
      | 25040 | 1             |
      | 500   | 5             |
      | 1000  | 10            |
      | 100   | 50            |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONTADOR DE REGISTROS
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-05 - Visualizar contador de registros encontrados
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen "<cantidad>" encuentros para asignar
    Cuando visualizo el contador de registros
    Entonces debe mostrarse "<cantidad> Registros encontrados"

    Ejemplos:
      | cantidad |
      | 0        |
      | 1        |
      | 50       |
      | 1000     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BÚSQUEDA
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-06 - Buscar encuentro por nombre del paciente
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros del paciente "Juan Carlos García"
    Cuando ingreso "Juan Carlos" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "Juan Carlos" en nombres
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @responsableFacturacion @happyPath
  Escenario: VIS-07 - Buscar encuentro por apellido del paciente
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros del paciente con apellido "García Pérez"
    Cuando ingreso "García" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "García" en apellidos
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @responsableFacturacion @happyPath
  Escenario: VIS-08 - Buscar encuentro por número de encuentro
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existe el encuentro con número "12345678"
    Cuando ingreso "12345678" en la caja de búsqueda
    Entonces debe mostrarse únicamente el encuentro "12345678"
    Y el contador debe mostrar "1 Registros encontrados"

  @responsableFacturacion @happyPath
  Escenario: VIS-09 - Limpiar búsqueda con botón Restablecer vista
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y he realizado una búsqueda por "García"
    Y el sistema muestra resultados filtrados
    Cuando selecciono el botón "Restablecer vista"
    Entonces la caja de búsqueda debe limpiarse
    Y debe mostrarse todos los encuentros para asignar
    Y el contador debe mostrar la cantidad total de encuentros

  # ========================================================================
  # TÉCNICA: CHECKBOXES - SELECCIÓN DE ENCUENTROS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-10 - Visualizar checkbox en cada fila de la tabla
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros para asignar
    Cuando visualizo la tabla de encuentros
    Entonces cada fila debe tener un checkbox al inicio (lado izquierdo)
    Y todos los checkboxes deben estar desmarcados inicialmente
    Y el checkbox debe ser clicable

  @responsableFacturacion @happyPath
  Escenario: VIS-11 - Seleccionar un encuentro usando checkbox
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen 100 encuentros para asignar
    Cuando hago clic en el checkbox del encuentro "12345678"
    Entonces el checkbox debe marcarse
    Y la fila debe resaltarse visualmente
    Y el botón "Asignar" debe habilitarse
    Y el botón "Clasificar" debe habilitarse
    Y debe mostrarse "1 registro seleccionado de 100"

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-12 - Seleccionar múltiples encuentros usando checkboxes
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen <total> encuentros para asignar
    Cuando selecciono <cantidad> encuentros usando sus checkboxes
    Entonces <cantidad> checkboxes deben estar marcados
    Y <cantidad> filas deben estar resaltadas visualmente
    Y el botón "Asignar" debe estar habilitado
    Y el botón "Clasificar" debe estar habilitado
    Y debe mostrarse "<cantidad> registros seleccionados de <total>"

    Ejemplos:
      | total | cantidad |
      | 100   | 2        |
      | 500   | 5        |
      | 1000  | 10       |
      | 5000  | 50       |

  @responsableFacturacion @happyPath
  Escenario: VIS-13 - Deseleccionar encuentro usando checkbox
    Dado que he seleccionado 3 encuentros usando checkboxes
    Y existen 100 encuentros para asignar
    Y el botón "Asignar" está habilitado
    Cuando hago clic en el checkbox de un encuentro ya seleccionado
    Entonces el checkbox debe desmarcarse
    Y la fila debe volver a su estado normal (sin resaltar)
    Y debe mostrarse "2 registros seleccionados de 100"
    Y el botón "Asignar" debe permanecer habilitado
    Y el botón "Clasificar" debe permanecer habilitado

  @responsableFacturacion @happyPath
  Escenario: VIS-14 - Deseleccionar todos los encuentros deshabilita botones
    Dado que he seleccionado 3 encuentros usando checkboxes
    Y existen 100 encuentros para asignar
    Y el botón "Asignar" está habilitado
    Cuando deselecciono los 3 encuentros uno por uno
    Entonces todos los checkboxes deben estar desmarcados
    Y ninguna fila debe estar resaltada
    Y el botón "Asignar" debe deshabilitarse
    Y el botón "Clasificar" debe deshabilitarse
    Y debe mostrarse "0 registros seleccionados de 100"

  @responsableFacturacion @happyPath
  Escenario: VIS-15 - Checkbox de encabezado para seleccionar todos
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen 25 encuentros para asignar
    Y existe un checkbox en el encabezado de la tabla
    Cuando hago clic en el checkbox del encabezado
    Entonces todos los 25 checkboxes de las filas deben marcarse
    Y todas las 25 filas deben resaltarse
    Y el botón "Asignar" debe habilitarse
    Y el botón "Clasificar" debe habilitarse
    Y debe mostrarse "25 registros seleccionados de 25"

  @responsableFacturacion @happyPath
  Escenario: VIS-16 - Deseleccionar todos usando checkbox de encabezado
    Dado que he seleccionado todos los encuentros usando el checkbox del encabezado
    Y existen 25 encuentros para asignar
    Y todos los checkboxes están marcados
    Cuando hago clic nuevamente en el checkbox del encabezado
    Entonces todos los checkboxes deben desmarcarse
    Y ninguna fila debe estar resaltada
    Y el botón "Asignar" debe deshabilitarse
    Y el botón "Clasificar" debe deshabilitarse
    Y debe mostrarse "0 registros seleccionados de 25"

  # ========================================================================
  # TÉCNICA: SCROLL HORIZONTAL - VISUALIZACIÓN DE TODAS LAS COLUMNAS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-17 - Hacer scroll horizontal para visualizar todas las columnas
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros para asignar
    Cuando visualizo la tabla inicialmente
    Entonces debo ver las primeras columnas: Encuentro, Clasific., Sede, Apellidos, Nombres, Garante, Tipo de encuentro
    Cuando hago scroll horizontal hacia la derecha
    Entonces debo poder visualizar las columnas: Producto, Beneficio, Fecha apert., Mec., Servicio básico, Por Fact. Fin, Por Liq. Fin, Fact. Fin
    Y todas las 15 columnas deben ser accesibles mediante scroll

  @responsableFacturacion @happyPath
  Escenario: VIS-18 - Validar visibilidad de columnas al hacer scroll horizontal
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros para asignar
    Cuando hago scroll horizontal completamente hacia la derecha
    Entonces debo visualizar las columnas finales: Por Fact. Fin, Por Liq. Fin, Fact. Fin
    Y las columnas iniciales (Encuentro, Clasific., Sede) pueden quedar fuera de vista
    Cuando hago scroll horizontal hacia la izquierda
    Entonces debo volver a visualizar las columnas iniciales

  # ========================================================================
  # TÉCNICA: FORMATO DE MONTOS EN COLUMNAS
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-19 - Validar formato de montos en columnas monetarias
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existe el encuentro "12345678" con "<columna>" igual a <valor>
    Cuando visualizo la tabla de encuentros
    Y hago scroll hasta visualizar la columna "<columna>"
    Entonces el encuentro "12345678" debe mostrar "<formato_esperado>" en la columna "<columna>"
    Y el formato debe incluir el símbolo "S/" al inicio
    Y el formato debe incluir separador de miles si aplica
    Y el formato debe incluir dos decimales

    Ejemplos:
      | columna       | valor      | formato_esperado |
      | Por Fact. Fin | 0.00       | S/ 0.00          |
      | Por Liq. Fin  | 0.00       | S/ 0.00          |
      | Fact. Fin     | 0.00       | S/ 0.00          |
      | Por Fact. Fin | 1250.50    | S/ 1,250.50      |
      | Por Liq. Fin  | 5000.00    | S/ 5,000.00      |
      | Fact. Fin     | 25000.00   | S/ 25,000.00     |
      | Por Fact. Fin | 100000.00  | S/ 100,000.00    |
      | Por Liq. Fin  | 500000.00  | S/ 500,000.00    |
      | Fact. Fin     | 9999999.99 | S/ 9,999,999.99  |

  @responsableFacturacion @happyPath
  Escenario: VIS-20 - Validar alineación de montos en columnas
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen múltiples encuentros con diferentes montos
    Cuando visualizo las columnas "Por Fact. Fin", "Por Liq. Fin" y "Fact. Fin"
    Entonces todos los montos deben estar alineados a la derecha
    Y los separadores de miles deben estar alineados verticalmente
    Y los decimales deben estar alineados verticalmente

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DE BADGES DE CLASIFICACIÓN
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-21 - Visualizar badge de clasificación "Por asignar" con estilo correcto
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros en estado "Por asignar"
    Cuando visualizo la columna "Clasific."
    Entonces los encuentros en estado "Por asignar" deben mostrar un badge con texto "Por asignar"
    Y el badge debe tener color de fondo naranja/amarillo
    Y el badge debe tener bordes redondeados
    Y el texto debe ser legible sobre el fondo

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-22 - Validar colores de badges según clasificación
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros con clasificación "<clasificacion>"
    Cuando visualizo la columna "Clasific."
    Entonces los encuentros con clasificación "<clasificacion>" deben mostrar un badge
    Y el badge debe tener un color distintivo según la clasificación
    Y el texto debe ser legible sobre el fondo del badge

    Ejemplos:
      | clasificacion            |
      | Por asignar              |
      | Error de facturación     |
      | No facturable            |
      | Regularizado             |
      | Facturar con hospitalario|
      | Imp. Fact. Fin           |
      | Pendiente en consulta    |
      | No Facturar              |

  # ========================================================================
  # TÉCNICA: CONTADOR DE SELECCIÓN DETALLADO
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-23 - Validar formato de contador con selección activa
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen <total> encuentros para asignar
    Cuando selecciono <seleccionados> encuentros
    Entonces debe mostrarse "<texto_esperado>"
    Y el contador debe distinguir entre seleccionados y total

    Ejemplos:
      | total | seleccionados | texto_esperado                |
      | 100   | 1             | 1 registro seleccionado de 100|
      | 500   | 5             | 5 registros seleccionados de 500|
      | 1000  | 10            | 10 registros seleccionados de 1000|
      | 23281 | 1             | 1 registro seleccionado de 23281|
      | 23281 | 50            | 50 registros seleccionados de 23281|

  @responsableFacturacion @happyPath
  Escenario: VIS-24 - Validar que contador vuelve a formato original al deseleccionar
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen 23281 encuentros para asignar
    Y he seleccionado 5 encuentros
    Y el contador muestra "5 registros seleccionados de 23281"
    Cuando deselecciono todos los encuentros
    Entonces el contador debe mostrar "23281 Registros encontrados"
    Y NO debe mostrar información de selección
