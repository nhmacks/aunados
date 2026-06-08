# language: es

Característica: Permisos y Control de Acceso en Lista de Encuentros
  Como administrador del sistema AUNADOS
  Quiero que los permisos se apliquen correctamente según el rol del usuario
  Para garantizar la seguridad y el acceso controlado a la información

  Antecedentes:
    Dado que existen encuentros clasificados para Admisión en el sistema
    Y el Job de Admisión ha ejecutado correctamente

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - ACCESO A FUNCIONALIDADES POR ROL
  # Cobertura: RN28, RN29, RN30, RN31, RN32, RN81, RN82, RN83, RN84
  # Sección 4, 5, 6 del documento 04-Roles.md
  # ========================================================================

  @superusuarioAdmision
  Escenario: PERM-01 - Superusuario tiene acceso a Cuadro de Control
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces debo visualizar la opción "Cuadro de Control"
    Y debo poder acceder a "Cuadro de Control"

  @gestorTA
  Escenario: PERM-02 - Gestor TA tiene acceso a Cuadro de Control
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces debo visualizar la opción "Cuadro de Control"
    Y debo poder acceder a "Cuadro de Control"

  @ejecutivoAdmision
  Escenario: PERM-03 - Ejecutivo NO tiene acceso a Cuadro de Control
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces NO debo visualizar la opción "Cuadro de Control"
    Y NO debo poder acceder a "Cuadro de Control"

  @ejecutivoAdmision
  Escenario: PERM-04 - Ejecutivo tiene acceso a Cambio de Beneficio
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces debo visualizar la opción "Cambio de Beneficio"
    Y debo poder acceder a "Cambio de Beneficio"

  @superusuarioAdmision @gestorTA
  Escenario: PERM-05 - Superusuario y Gestor NO tienen acceso a Cambio de Beneficio
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces NO debo visualizar la opción "Cambio de Beneficio"
    Y NO debo poder acceder a "Cambio de Beneficio"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: PERM-06 - Todos los roles tienen acceso a Encuentros Devueltos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al menú principal
    Entonces debo visualizar la opción "Encuentros Devueltos"
    Y debo poder acceder a "Encuentros Devueltos"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: PERM-07 - Todos los roles tienen acceso a Lista de Encuentros
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Cuando inicio sesión correctamente
    Entonces el sistema debe mostrar la pantalla "Lista de Encuentros" automáticamente
    Y debo poder acceder a la funcionalidad completa

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - PERMISOS DE VISUALIZACIÓN DE COLUMNAS
  # Cobertura: Sección 4.4, 6.4 del documento 04-Roles.md
  # RN28, RN29, RN30, RN82
  # ========================================================================

  @superusuarioAdmision
  Escenario: PERM-08 - Superusuario visualiza todas las 15 columnas en la grilla
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando visualizo la grilla de encuentros
    Entonces debo visualizar exactamente 15 columnas
    Y debo visualizar las siguientes columnas en este orden:
      | Columna                     |
      | Sede                        |
      | Encuentro                   |
      | Estado                      |
      | NHC                         |
      | Apellidos                   |
      | Nombres                     |
      | Fecha apert.                |
      | Prioridad                   |
      | Usuario                     |
      | Garante                     |
      | Tipo de Encuentro           |
      | Sustentos Administrativos   |
      | Sustentos Médicos           |
      | Sustentos de Proceso        |
      | Monto                       |

  @gestorTA
  Escenario: PERM-09 - Gestor TA visualiza todas las 15 columnas en la grilla
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a la Lista de Encuentros
    Cuando visualizo la grilla de encuentros
    Entonces debo visualizar exactamente 15 columnas
    Y debo visualizar las mismas columnas que el Superusuario de Admisión

  @ejecutivoAdmision
  Escenario: PERM-10 - Ejecutivo visualiza solo 9 columnas limitadas en la grilla
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando visualizo la grilla de encuentros
    Entonces debo visualizar exactamente 9 columnas
    Y debo visualizar las siguientes columnas en este orden:
      | Columna           |
      | Encuentro         |
      | Estado            |
      | NHC               |
      | Apellidos         |
      | Nombres           |
      | Fecha apert.      |
      | Prioridad         |
      | Garante           |
      | Tipo de Encuentro |
    Y NO debo visualizar la columna "Sede"
    Y NO debo visualizar la columna "Usuario"
    Y NO debo visualizar la columna "Sustentos Administrativos"
    Y NO debo visualizar la columna "Sustentos Médicos"
    Y NO debo visualizar la columna "Sustentos de Proceso"
    Y NO debo visualizar la columna "Monto"

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - PERMISOS DE FILTROS POR ROL
  # Cobertura: Sección 4.5, 6.5 del documento 04-Roles.md
  # RN43, RN44, RN82, RN83
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Esquema del escenario: PERM-11 - Superusuario y Gestor tienen acceso a filtros completos
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la Lista de Encuentros
    Cuando intento aplicar el filtro "<filtro>"
    Entonces el filtro "<filtro>" debe estar disponible
    Y debo poder aplicar el filtro correctamente

    Ejemplos:
      | rol                        | filtro                      |
      | Superusuario de Admisión   | Sede                        |
      | Superusuario de Admisión   | Estado                      |
      | Superusuario de Admisión   | Fecha Apertura              |
      | Superusuario de Admisión   | Prioridad                   |
      | Superusuario de Admisión   | Usuario                     |
      | Superusuario de Admisión   | Garante                     |
      | Superusuario de Admisión   | Tipo de Encuentro           |
      | Superusuario de Admisión   | Sustentos Administrativos   |
      | Superusuario de Admisión   | Sustentos Médicos           |
      | Gestor TA                | Sede                        |
      | Gestor TA                | Usuario                     |

  @ejecutivoAdmision
  Esquema del escenario: PERM-12 - Ejecutivo tiene acceso solo a filtros limitados
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando intento aplicar el filtro "<filtro>"
    Entonces el filtro "<filtro>" debe estar disponible
    Y debo poder aplicar el filtro correctamente

    Ejemplos:
      | filtro            |
      | Estado            |
      | Fecha Apertura    |
      | Prioridad         |
      | Garante           |
      | Tipo de Encuentro |

  @ejecutivoAdmision
  Esquema del escenario: PERM-13 - Ejecutivo NO tiene acceso a filtros restringidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando visualizo los filtros disponibles
    Entonces el filtro "<filtro_restringido>" NO debe estar disponible
    Y NO debo poder aplicar el filtro "<filtro_restringido>"

    Ejemplos:
      | filtro_restringido        |
      | Sede                      |
      | Usuario                   |
      | Sustentos Administrativos |
      | Sustentos Médicos         |

  # ========================================================================
  # TÉCNICA: PRUEBAS NEGATIVAS - PERMISOS DE ORDENAMIENTO
  # Cobertura: Sección 4.6, 6.6 del documento 04-Roles.md
  # RN54, RN55, RN83
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Esquema del escenario: PERM-14 - Superusuario y Gestor pueden ordenar columnas permitidas
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la Lista de Encuentros
    Cuando hago clic en el encabezado de la columna "<columna>"
    Entonces la columna "<columna>" debe permitir ordenamiento
    Y los registros deben ordenarse ascendentemente
    Y el indicador de ordenamiento debe mostrarse en la columna

    Ejemplos:
      | rol                      | columna           |
      | Superusuario de Admisión | Encuentro         |
      | Superusuario de Admisión | NHC               |
      | Superusuario de Admisión | Apellidos         |
      | Superusuario de Admisión | Nombres           |
      | Superusuario de Admisión | Fecha apert.      |
      | Superusuario de Admisión | Usuario           |
      | Superusuario de Admisión | Garante           |
      | Superusuario de Admisión | Tipo de Encuentro |
      | Superusuario de Admisión | Monto             |
      | Gestor TA              | Encuentro         |
      | Gestor TA              | Monto             |

  @ejecutivoAdmision
  Esquema del escenario: PERM-15 - Ejecutivo NO puede ordenar ninguna columna
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando visualizo el encabezado de la columna "<columna>"
    Entonces la columna "<columna>" NO debe tener funcionalidad de ordenamiento
    Y NO debe mostrarse el indicador de ordenamiento
    Y al hacer clic en el encabezado NO debe ordenarse

    Ejemplos:
      | columna           |
      | Encuentro         |
      | NHC               |
      | Apellidos         |
      | Nombres           |
      | Fecha apert.      |
      | Garante           |
      | Tipo de Encuentro |

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - PERMISOS DE EXPORTACIÓN
  # Cobertura: Sección 4.7, 6.7 del documento 04-Roles.md
  # RN68, RN69, RN70, RN71, RN72, RN73
  # ========================================================================

  @superusuarioAdmision
  Escenario: PERM-16 - Superusuario tiene exportación inmediata
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido a la Lista de Encuentros
    Y existen 100 encuentros visibles
    Cuando selecciono la opción "Exportar"
    Entonces el sistema debe generar el archivo inmediatamente
    Y el archivo debe descargarse automáticamente
    Y NO debe generarse notificación en la campana
    Y el archivo debe contener todos los registros visibles

  @gestorTA
  Escenario: PERM-17 - Gestor TA tiene exportación inmediata
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a la Lista de Encuentros
    Y existen 150 encuentros visibles
    Cuando selecciono la opción "Exportar"
    Entonces el sistema debe generar el archivo inmediatamente
    Y el archivo debe descargarse automáticamente
    Y NO debe generarse notificación en la campana
    Y el archivo debe contener todos los registros visibles

  @ejecutivoAdmision
  Escenario: PERM-18 - Ejecutivo tiene exportación asíncrona
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Y existen 80 encuentros visibles creados por mí
    Cuando selecciono la opción "Exportar"
    Entonces el sistema debe mostrar el mensaje "Tu reporte se está generando"
    Y el archivo NO debe descargarse inmediatamente
    Y debe generarse una notificación en la campana cuando esté listo
    Y debo poder descargar el archivo desde la campana
    Y el archivo debe tener vigencia de una hora

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - PERMISOS DE CAMBIO DE ESTADO
  # Cobertura: Sección 4.9, 6.9 del documento 04-Roles.md
  # RN62, RN63, RN83
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Esquema del escenario: PERM-19 - Superusuario y Gestor pueden asignar todos los estados
    Dado que soy un usuario con rol "<rol>"
    Y he accedido al detalle de un encuentro con estado "Pendiente"
    Cuando intento cambiar el estado a "<nuevo_estado>"
    Entonces el estado "<nuevo_estado>" debe estar disponible
    Y debo poder asignar el estado correctamente
    Y el sistema debe solicitar confirmación

    Ejemplos:
      | rol                      | nuevo_estado                  |
      | Superusuario de Admisión | Pago por Adelantado           |
      | Superusuario de Admisión | No Facturable                 |
      | Superusuario de Admisión | Derivado a Dirección Médica   |
      | Superusuario de Admisión | Derivado a Supervisor         |
      | Superusuario de Admisión | Error de Vinculación          |
      | Superusuario de Admisión | Pendiente de Revisión         |
      | Superusuario de Admisión | Terapia de Proceso            |
      | Superusuario de Admisión | En Proceso                    |
      | Superusuario de Admisión | Error de Facturación          |
      | Superusuario de Admisión | Tramitado                     |
      | Gestor TA              | Pago por Adelantado           |
      | Gestor TA              | No Facturable                 |
      | Gestor TA              | Error de Facturación          |

  @ejecutivoAdmision
  Esquema del escenario: PERM-20 - Ejecutivo puede asignar solo estados permitidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle de un encuentro con estado "Pendiente"
    Cuando intento cambiar el estado a "<estado_permitido>"
    Entonces el estado "<estado_permitido>" debe estar disponible
    Y debo poder asignar el estado correctamente
    Y el sistema debe solicitar confirmación

    Ejemplos:
      | estado_permitido                |
      | Pago por Adelantado             |
      | Derivado a Dirección Médica     |
      | Derivado a Supervisor           |
      | Error de Vinculación            |
      | Pendiente de Revisión           |
      | Terapia de Proceso              |
      | Tramitado                       |

  @ejecutivoAdmision
  Esquema del escenario: PERM-21 - Ejecutivo NO puede asignar estados restringidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle de un encuentro con estado "Pendiente"
    Cuando visualizo los estados disponibles
    Entonces el estado "<estado_restringido>" NO debe estar disponible
    Y NO debo poder asignar el estado "<estado_restringido>"

    Ejemplos:
      | estado_restringido    |
      | No Facturable         |
      | En Proceso            |
      | Error de Facturación  |

  # ========================================================================
  # TÉCNICA: VALORES LÍMITE - RESTRICCIONES DE VISIBILIDAD POR ROL
  # Cobertura: Sección 6.3 del documento 04-Roles.md
  # RN30, RN31, RN32, RN84
  # ========================================================================

  @ejecutivoAdmision
  Escenario: PERM-22 - Ejecutivo solo visualiza encuentros creados por él mismo en su sede
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01" asignado a la sede "Auna Guardia Civil"
    Y existen los siguientes encuentros clasificados para Admisión:
      | Encuentro | Usuario      | Sede               | Bandeja    |
      | 11111111  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 22222222  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 33333333  | ejecutivo02  | Auna Guardia Civil | Admisión   |
      | 44444444  | ejecutivo01  | Auna Cañete        | Admisión   |
      | 55555555  | ejecutivo01  | Auna Guardia Civil | Protocolo  |
    Cuando accedo a la Lista de Encuentros
    Entonces debo visualizar exactamente 2 encuentros
    Y debo visualizar el encuentro "11111111"
    Y debo visualizar el encuentro "22222222"
    Y NO debo visualizar el encuentro "33333333"
    Y NO debo visualizar el encuentro "44444444"
    Y NO debo visualizar el encuentro "55555555"

  @ejecutivoAdmision
  Escenario: PERM-23 - Ejecutivo visualiza lista vacía cuando no tiene encuentros propios
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01" asignado a la sede "Auna Guardia Civil"
    Y existen 100 encuentros clasificados para Admisión
    Y ningún encuentro fue creado por "ejecutivo01"
    Cuando accedo a la Lista de Encuentros
    Entonces debe mostrarse el mensaje de error funcional
    Y NO debo visualizar ningún encuentro en la grilla
    Y el contador debe mostrar "0 registros encontrados"

  @superusuarioAdmision @gestorTA
  Escenario: PERM-24 - Superusuario y Gestor visualizan todos los encuentros de todas las sedes
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen los siguientes encuentros clasificados para Admisión:
      | Encuentro | Usuario      | Sede               | Bandeja    |
      | 11111111  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 22222222  | ejecutivo02  | Auna Cañete        | Admisión   |
      | 33333333  | ejecutivo03  | Auna San Borja     | Admisión   |
      | 44444444  | ejecutivo04  | Auna Lima Este     | Admisión   |
    Cuando accedo a la Lista de Encuentros
    Entonces debo visualizar exactamente 4 encuentros
    Y debo visualizar encuentros de todas las sedes
    Y debo visualizar encuentros de todos los usuarios

  # ========================================================================
  # TÉCNICA: PRUEBAS BASADAS EN RIESGO - VALIDACIÓN DE SEGURIDAD
  # Cobertura: Principios PR01, PR02, PR03, PR04 del documento 04-Roles.md
  # RN81, RN82, RN83, RN84
  # ========================================================================

  @ejecutivoAdmision
  Escenario: PERM-25 - Ejecutivo NO puede acceder a encuentros de otros ejecutivos mediante URL directa
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01"
    Y existe un encuentro "12345678" creado por "ejecutivo02"
    Cuando intento acceder directamente al detalle del encuentro "12345678" mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe mostrarse el mensaje "No tienes permisos para visualizar este encuentro"
    Y debe redirigirme a la Lista de Encuentros

  @ejecutivoAdmision
  Escenario: PERM-26 - Ejecutivo NO puede exportar encuentros de otras sedes mediante manipulación de parámetros
    Dado que soy un usuario con rol "Ejecutivo de Admisión" asignado a la sede "Auna Guardia Civil"
    Y existen encuentros en la sede "Auna Cañete"
    Cuando intento exportar manipulando el parámetro de sede a "Auna Cañete"
    Entonces el sistema debe denegar la operación
    Y solo debe exportar encuentros de "Auna Guardia Civil"
    Y solo debe exportar encuentros creados por mí

  @ejecutivoAdmision
  Escenario: PERM-27 - Ejecutivo NO puede ordenar encuentros mediante manipulación de API
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a la Lista de Encuentros
    Cuando intento ejecutar una llamada API de ordenamiento
    Entonces el sistema debe denegar la operación
    Y debe retornar error de permisos insuficientes
    Y los encuentros deben mantenerse en orden por defecto

  @superusuarioAdmision @gestorTA
  Escenario: PERM-28 - Superusuario NO puede acceder a funcionalidades de Facturación
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando intento acceder a funcionalidades de Facturación
    Entonces NO debo visualizar "Asignaciones Masivas"
    Y NO debo visualizar "Pendientes por Facturar"
    Y NO debo poder acceder a la bandeja de Facturación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO - PERMISOS Y AUTENTICACIÓN
  # Cobertura: RN04, RN81, RN82, RN83, RN84
  # Consideraciones CI04, CI05 del documento 04-Roles.md
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: PERM-29 - Validar que todo acceso requiere autenticación previa
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder directamente a la Lista de Encuentros mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe redirigirme a la pantalla de login
    Y NO debe mostrar ninguna información de encuentros

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: PERM-30 - Validar que la información visible depende del rol autenticado
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión correctamente
    Y existen encuentros clasificados para Admisión
    Cuando accedo a la Lista de Encuentros
    Entonces debo visualizar "<cantidad_columnas>" columnas
    Y debo visualizar únicamente información autorizada para "<rol>"
    Y debo tener acceso únicamente a acciones autorizadas para "<rol>"

    Ejemplos:
      | rol                      | cantidad_columnas |
      | Superusuario de Admisión | 15                |
      | Gestor TA              | 15                |
      | Ejecutivo de Admisión    | 9                 |

  @ejecutivoAdmision
  Escenario: PERM-31 - Validar que los filtros respetan las restricciones del rol
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Cuando visualizo los resultados filtrados
    Entonces todos los encuentros mostrados deben cumplir:
      | Condición                           |
      | Fueron creados por mí               |
      | Pertenecen a mi sede                |
      | Están clasificados para Admisión    |
      | Tienen estado "Pendiente"           |

  @superusuarioAdmision @gestorTA
  Escenario: PERM-32 - Validar que la exportación respeta las restricciones del rol
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros de múltiples sedes y usuarios
    Y he aplicado filtros que retornan 50 encuentros
    Cuando exporto los resultados
    Entonces el archivo descargado debe contener exactamente 50 registros
    Y todos los registros deben corresponder a los filtros aplicados
    Y el archivo debe incluir las 14 columnas autorizadas para mi rol
    Y el archivo debe respetar las restricciones de visibilidad de mi rol

  @ejecutivoAdmision
  Escenario: PERM-33 - Validar que el Ejecutivo no puede visualizar columnas restringidas en exportación
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una exportación asíncrona
    Y el archivo ha sido generado
    Cuando descargo el archivo desde la campana
    Entonces el archivo debe contener exactamente 9 columnas
    Y el archivo NO debe incluir la columna "Sede"
    Y el archivo NO debe incluir la columna "Usuario"
    Y el archivo NO debe incluir la columna "Sustentos Administrativos"
    Y el archivo NO debe incluir la columna "Sustentos Médicos"
    Y el archivo NO debe incluir la columna "Sustentos de Proceso"
    Y el archivo NO debe incluir la columna "Monto"

  # ========================================================================
  # TÉCNICA: PAIRWISE - COMBINACIONES DE ROL + FUNCIONALIDAD + RESTRICCIÓN
  # Cobertura: Tabla comparativa 9.1 del documento 04-Roles.md
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: PERM-34 - Validar matriz de permisos rol vs funcionalidad
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Cuando evalúo el permiso para "<funcionalidad>"
    Entonces el acceso debe ser "<acceso_permitido>"

    Ejemplos:
      | rol                      | funcionalidad           | acceso_permitido |
      | Superusuario de Admisión | Cuadro de Control       | Sí               |
      | Superusuario de Admisión | Cambio de Beneficio     | No               |
      | Superusuario de Admisión | Ordenamiento            | Sí               |
      | Superusuario de Admisión | Ver todas las sedes     | Sí               |
      | Gestor TA              | Cuadro de Control       | Sí               |
      | Gestor TA              | Cambio de Beneficio     | No               |
      | Gestor TA              | Ordenamiento            | Sí               |
      | Gestor TA              | Ver todas las sedes     | Sí               |
      | Ejecutivo de Admisión    | Cuadro de Control       | No               |
      | Ejecutivo de Admisión    | Cambio de Beneficio     | Sí               |
      | Ejecutivo de Admisión    | Ordenamiento            | No               |
      | Ejecutivo de Admisión    | Ver todas las sedes     | No               |
