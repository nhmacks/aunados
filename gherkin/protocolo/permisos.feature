# language: es

Característica: Permisos de Acceso a Encuentros en Protocolo
  Como sistema AUNADOS
  Quiero controlar el acceso a la funcionalidad Encuentros en Protocolo
  Para garantizar que solo usuarios autorizados puedan visualizar la información

  # ========================================================================
  # TÉCNICA: ACCESO AUTORIZADO - GESTOR TA
  # ========================================================================

  @gestorTA @happyPath
  Escenario: PERM-01 - Gestor TA puede acceder a Encuentros en Protocolo
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Cuando accedo al módulo de Admisión
    Entonces debo visualizar la opción "Encuentros en Protocolo" en el menú
    Y debo poder hacer clic en la opción
    Y la pantalla "Encuentros en Protocolo" debe cargarse correctamente
    Y debo poder visualizar todos los encuentros clasificados en protocolo

  @gestorTA @happyPath
  Escenario: PERM-02 - Gestor TA puede utilizar todas las funcionalidades
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a la pantalla "Encuentros en Protocolo"
    Entonces debo poder visualizar la grilla completa con 12 columnas
    Y debo poder realizar búsquedas
    Y debo poder aplicar filtros
    Y debo poder activar/desactivar el filtro "Solo Positivos"
    Y debo poder descargar la información
    Y debo poder restablecer la vista

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - SUPERUSUARIO DE ADMISIÓN
  # ========================================================================

  @superusuarioAdmision @unhappyPath
  Escenario: PERM-03 - Superusuario de Admisión NO puede acceder a Encuentros en Protocolo
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando accedo al módulo de Admisión
    Entonces NO debo visualizar la opción "Encuentros en Protocolo" en el menú
    Y NO debe aparecer ningún enlace a la funcionalidad
    Y NO debe ser posible acceder mediante navegación normal

  @superusuarioAdmision @unhappyPath
  Escenario: PERM-04 - Superusuario NO puede acceder mediante URL directa
    Dado que he iniciado sesión como "Superusuario de Admisión"
    Cuando intento acceder directamente a la URL "/admision/encuentros-protocolo"
    Entonces debe mostrarse un mensaje "Acceso denegado"
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debo ser redirigido a mi pantalla de inicio
    Y NO debe cargarse la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - EJECUTIVO DE ADMISIÓN
  # ========================================================================

  @ejecutivoAdmision @unhappyPath
  Escenario: PERM-05 - Ejecutivo de Admisión NO puede acceder a Encuentros en Protocolo
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando accedo al módulo de Admisión
    Entonces NO debo visualizar la opción "Encuentros en Protocolo" en el menú
    Y NO debe aparecer ningún enlace a la funcionalidad
    Y NO debe ser posible acceder mediante navegación normal

  @ejecutivoAdmision @unhappyPath
  Escenario: PERM-06 - Ejecutivo NO puede acceder mediante URL directa
    Dado que he iniciado sesión como "Ejecutivo de Admisión"
    Cuando intento acceder directamente a la URL "/admision/encuentros-protocolo"
    Entonces debe mostrarse un mensaje "Acceso denegado"
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debo ser redirigido a mi pantalla de inicio
    Y NO debe cargarse la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - ROLES DE FACTURACIÓN
  # ========================================================================

  @responsableFacturacion @unhappyPath
  Escenario: PERM-07 - Responsable de Facturación NO puede acceder a Encuentros en Protocolo
    Dado que he iniciado sesión como "Responsable de Facturación"
    Cuando navego por el sistema
    Entonces NO debo visualizar la opción "Encuentros en Protocolo"
    Y NO debo poder acceder a la funcionalidad
    Y si intento acceder por URL directa, debe denegarse el acceso

  @ejecutivoFacturacion @unhappyPath
  Escenario: PERM-08 - Ejecutivo de Facturación NO puede acceder a Encuentros en Protocolo
    Dado que he iniciado sesión como "Ejecutivo de Facturación"
    Cuando navego por el sistema
    Entonces NO debo visualizar la opción "Encuentros en Protocolo"
    Y NO debo poder acceder a la funcionalidad
    Y si intento acceder por URL directa, debe denegarse el acceso

  # ========================================================================
  # TÉCNICA: ACCESO DENEGADO - USUARIOS NO AUTENTICADOS
  # ========================================================================

  @sinAutenticacion @unhappyPath
  Escenario: PERM-09 - Usuario no autenticado NO puede acceder
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder a la URL "/admision/encuentros-protocolo"
    Entonces debe mostrarse la pantalla de inicio de sesión
    Y debe mostrarse un mensaje "Debe iniciar sesión para acceder"
    Y NO debe cargarse la funcionalidad
    Y debo ser redirigido al login

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS EN BACKEND
  # ========================================================================

  @gestorTA @backend @happyPath
  Escenario: PERM-10 - Validar permisos en el backend para Gestor TA
    Dado que soy un usuario con rol "Gestor TA"
    Cuando realizo una petición al endpoint "/api/admision/encuentros-protocolo"
    Entonces el backend debe validar mi rol
    Y debe permitir la petición con código HTTP 200
    Y debe retornar los datos de encuentros en protocolo

  @superusuarioAdmision @backend @unhappyPath
  Escenario: PERM-11 - Backend bloquea peticiones de Superusuario de Admisión
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando realizo una petición al endpoint "/api/admision/encuentros-protocolo"
    Entonces el backend debe validar mi rol
    Y debe denegar la petición con código HTTP 403 (Forbidden)
    Y debe retornar un mensaje "Acceso denegado"
    Y NO debe retornar ningún dato de encuentros

  @ejecutivoAdmision @backend @unhappyPath
  Escenario: PERM-12 - Backend bloquea peticiones de Ejecutivo de Admisión
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando realizo una petición al endpoint "/api/admision/encuentros-protocolo"
    Entonces el backend debe validar mi rol
    Y debe denegar la petición con código HTTP 403 (Forbidden)
    Y debe retornar un mensaje "Acceso denegado"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS DE EXPORTACIÓN
  # ========================================================================

  @gestorTA @happyPath
  Escenario: PERM-13 - Gestor TA puede descargar información
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a la pantalla "Encuentros en Protocolo"
    Cuando selecciono el botón "Descargar"
    Entonces debe permitirse la descarga
    Y el archivo debe generarse correctamente
    Y NO debe mostrarse ningún mensaje de error de permisos

  @superusuarioAdmision @backend @unhappyPath
  Escenario: PERM-14 - Backend bloquea exportación de otros roles
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando intento realizar una petición al endpoint "/api/admision/encuentros-protocolo/exportar"
    Entonces el backend debe denegar la petición con código HTTP 403
    Y NO debe generarse ningún archivo
    Y debe retornar un mensaje "No tiene permisos para exportar esta información"

  # ========================================================================
  # TÉCNICA: MENSAJES DE ERROR ESPECÍFICOS
  # ========================================================================

  @superusuarioAdmision @unhappyPath
  Escenario: PERM-15 - Validar mensaje de error específico para acceso denegado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando intento acceder a la URL "/admision/encuentros-protocolo"
    Entonces debe mostrarse un mensaje claro y específico:
      """
      Acceso Denegado
      No tiene permisos para acceder a la funcionalidad Encuentros en Protocolo.
      Esta funcionalidad es exclusiva para usuarios con rol Gestor TA.
      """
    Y el mensaje debe ser fácilmente comprensible
    Y debe indicarse el rol requerido

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SEGURIDAD
  # ========================================================================

  @gestorTA @seguridad @unhappyPath
  Escenario: PERM-16 - Validar que NO se exponen datos mediante URL manipulation
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando intento acceder mediante diferentes variaciones de URL:
      | URL                                        |
      | /admision/encuentros-protocolo             |
      | /admision/encuentros-protocolo/            |
      | /admision/encuentros-protocolo?id=123      |
      | /admision/encuentros-protocolo/../protocolo|
    Entonces todas las peticiones deben ser bloqueadas
    Y NO debe exponerse ningún dato de encuentros en protocolo
    Y debe mostrarse "Acceso denegado" en todos los casos

  @seguridad @unhappyPath
  Escenario: PERM-17 - Validar que el token de sesión valida correctamente el rol
    Dado que un usuario tiene un token de sesión válido
    Y el token contiene el rol "Ejecutivo de Admisión"
    Cuando el usuario intenta acceder a "Encuentros en Protocolo"
    Entonces el sistema debe validar el rol desde el token
    Y debe denegar el acceso aunque la sesión sea válida
    Y debe registrar el intento de acceso no autorizado en logs

  # ========================================================================
  # TÉCNICA: AUDITORÍA DE ACCESOS
  # ========================================================================

  @gestorTA @auditoria @happyPath
  Escenario: PERM-18 - Registrar accesos autorizados en log de auditoría
    Dado que soy un usuario con rol "Gestor TA"
    Cuando accedo exitosamente a "Encuentros en Protocolo"
    Entonces debe registrarse en el log de auditoría:
      | Campo            | Valor                        |
      | usuario          | nombre del Gestor TA         |
      | rol              | Gestor TA                    |
      | acción           | Acceso a Encuentros Protocolo|
      | fecha_hora       | timestamp actual             |
      | resultado        | Exitoso                      |

  @superusuarioAdmision @auditoria @unhappyPath
  Escenario: PERM-19 - Registrar intentos de acceso denegado en log de auditoría
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando intento acceder a "Encuentros en Protocolo"
    Y el acceso es denegado
    Entonces debe registrarse en el log de auditoría:
      | Campo            | Valor                         |
      | usuario          | nombre del Superusuario       |
      | rol              | Superusuario de Admisión      |
      | acción           | Intento de acceso a Protocolo |
      | fecha_hora       | timestamp actual              |
      | resultado        | Denegado                      |
      | motivo           | Rol no autorizado             |

  # ========================================================================
  # TÉCNICA: EXCLUSIVIDAD DEL ROL
  # ========================================================================

  @gestorTA @happyPath
  Escenario: PERM-20 - Validar que Gestor TA es el ÚNICO rol con acceso
    Dado que existen los siguientes roles en el sistema:
      | Rol                        |
      | Gestor TA                  |
      | Superusuario de Admisión   |
      | Ejecutivo de Admisión      |
      | Responsable de Facturación |
      | Ejecutivo de Facturación   |
    Cuando se validan permisos para "Encuentros en Protocolo"
    Entonces únicamente el rol "Gestor TA" debe tener acceso permitido
    Y todos los demás roles deben tener acceso denegado
    Y NO debe haber excepciones ni casos especiales
