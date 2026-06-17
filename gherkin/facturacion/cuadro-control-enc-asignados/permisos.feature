# language: es

Característica: Permisos de Acceso al Cuadro de Control - Encuentros Asignados
  Como sistema AUNADOS
  Quiero controlar el acceso al Cuadro de Control de Encuentros Asignados
  Para garantizar que solo usuarios autorizados puedan visualizar la información

  # ========================================================================
  # TÉCNICA: ACCESO AUTORIZADO - RESPONSABLE DE FACTURACIÓN Y GESTOR TA
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: PERM-01 - Responsable de Facturación y Gestor TA pueden acceder al Cuadro de Control
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Cuando accedo al módulo de Facturación
    Entonces debo visualizar la opción "Cuadro de control - Enc. asignados" en el menú
    Y debo poder hacer clic en la opción
    Y la pantalla "Cuadro de control - Enc. asignados" debe cargarse correctamente
    Y debo poder visualizar todas las métricas y la grilla

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: PERM-02 - Responsable de Facturación y Gestor TA pueden utilizar todas las funcionalidades
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Entonces debo poder visualizar el gráfico circular completo
    Y debo poder visualizar las 7 tarjetas de métricas
    Y debo poder visualizar la grilla con 18 columnas
    Y debo poder aplicar filtros por Garante, Sede y Ejecutivo
    Y debo poder descargar la información
    Y debo poder restablecer la vista

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - EJECUTIVO DE FACTURACIÓN
  # ========================================================================

  @ejecutivoFacturacion @unhappyPath
  Escenario: PERM-03 - Ejecutivo de Facturación NO puede acceder al Cuadro de Control
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando accedo al módulo de Facturación
    Entonces NO debo visualizar la opción "Cuadro de control - Enc. asignados" en el menú
    Y NO debe aparecer ningún enlace a la funcionalidad
    Y NO debe ser posible acceder mediante navegación normal

  @ejecutivoFacturacion @unhappyPath
  Escenario: PERM-04 - Ejecutivo NO puede acceder mediante URL directa
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento acceder directamente a la URL "/facturacion/cuadro-control"
    Entonces debe mostrarse un mensaje "Acceso denegado"
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debo ser redirigido a mi pantalla de inicio
    Y NO debe cargarse la pantalla "Cuadro de control - Enc. asignados"

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - ROLES DE ADMISIÓN
  # ========================================================================

  @superusuarioAdmision @unhappyPath
  Escenario: PERM-05 - Superusuario de Admisión NO puede acceder al Cuadro de Control
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando navego por el sistema
    Entonces NO debo visualizar la opción "Cuadro de control - Enc. asignados"
    Y NO debo poder acceder a la funcionalidad
    Y si intento acceder por URL directa, debe denegarse el acceso

  @ejecutivoAdmision @unhappyPath
  Escenario: PERM-06 - Ejecutivo de Admisión NO puede acceder al Cuadro de Control
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando navego por el sistema
    Entonces NO debo visualizar la opción "Cuadro de control - Enc. asignados"
    Y NO debo poder acceder a la funcionalidad
    Y si intento acceder por URL directa, debe denegarse el acceso

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - USUARIOS NO AUTENTICADOS
  # ========================================================================

  @sinAutenticacion @unhappyPath
  Escenario: PERM-07 - Usuario no autenticado NO puede acceder
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder a la URL "/facturacion/cuadro-control"
    Entonces debe mostrarse la pantalla de inicio de sesión
    Y debe mostrarse un mensaje "Debe iniciar sesión para acceder"
    Y NO debe cargarse la funcionalidad
    Y debo ser redirigido al login

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS EN BACKEND
  # ========================================================================

  @responsableFacturacion @gestorTA @backend @happyPath
  Esquema del escenario: PERM-08 - Validar permisos en el backend para roles autorizados
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Cuando realizo una petición al endpoint "/api/facturacion/cuadro-control"
    Entonces el backend debe validar mi rol
    Y debe permitir la petición con código HTTP 200
    Y debe retornar los datos del cuadro de control

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @ejecutivoFacturacion @backend @unhappyPath
  Escenario: PERM-09 - Backend bloquea peticiones de Ejecutivo de Facturación
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando realizo una petición al endpoint "/api/facturacion/cuadro-control"
    Entonces el backend debe validar mi rol
    Y debe denegar la petición con código HTTP 403 (Forbidden)
    Y debe retornar un mensaje "Acceso denegado"
    Y NO debe retornar ningún dato del cuadro de control

  @superusuarioAdmision @backend @unhappyPath
  Escenario: PERM-10 - Backend bloquea peticiones de roles de Admisión
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando realizo una petición al endpoint "/api/facturacion/cuadro-control"
    Entonces el backend debe validar mi rol
    Y debe denegar la petición con código HTTP 403 (Forbidden)
    Y debe retornar un mensaje "Acceso denegado"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS DE EXPORTACIÓN
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: PERM-11 - Roles autorizados pueden descargar información
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Cuando selecciono el botón "Descargar"
    Entonces debe permitirse la descarga
    Y el archivo debe generarse correctamente
    Y NO debe mostrarse ningún mensaje de error de permisos

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @ejecutivoFacturacion @backend @unhappyPath
  Escenario: PERM-12 - Backend bloquea exportación de otros roles
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento realizar una petición al endpoint "/api/facturacion/cuadro-control/exportar"
    Entonces el backend debe denegar la petición con código HTTP 403
    Y NO debe generarse ningún archivo
    Y debe retornar un mensaje "No tiene permisos para exportar esta información"

  # ========================================================================
  # TÉCNICA: MENSAJES DE ERROR ESPECÍFICOS
  # ========================================================================

  @ejecutivoFacturacion @unhappyPath
  Escenario: PERM-13 - Validar mensaje de error específico para acceso denegado
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento acceder a la URL "/facturacion/cuadro-control"
    Entonces debe mostrarse un mensaje claro y específico:
      """
      Acceso Denegado
      No tiene permisos para acceder a la funcionalidad Cuadro de Control.
      Esta funcionalidad es exclusiva para usuarios con rol Responsable de Facturación y Gestor TA.
      """
    Y el mensaje debe ser fácilmente comprensible
    Y debe indicarse los roles requeridos

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SEGURIDAD
  # ========================================================================

  @seguridad @unhappyPath
  Escenario: PERM-14 - Validar que NO se exponen datos mediante URL manipulation
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento acceder mediante diferentes variaciones de URL:
      | URL                                        |
      | /facturacion/cuadro-control                |
      | /facturacion/cuadro-control/               |
      | /facturacion/cuadro-control?id=123         |
      | /facturacion/cuadro-control/../control     |
    Entonces todas las peticiones deben ser bloqueadas
    Y NO debe exponerse ningún dato del cuadro de control
    Y debe mostrarse "Acceso denegado" en todos los casos

  @seguridad @unhappyPath
  Escenario: PERM-15 - Validar que el token de sesión valida correctamente el rol
    Dado que un usuario tiene un token de sesión válido
    Y el token contiene el rol "Ejecutivo de Facturación"
    Cuando el usuario intenta acceder a "Cuadro de control - Enc. asignados"
    Entonces el sistema debe validar el rol desde el token
    Y debe denegar el acceso aunque la sesión sea válida
    Y debe registrar el intento de acceso no autorizado en logs

  # ========================================================================
  # TÉCNICA: EXCLUSIVIDAD DE ROLES AUTORIZADOS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: PERM-16 - Validar roles autorizados para acceder al Cuadro de Control
    Dado que existen los siguientes roles en el sistema:
      | Rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |
      | Ejecutivo de Facturación   |
      | Superusuario de Admisión   |
      | Ejecutivo de Admisión      |
    Cuando se validan permisos para "Cuadro de control - Enc. asignados"
    Entonces únicamente los roles "Responsable de Facturación" y "Gestor TA" deben tener acceso permitido
    Y todos los demás roles deben tener acceso denegado
    Y NO debe haber excepciones ni casos especiales

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FILTROS POR ROL
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: PERM-17 - Roles autorizados visualizan datos de todos los ejecutivos
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Y existen 135 ejecutivos de facturación en el sistema
    Cuando accedo a la pantalla "Cuadro de control - Enc. asignados"
    Entonces debe mostrarse información de TODOS los 135 ejecutivos
    Y NO debe haber restricciones por sede
    Y NO debe haber restricciones por garante
    Y debe poder visualizar y filtrar datos de cualquier ejecutivo

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE DATOS SENSIBLES
  # ========================================================================

  @responsableFacturacion @gestorTA @seguridad @happyPath
  Esquema del escenario: PERM-18 - Roles autorizados visualizan datos de desempeño de todos los ejecutivos
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol>"
    Cuando acceso a la pantalla "Cuadro de control - Enc. asignados"
    Entonces debo poder visualizar métricas de desempeño de cada ejecutivo
    Y debo poder ver montos facturados por cada ejecutivo
    Y debo poder ver porcentaje de pendientes de cada ejecutivo
    Y esta información NO debe estar disponible para ejecutivos de facturación
    Y esta información es exclusiva para propósitos de supervisión

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |
