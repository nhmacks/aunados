# language: es

Característica: Permisos y Control de Acceso en Encuentros Devueltos
  Como administrador del sistema AUNADOS
  Quiero que los permisos se apliquen correctamente en Encuentros Devueltos
  Para garantizar que cada usuario solo gestione encuentros de su responsabilidad

  Antecedentes:
    Dado que existen encuentros devueltos desde Facturación en el sistema

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACCESO POR ROL
  # Cobertura: Sección 3 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @superusuarioAdmision @encuentrosDevueltos @regresion
  Escenario: PERM-01 - Superusuario de Admisión puede acceder a Encuentros Devueltos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo poder acceder a la funcionalidad completa
    Y debo visualizar todos los encuentros devueltos sin restricciones

  @gestorTA @encuentrosDevueltos @regresion
  Escenario: PERM-02 - Gestor TA puede acceder a Encuentros Devueltos
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo poder acceder a la funcionalidad completa
    Y debo visualizar todos los encuentros devueltos sin restricciones

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: PERM-03 - Ejecutivo de Admisión puede acceder a Encuentros Devueltos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo poder acceder a la funcionalidad
    Y debo visualizar únicamente encuentros de mi responsabilidad

  @ejecutivoFacturacion @encuentrosDevueltos @unhappyPath
  Escenario: PERM-04 - Ejecutivo de Facturación NO puede acceder a Encuentros Devueltos de Admisión
    Dado que soy un usuario con rol "Ejecutivo de Facturación"
    Y he iniciado sesión en el sistema
    Cuando intento acceder a "Encuentros Devueltos"
    Entonces el sistema debe denegar el acceso
    Y debe mostrar mensaje "No tiene permisos para acceder a esta funcionalidad"

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE VISIBILIDAD POR ROL
  # Cobertura: Sección 5.2 del documento 18-Encuentros-Devueltos.md
  # RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: PERM-05 - Ejecutivo solo visualiza encuentros creados por él en su sede
    Dado que soy el ejecutivo "ejecutivo01" asignado a la sede "Auna Guardia Civil"
    Y existen 100 encuentros devueltos
    Y 20 encuentros fueron creados por "ejecutivo01" en la sede "Auna Guardia Civil"
    Y 30 encuentros fueron creados por "ejecutivo01" en otras sedes
    Y 50 encuentros fueron creados por otros usuarios en "Auna Guardia Civil"
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo visualizar únicamente 20 encuentros
    Y todos deben haber sido creados por "ejecutivo01"
    Y todos deben ser de la sede "Auna Guardia Civil"

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @regresion
  Escenario: PERM-06 - Superusuario y Gestor visualizan todos los encuentros sin restricciones
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen 100 encuentros devueltos de diferentes sedes y usuarios
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo visualizar los 100 encuentros
    Y debo visualizar encuentros de todas las sedes
    Y debo visualizar encuentros de todos los usuarios

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: PERM-07 - Ejecutivo NO puede acceder a encuentros de otros usuarios mediante URL
    Dado que soy el ejecutivo "ejecutivo01"
    Y existe el encuentro devuelto "12345678" creado por "ejecutivo02"
    Cuando intento acceder directamente al detalle del encuentro "12345678" mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe mostrarse el mensaje "No tienes permisos para visualizar este encuentro"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACCIONES PERMITIDAS POR ROL
  # Cobertura: Sección 6.3 del documento 18-Encuentros-Devueltos.md
  # RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: PERM-08 - Ejecutivo puede resolver sus propios encuentros devueltos
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo el encuentro devuelto "12345678" asignado a mí
    Cuando accedo al detalle del encuentro
    Entonces debo poder marcar el encuentro como "Resuelto"
    Y debo poder cambiar el estado del encuentro
    Y debo poder agregar observaciones

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: PERM-09 - Ejecutivo NO puede resolver encuentros de otros usuarios
    Dado que soy el ejecutivo "ejecutivo01"
    Y existe el encuentro devuelto "12345678" creado por "ejecutivo02"
    Cuando intento acceder al encuentro
    Entonces el sistema debe denegar el acceso
    Y NO debo poder marcar el encuentro como "Resuelto"

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: PERM-10 - Superusuario y Gestor pueden gestionar todos los encuentros
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros devueltos de diferentes usuarios
    Cuando accedo a cualquier encuentro devuelto
    Entonces debo poder gestionar el encuentro
    Y debo poder cambiar el estado
    Y debo poder resolver el encuentro
    Y debo poder escalarlo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FILTROS POR ROL
  # Cobertura: Sección 6.2 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: PERM-11 - Superusuario y Gestor tienen acceso a todos los filtros
    Dado que soy un usuario con rol "Gestor TA"
    Cuando visualizo los filtros disponibles
    Entonces debo visualizar el filtro "Sede"
    Y debo visualizar el filtro "Usuario Responsable"
    Y debo visualizar todos los filtros estándar

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: PERM-12 - Ejecutivo NO tiene acceso a filtros de Sede y Usuario
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando visualizo los filtros disponibles
    Entonces NO debo visualizar el filtro "Sede"
    Y NO debo visualizar el filtro "Usuario Responsable"
    Y solo debo visualizar filtros de: Estado, Prioridad, Motivo, Fecha

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: PERM-13 - Los filtros del Ejecutivo solo afectan sus propios encuentros
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo 50 encuentros devueltos asignados
    Y 20 de mis encuentros tienen estado "Devuelto"
    Y existen encuentros de otros usuarios con estado "Devuelto"
    Cuando aplico el filtro "Estado" = "Devuelto"
    Entonces debo visualizar exactamente 20 encuentros
    Y todos deben estar asignados a "ejecutivo01"
    Y todos deben tener estado "Devuelto"



  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SEGURIDAD
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: PERM-15 - Validar que todo acceso requiere autenticación previa
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder directamente a "Encuentros Devueltos" mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe redirigirme a la pantalla de login
    Y NO debe mostrar ninguna información de encuentros

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: PERM-16 - Ejecutivo NO puede manipular parámetros para ver otros encuentros
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros devueltos de "ejecutivo02"
    Cuando intento acceder manipulando parámetros de usuario en la URL
    Entonces el sistema debe denegar la operación
    Y solo debo visualizar mis propios encuentros
