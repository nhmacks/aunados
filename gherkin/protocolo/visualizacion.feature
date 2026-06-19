# language: es

Característica: Visualización de Encuentros en Protocolo
  Como Gestor TA
  Quiero visualizar los encuentros que se encuentran en Protocolo
  Para realizar seguimiento operativo de encuentros que completaron Admisión

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACCESO Y ELEMENTOS DE UI
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-01 - Acceder a la pantalla Encuentros en Protocolo como Gestor TA
    Cuando accedo al módulo de Admisión
    Entonces debo visualizar la opción "Encuentros en Protocolo" en el menú
    Y debo poder acceder a la pantalla "Encuentros en Protocolo"
    Y la pantalla debe cargarse correctamente

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-02 - Visualizar elementos principales de la pantalla
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Entonces debe mostrarse la caja de búsqueda general
    Y debe mostrarse el selector "Solo Positivos" desactivado por defecto
    Y debe mostrarse el botón "Restablecer Vista" habilitado
    Y debe mostrarse el botón "Descargar" habilitado
    Y debe mostrarse el contador de registros
    Y debe mostrarse la grilla de encuentros

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE COLUMNAS DE LA GRILLA
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-03 - Visualizar columnas de la grilla de Encuentros en Protocolo
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Cuando visualizo la grilla de encuentros
    Entonces debe mostrarse la grilla con las siguientes columnas en orden:
      | Columna            |
      | Encuentro          |
      | Tipo de Encuentro  |
      | Tipo de Protocolo  |
      | Fecha de Apertura  |
      | Sede               |
      | Apellidos          |
      | Nombres            |
      | Garante            |
      | Producto           |
      | Beneficio          |
      | Mecanismo          |
      | Monto              |

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-04 - Validar que todas las columnas son visibles sin scroll horizontal
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros en protocolo
    Cuando visualizo la grilla completa
    Entonces todas las 12 columnas deben ser visibles
    Y el diseño debe optimizar el espacio disponible
    Y NO debe requerirse scroll horizontal excesivo

  # ========================================================================
  # TÉCNICA: CONTADOR DE REGISTROS
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Esquema del escenario: VIS-05 - Visualizar contador de registros encontrados
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen "<cantidad>" encuentros en protocolo
    Cuando visualizo el contador de registros
    Entonces debe mostrarse "<cantidad> registros encontrados"
    Y el contador debe ubicarse en la parte superior izquierda de la pantalla

    Ejemplos:
      | cantidad |
      | 0        |
      | 1        |
      | 33       |
      | 500      |

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-06 - Actualizar contador dinámicamente al aplicar filtros
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen 100 encuentros en protocolo
    Y el contador muestra "100 registros encontrados"
    Cuando aplico un filtro que reduce los resultados a 25 encuentros
    Entonces el contador debe actualizarse automáticamente a "25 registros encontrados"
    Y la grilla debe mostrar únicamente los 25 encuentros filtrados

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE DATOS EN LA GRILLA
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-07 - Visualizar datos completos de un encuentro en la grilla
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existe un encuentro "12345678" en protocolo con los siguientes datos:
      | Campo             | Valor                  |
      | Tipo de Encuentro | Ambulatorio            |
      | Tipo de Protocolo | Positivo               |
      | Fecha de Apertura | 05/06/2026             |
      | Sede              | Auna Guardia Civil     |
      | Apellidos         | García Pérez           |
      | Nombres           | Juan Carlos            |
      | Garante           | Pacífico EPS           |
      | Producto          | Salud EPS Pacífico     |
      | Beneficio         | Consulta Ambulatoria   |
      | Mecanismo         | CAPITA                 |
      | Monto             | S/ 1,250.00            |
    Cuando visualizo el encuentro en la grilla
    Entonces todos los campos deben mostrarse correctamente
    Y el formato de fecha debe ser "DD/MM/YYYY"
    Y el formato de monto debe incluir símbolo de moneda y decimales

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-08 - Visualizar valores vacíos en la grilla
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existe un encuentro sin "Producto" asignado
    Cuando visualizo el encuentro en la grilla
    Entonces la columna "Producto" debe mostrar "-" o estar vacía
    Y NO debe mostrarse "NULL" ni "undefined"

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE INTERACCIÓN
  # ========================================================================

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-09 - Validar que la pantalla es de solo lectura
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros en la grilla
    Cuando intento hacer clic sobre un encuentro
    Entonces NO debe abrirse ninguna ventana de detalle
    Y NO debe navegarse a otra pantalla
    Y el encuentro NO debe ser editable

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-10 - Validar que NO se puede acceder al detalle del encuentro
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y visualizo encuentros en la grilla
    Cuando intento hacer doble clic sobre un encuentro
    Entonces NO debe abrirse ninguna ventana emergente
    Y NO debe mostrarse el detalle del encuentro
    Y la pantalla debe permanecer en modo solo lectura

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-11 - Validar que NO existen botones de edición o cambio de estado
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Cuando visualizo la interfaz completa
    Entonces NO debe mostrarse ningún botón de "Editar"
    Y NO debe mostrarse ningún botón de "Cambiar Estado"
    Y NO debe mostrarse ningún botón de "Eliminar"
    Y la única interacción permitida debe ser visualización y exportación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO INICIAL
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-12 - Validar estado inicial de la pantalla al cargar
    Cuando accedo por primera vez a la pantalla "Encuentros en Protocolo"
    Entonces el selector "Solo Positivos" debe estar desactivado
    Y la caja de búsqueda debe estar vacía
    Y NO debe haber filtros aplicados en las columnas
    Y la grilla debe mostrar todos los encuentros en protocolo (positivos y negativos)
    Y el contador debe mostrar el total de encuentros disponibles

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-13 - Visualizar grilla vacía cuando no existen encuentros
    Dado que NO existen encuentros en protocolo
    Cuando accedo a la pantalla "Encuentros en Protocolo"
    Entonces debe mostrarse "0 registros encontrados"
    Y la grilla debe estar vacía
    Y debe mostrarse un mensaje "No hay encuentros en protocolo disponibles"
    Y los botones "Restablecer Vista" y "Descargar" deben permanecer habilitados

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TIPO DE PROTOCOLO
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-14 - Visualizar encuentros positivos y negativos en la grilla
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen 20 encuentros con "Tipo de Protocolo" = "Positivo"
    Y existen 15 encuentros con "Tipo de Protocolo" = "Negativo"
    Cuando visualizo la grilla sin aplicar filtros
    Entonces debe mostrarse "35 registros encontrados"
    Y la grilla debe mostrar los 35 encuentros (positivos y negativos)
    Y la columna "Tipo de Protocolo" debe mostrar claramente cada valor

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-15 - Validar formato visual de Tipo de Protocolo
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros positivos y negativos
    Cuando visualizo la columna "Tipo de Protocolo"
    Entonces los valores "Positivo" y "Negativo" deben mostrarse claramente
    Y puede aplicarse diferenciación visual (colores, badges, iconos)
    Y el valor debe ser fácilmente identificable para el usuario

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE TIPOS DE ENCUENTRO ESPECÍFICOS
  # ========================================================================

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-16 - Visualizar encuentros tipo Consulta Externa No Oncosalud
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros tipo "Consulta Externa No Oncosalud"
    Cuando visualizo la grilla
    Entonces la columna "Tipo de Encuentro" debe mostrar "Consulta Externa No Oncosalud"
    Y los encuentros deben cumplir regla de antigüedad menor o igual a 7 días
    Y deben tener documentación administrativa completa
    Y deben tener laboratorios completos e imputados

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-17 - Visualizar encuentros tipo Consulta Externa Oncosalud
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros tipo "Consulta Externa Oncosalud"
    Cuando visualizo la grilla
    Entonces la columna "Tipo de Encuentro" debe mostrar "Consulta Externa Oncosalud"
    Y los encuentros deben cumplir regla de antigüedad menor o igual a 31 días
    Y deben tener documentación administrativa completa
    Y deben tener laboratorios completos e imputados

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-18 - Visualizar encuentros tipo Emergencia
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros tipo "Emergencia"
    Cuando visualizo la grilla
    Entonces la columna "Tipo de Encuentro" debe mostrar "Emergencia"
    Y los encuentros deben cumplir regla de antigüedad menor o igual a 2 días
    Y deben tener documentación administrativa completa
    Y deben tener laboratorios completos e imputados

  @prioridadMedia @gestorTA @happyPath
  Esquema del escenario: VIS-19 - Visualizar mezcla de tipos de encuentro en la grilla
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen "<cantidad_ce_no_onco>" encuentros tipo "Consulta Externa No Oncosalud"
    Y existen "<cantidad_ce_onco>" encuentros tipo "Consulta Externa Oncosalud"
    Y existen "<cantidad_emergencia>" encuentros tipo "Emergencia"
    Cuando visualizo la grilla sin aplicar filtros
    Entonces debe mostrarse "<total>" registros encontrados
    Y la grilla debe mostrar todos los tipos de encuentro mezclados
    Y cada encuentro debe mostrar correctamente su tipo en la columna "Tipo de Encuentro"

    Ejemplos:
      | cantidad_ce_no_onco | cantidad_ce_onco | cantidad_emergencia | total |
      | 20                  | 15               | 10                  | 45    |
      | 30                  | 0                | 5                   | 35    |
      | 0                   | 25               | 8                   | 33    |

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: VIS-20 - Validar que NO se muestran encuentros fuera de reglas de antigüedad
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Cuando visualizo la grilla
    Entonces NO deben mostrarse encuentros "Consulta Externa No Oncosalud" con más de 7 días
    Y NO deben mostrarse encuentros "Consulta Externa Oncosalud" con más de 31 días
    Y NO deben mostrarse encuentros "Emergencia" con más de 2 días
    Y todos los encuentros visibles deben estar dentro de sus rangos de antigüedad permitidos

  @prioridadMedia @gestorTA @happyPath
  Escenario: VIS-21 - Validar que todos los encuentros visibles superaron validaciones de Admisión
    Dado que he accedido a la pantalla "Encuentros en Protocolo"
    Y existen encuentros de diferentes tipos en la grilla
    Cuando valido los datos de los encuentros
    Entonces todos los encuentros visibles deben tener documentación administrativa completa
    Y todos deben tener sustentos médicos completos
    Y todos deben tener laboratorios imputados
    Y ningún encuentro debe tener sustentos administrativos pendientes
    Y ningún encuentro debe tener laboratorios pendientes
