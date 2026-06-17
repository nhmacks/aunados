# language: es

Característica: Permisos de Acceso a PxF Ambulatorio
  Como sistema AUNADOS
  Quiero controlar el acceso a PxF Ambulatorio
  Para que solo el Gestor TA pueda visualizar las métricas agregadas

  # ========================================================================
  # TÉCNICA: CONTROL DE ACCESO - GESTOR TA
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: PERM-01 - Gestor TA puede acceder a PxF Ambulatorio
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Cuando accedo a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe mostrar la pantalla "PxF Ambulatorio"
    Y debe mostrarse el título "PxF Ambulatorio"
    Y debo poder visualizar las métricas agregadas
    Y debo poder visualizar las tablas de Protocolo, Admisión y Facturación

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: PERM-02 - Gestor TA puede ver todas las sedes en PxF Ambulatorio
    Dado que he iniciado sesión como "Gestor TA"
    Cuando accedo a "PxF Ambulatorio"
    Entonces debo poder visualizar datos de todas las sedes
    Y el filtro "Sede" debe mostrar todas las sedes disponibles
    Y no debo tener restricciones por sede

  # ========================================================================
  # TÉCNICA: RESTRICCIÓN DE ACCESO - OTROS ROLES
  # ========================================================================

  @responsableFacturacion @pxfAmbulatorio @unhappyPath
  Escenario: PERM-03 - Responsable de Facturación NO puede acceder a PxF Ambulatorio
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Cuando intento acceder a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a mi pantalla principal

  @ejecutivoFacturacion @pxfAmbulatorio @unhappyPath
  Escenario: PERM-04 - Ejecutivo de Facturación NO puede acceder a PxF Ambulatorio
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento acceder a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a "Pendientes por Facturar"

  @superusuarioAdmision @pxfAmbulatorio @unhappyPath
  Escenario: PERM-05 - Superusuario de Admisión NO puede acceder a PxF Ambulatorio
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando intento acceder a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a mi pantalla principal

  @ejecutivoAdmision @pxfAmbulatorio @unhappyPath
  Escenario: PERM-06 - Ejecutivo de Admisión NO puede acceder a PxF Ambulatorio
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando intento acceder a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a mi pantalla principal

  # ========================================================================
  # TÉCNICA: ACCESO SIN AUTENTICACIÓN
  # ========================================================================

  @pxfAmbulatorio @unhappyPath
  Escenario: PERM-07 - Usuario no autenticado no puede acceder a PxF Ambulatorio
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder a la URL "/insurances-billing/ambulatory-pxf"
    Entonces el sistema debe redirigirme a la página de login
    Y debe mostrarse el mensaje "Debe iniciar sesión para continuar"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE NAVEGACIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: PERM-08 - PxF Ambulatorio aparece en el menú del Gestor TA
    Dado que he iniciado sesión como "Gestor TA"
    Cuando visualizo el menú de navegación
    Entonces debe mostrarse la opción "PxF Ambulatorio" en la sección Facturación
    Y debo poder hacer clic en la opción para acceder

  @responsableFacturacion @pxfAmbulatorio @unhappyPath
  Escenario: PERM-09 - PxF Ambulatorio NO aparece en el menú de Responsable de Facturación
    Dado que he iniciado sesión como "Responsable de Facturación"
    Cuando visualizo el menú de navegación
    Entonces NO debe mostrarse la opción "PxF Ambulatorio"
    Y solo debo ver opciones permitidas para mi rol

  @ejecutivoFacturacion @pxfAmbulatorio @unhappyPath
  Escenario: PERM-10 - PxF Ambulatorio NO aparece en el menú de Ejecutivo de Facturación
    Dado que he iniciado sesión como "Ejecutivo de Facturación"
    Cuando visualizo el menú de navegación
    Entonces NO debe mostrarse la opción "PxF Ambulatorio"
    Y solo debo ver "Pendientes por Facturar" en mi menú
