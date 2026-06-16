# language: es

Característica: Registro de Eventos Analytics en Lista de Encuentros
  Como administrador del sistema AUNADOS
  Quiero que todas las acciones relevantes de usuario se registren en Amplitude
  Para tener trazabilidad completa y análisis de uso del sistema

  Antecedentes:
    Dado que el sistema está configurado para registrar eventos en Amplitude
    Y el usuario ha iniciado sesión correctamente

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - EVENTOS DE ORDENAMIENTO
  # Cobertura: Registro de acciones de ordenamiento de columnas
  # ========================================================================

  @gestorTA @happyPath
  Esquema del escenario: ANLT-01 - Registrar evento al ordenar tabla como Gestor TA
    Dado que el usuario Gestor TA se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de ordenamiento en la columna "<columna_filtro>"
    Y aplica ordenamiento "<ordenamiento>" de la tabla
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_ORDENAMIENTO"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Gestor TA"
    Y se registra el nombre de la columna "<columna_filtro>"
    Y se registra el orden del filtro "<ordenamiento>"

    Ejemplos:
      | columna_filtro    | ordenamiento |
      | Encuentro         | desc         |
      | N° HC             | desc         |
      | Apellidos         | desc         |
      | Nombres           | asc          |
      | Fecha apert.      | asc          |
      | Usuario           | asc          |
      | Garante           | asc          |
      | Tipo de encuentro | asc          |
      | Monto             | asc          |

  @superusuarioAdmision @happyPath
  Esquema del escenario: ANLT-02 - Registrar evento al ordenar tabla como Superusuario
    Dado que el usuario Superusuario de Admisión se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de ordenamiento en la columna "<columna_filtro>"
    Y aplica ordenamiento "<ordenamiento>" de la tabla
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_ORDENAMIENTO"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Superusuario de Admisión"
    Y se registra el nombre de la columna "<columna_filtro>"
    Y se registra el orden del filtro "<ordenamiento>"

    Ejemplos:
      | columna_filtro    | ordenamiento |
      | Encuentro         | desc         |
      | N° HC             | asc          |
      | Apellidos         | desc         |
      | Nombres           | asc          |
      | Fecha apert.      | asc          |
      | Garante           | desc         |
      | Tipo de encuentro | asc          |

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - EVENTOS DE FILTROS MULTISELECCIÓN
  # Cobertura: Registro de filtros con múltiples opciones seleccionadas
  # ========================================================================

  @gestorTA @happyPath
  Esquema del escenario: ANLT-03 - Registrar evento al aplicar filtro multiselección como Gestor TA
    Dado que el usuario Gestor TA se encuentra en la sección de Lista de encuentros
    Cuando aplica filtro por selección múltiple en "<campo>"
    Y selecciona "<opciones>" opciones
    Entonces se guarda en Amplitude el evento "TABLE_FILTER_MULTISELECT"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Gestor TA"
    Y se registra el nombre de la columna "<campo>"
    Y se registra las opciones seleccionadas en el filtro

    Ejemplos:
      | campo                     | opciones           |
      | Sede                      | una opción         |
      | Estado                    | una opción         |
      | Prioridad                 | una opción         |
      | Tipo de encuentro         | una opción         |
      | Sustentos administrativos | más de una opción  |
      | Sustentos médicos         | todas las opciones |
      | Mecanismo                 | una opción         |

  @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-04 - Registrar evento al aplicar filtro multiselección como Ejecutivo
    Dado que el usuario Ejecutivo de Admisión se encuentra en la sección de Lista de encuentros
    Cuando aplica filtro por selección múltiple en "<campo>"
    Y selecciona "<opciones>" opciones
    Entonces se guarda en Amplitude el evento "TABLE_FILTER_MULTISELECT"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Ejecutivo de Admisión"
    Y se registra el nombre de la columna "<campo>"
    Y se registra las opciones seleccionadas en el filtro

    Ejemplos:
      | campo             | opciones          |
      | Estado            | todas las opciones|
      | Prioridad         | una opción        |
      | Tipo de encuentro | una opción        |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE DATOS - EVENTOS DE FILTROS POR FECHA
  # Cobertura: Registro de filtros de rango de fechas
  # ========================================================================

  @gestorTA @happyPath
  Escenario: ANLT-05 - Registrar evento al aplicar filtro de fecha como Gestor TA
    Dado que el usuario Gestor TA se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de fecha en la columna "Fecha apert."
    Y se selecciona un rango de fechas específico del 01/01/2024 al 31/01/2024
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_FECHA"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Gestor TA"
    Y se registra el nombre de la columna "Fecha apert."
    Y se registra el rango de fechas seleccionado en el filtro

  @ejecutivoAdmision @happyPath
  Escenario: ANLT-06 - Registrar evento al aplicar filtro de fecha como Ejecutivo
    Dado que el usuario Ejecutivo de Admisión se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de fecha en la columna "Fecha apert."
    Y se selecciona un rango de fechas específico del 01/06/2024 al 30/06/2024
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_FECHA"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Ejecutivo de Admisión"
    Y se registra el nombre de la columna "Fecha apert."
    Y se registra el rango de fechas seleccionado en el filtro

  @superusuarioAdmision @happyPath
  Escenario: ANLT-07 - Registrar evento al aplicar filtro de fecha como Superusuario
    Dado que el usuario Superusuario de Admisión se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de fecha en la columna "Fecha apert."
    Y se selecciona un rango de fechas específico del 01/03/2024 al 31/03/2024
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_FECHA"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Superusuario de Admisión"
    Y se registra el nombre de la columna "Fecha apert."
    Y se registra el rango de fechas seleccionado en el filtro

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE OPERADORES - EVENTOS DE FILTROS POR TEXTO
  # Cobertura: Registro de filtros de texto con operadores (Contiene, Igual, etc.)
  # ========================================================================

  @gestorTA @happyPath
  Esquema del escenario: ANLT-08 - Registrar evento al aplicar filtro de texto como Gestor TA
    Dado que el usuario Gestor TA se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de texto en la columna "<columna_filtro>"
    Y se ingresa un texto específico "<texto_ingresado>"
    Y se selecciona el operador "<operador>"
    Entonces se guarda en Amplitude el evento "TABLE_FILTER_TEXT"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Gestor TA"
    Y se registra el nombre de la columna "<columna_filtro>"
    Y se registra el valor del operador seleccionado "<operador>"
    Y se registra el valor del texto ingresado en el filtro "<texto_ingresado>"

    Ejemplos:
      | columna_filtro | texto_ingresado | operador  |
      | Usuario        | Juan Pérez      | Contiene  |
      | Garante        | MAPFRE          | Contiene  |
      | Usuario        | jperez          | Igual a   |

  @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-09 - Registrar evento al aplicar filtro de texto como Ejecutivo
    Dado que el usuario Ejecutivo de Admisión se encuentra en la sección de Lista de encuentros
    Cuando se aplica un filtro de texto en la columna "<columna_filtro>"
    Y se ingresa un texto específico "<texto_ingresado>"
    Y se selecciona el operador "<operador>"
    Entonces se guarda en Amplitude el evento "TABLA_FILTRO_TEXTO"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "Ejecutivo de Admisión"
    Y se registra el nombre de la columna "<columna_filtro>"
    Y se registra el valor del operador seleccionado "<operador>"
    Y se registra el valor del texto ingresado en el filtro "<texto_ingresado>"

    Ejemplos:
      | columna_filtro | texto_ingresado | operador  |
      | Garante        | Pacífico        | Contiene  |

  # ========================================================================
  # TÉCNICA: EVENTOS DE BÚSQUEDA GENERAL
  # Cobertura: Registro de búsquedas en el campo general
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-10 - Registrar evento al realizar búsqueda general
    Dado que soy un usuario con rol "<rol>"
    Y me encuentro en la sección de Lista de encuentros
    Cuando ingreso "<criterio_busqueda>" en el campo de búsqueda general
    Y presiono Enter
    Entonces se guarda en Amplitude el evento "SEARCH_GENERAL"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "<rol>"
    Y se registra el criterio de búsqueda ingresado "<criterio_busqueda>"
    Y se registra la cantidad de resultados obtenidos

    Ejemplos:
      | rol                      | criterio_busqueda |
      | Superusuario de Admisión | Juan              |
      | Gestor TA                | 12345678          |
      | Ejecutivo de Admisión    | García            |

  # ========================================================================
  # TÉCNICA: EVENTOS DE EXPORTACIÓN
  # Cobertura: Registro de descargas de reportes
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ANLT-11 - Registrar evento al exportar como Superusuario o Gestor TA (descarga inmediata)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y me encuentro en la sección de Lista de encuentros
    Y existen 150 encuentros visibles
    Cuando presiono el botón de descarga
    Y el sistema genera el archivo inmediatamente
    Entonces se guarda en Amplitude el evento "EXPORT_IMMEDIATE"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario
    Y se registra la cantidad de registros exportados "150"
    Y se registra si había filtros activos
    Y se registra los filtros aplicados al momento de la exportación

  @ejecutivoAdmision @happyPath
  Escenario: ANLT-12 - Registrar evento al solicitar exportación como Ejecutivo (descarga asíncrona)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y me encuentro en la sección de Lista de encuentros
    Y existen 80 encuentros visibles
    Cuando presiono el botón de descarga
    Y el sistema inicia la generación asíncrona
    Entonces se guarda en Amplitude el evento "EXPORT_REQUEST_ASYNC"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora de la solicitud
    Y se registra el rol del usuario "Ejecutivo de Admisión"
    Y se registra la cantidad de registros solicitados "80"
    Y se registra si había filtros activos
    Y se registra los filtros aplicados al momento de la solicitud

  @ejecutivoAdmision @happyPath
  Escenario: ANLT-13 - Registrar evento al descargar archivo generado desde la campana (Ejecutivo)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una exportación asíncrona previamente
    Y el archivo ha sido generado
    Cuando descargo el archivo desde la campana de notificaciones
    Entonces se guarda en Amplitude el evento "EXPORT_DOWNLOAD_FROM_NOTIFICATION"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora de la descarga
    Y se registra el rol del usuario "Ejecutivo de Admisión"
    Y se registra el ID del reporte descargado
    Y se registra el tiempo transcurrido entre solicitud y descarga

  # ========================================================================
  # TÉCNICA: EVENTOS DE ACCESO AL DETALLE
  # Cobertura: Registro de accesos a detalle de encuentros
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-14 - Registrar evento al acceder al detalle de un encuentro
    Dado que soy un usuario con rol "<rol>"
    Y me encuentro en la sección de Lista de encuentros
    Cuando selecciono un encuentro de la grilla
    Y el sistema abre el Detalle del Encuentro
    Entonces se guarda en Amplitude el evento "ACCESS_ENCOUNTER_DETAIL"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "<rol>"
    Y se registra el número de encuentro accedido
    Y se registra el estado del encuentro
    Y se registra desde qué vista se accedió (Lista de Encuentros)

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA              |
      | Ejecutivo de Admisión    |

  # ========================================================================
  # TÉCNICA: EVENTOS DE LIMPIEZA Y RESTABLECIMIENTO
  # Cobertura: Registro de acciones de limpieza de filtros
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-15 - Registrar evento al limpiar un filtro individual
    Dado que soy un usuario con rol "<rol>"
    Y me encuentro en la sección de Lista de encuentros
    Y he aplicado el filtro "<filtro>" con valor "<valor>"
    Cuando presiono el botón "Limpiar" del filtro "<filtro>"
    Entonces se guarda en Amplitude el evento "FILTER_CLEAR_INDIVIDUAL"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "<rol>"
    Y se registra el nombre del filtro limpiado "<filtro>"
    Y se registra el valor que tenía antes de limpiar "<valor>"

    Ejemplos:
      | rol                      | filtro     | valor     |
      | Superusuario de Admisión | Estado     | Pendiente |
      | Gestor TA              | Mecanismo  | CAPITA    |
      | Ejecutivo de Admisión    | Prioridad  | Prioridad 1|

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-16 - Registrar evento al restablecer vista completa
    Dado que soy un usuario con rol "<rol>"
    Y me encuentro en la sección de Lista de encuentros
    Y he aplicado múltiples filtros
    Y he realizado búsquedas
    Cuando presiono el botón "Restablecer Vista"
    Entonces se guarda en Amplitude el evento "RESET_VIEW"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el correo
    Y se registra la fecha y hora del evento
    Y se registra el rol del usuario "<rol>"
    Y se registra la cantidad de filtros activos antes de restablecer
    Y se registra los filtros que fueron eliminados

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA              |
      | Ejecutivo de Admisión    |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE METADATA - CAMPOS COMUNES EN TODOS LOS EVENTOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: ANLT-17 - Validar que todos los eventos incluyen metadata completa
    Dado que soy un usuario con rol "Gestor TA"
    Y me encuentro en la sección de Lista de encuentros
    Cuando realizo cualquier acción que genera un evento
    Entonces el evento debe incluir obligatoriamente:
      | Campo              | Tipo     |
      | Nombre completo    | String   |
      | Usuario (login)    | String   |
      | Correo electrónico | String   |
      | Fecha evento       | DateTime |
      | Hora evento        | Time     |
      | Rol                | String   |
      | Nombre evento      | String   |
    Y todos los campos deben tener valores no nulos
    Y la fecha y hora deben ser exactas al momento del evento

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: ANLT-18 - Validar formato de timestamps en eventos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y me encuentro en la sección de Lista de encuentros
    Cuando realizo una acción que genera un evento
    Entonces el timestamp debe estar en formato ISO 8601
    Y debe incluir zona horaria
    Y debe ser preciso hasta milisegundos
    Y debe corresponder al momento exacto de la acción

  # ========================================================================
  # TÉCNICA: EVENTOS DE SCROLL Y CARGA DE DATOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: ANLT-19 - Registrar evento al hacer scroll infinito
    Dado que soy un usuario con rol "<rol>"
    Y me encuentro en la sección de Lista de encuentros
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Y el sistema carga automáticamente los siguientes 50 registros
    Entonces se guarda en Amplitude el evento "INFINITE_SCROLL_LOAD"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el rol del usuario "<rol>"
    Y se registra el número de página cargada
    Y se registra la cantidad de registros cargados
    Y se registra si había filtros activos

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA              |
      | Ejecutivo de Admisión    |

  # ========================================================================
  # TÉCNICA: EVENTOS DE ERROR Y MENSAJES
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: ANLT-20 - Registrar evento cuando filtro no retorna resultados
    Dado que soy un usuario con rol "Gestor TA"
    Y me encuentro en la sección de Lista de encuentros
    Cuando aplico un filtro que no tiene coincidencias
    Y se muestra el mensaje "No encontramos resultados para atender"
    Entonces se guarda en Amplitude el evento "FILTER_NO_RESULTS"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el rol del usuario
    Y se registra el filtro aplicado que no retornó resultados
    Y se registra la fecha y hora del evento

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: ANLT-21 - Registrar evento cuando ocurre error general al cargar lista
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y me encuentro en la sección de Lista de encuentros
    Cuando ocurre un error en el sistema al obtener los encuentros
    Y se muestra el mensaje "Hubo un inconveniente"
    Entonces se guarda en Amplitude el evento "ERROR_LOAD_LIST"
    Y se registra el nombre y apellido del usuario
    Y se registra el usuario
    Y se registra el rol del usuario
    Y se registra el código de error
    Y se registra el mensaje de error mostrado al usuario
    Y se registra la fecha y hora del evento

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PRIVACIDAD - DATOS SENSIBLES
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: ANLT-22 - Validar que NO se registran datos sensibles de pacientes
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y me encuentro en la sección de Lista de encuentros
    Cuando realizo cualquier acción que genera un evento
    Entonces los eventos NO deben incluir:
      | Dato Sensible          |
      | Nombres de pacientes   |
      | Apellidos de pacientes |
      | NHC                    |
      | Datos médicos          |
      | Diagnósticos           |
    Y solo deben registrarse metadatos de la acción y usuario
    Y deben cumplir con políticas de privacidad y GDPR
