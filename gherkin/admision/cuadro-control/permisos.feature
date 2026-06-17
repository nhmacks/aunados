# language: es

Característica: Permisos de Acceso a Cuadro de Control Admisión
  Como sistema AUNADOS
  Quiero controlar el acceso al Cuadro de Control Admisión
  Para que solo Superusuario de Admisión y Gestor TA puedan visualizar las métricas

  # ========================================================================
  # TÉCNICA: CONTROL DE ACCESO - SUPERUSUARIO DE ADMISIÓN
  # ========================================================================

  @superusuarioAdmision @cuadroControlAdmision @happyPath
  Escenario: PERM-01 - Superusuario de Admisión puede acceder a Cuadro de Control Admisión
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando accedo a la URL "/insurances..."
    Entonces el sistema debe mostrar la pantalla "Cuadro de control Admisión"
    Y debe mostrarse el título "Cuadro de control Admisión"
    Y debo poder visualizar las 3 tarjetas de métricas
    Y debo poder visualizar las 4 tablas de información

  # ========================================================================
  # TÉCNICA: CONTROL DE ACCESO - GESTOR TA
  # ========================================================================

  @gestorTA @cuadroControlAdmision @happyPath
  Escenario: PERM-02 - Gestor TA puede acceder a Cuadro de Control Admisión
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Cuando accedo a "Cuadro de control Admisión"
    Entonces el sistema debe mostrar la pantalla completa
    Y debe mostrarse el título "Cuadro de control Admisión"
    Y debo poder visualizar las métricas agregadas
    Y debo poder visualizar todas las tablas

  @gestorTA @cuadroControlAdmision @happyPath
  Escenario: PERM-03 - Gestor TA puede ver todas las sedes y ejecutivos
    Dado que he iniciado sesión como "Gestor TA"
    Cuando accedo a "Cuadro de control Admisión"
    Entonces debo poder visualizar datos de todas las sedes
    Y debo poder visualizar datos de todos los ejecutivos de admisión
    Y no debo tener restricciones por sede ni ejecutivo

  # ========================================================================
  # TÉCNICA: RESTRICCIÓN DE ACCESO - OTROS ROLES
  # ========================================================================

  @responsableFacturacion @cuadroControlAdmision @unhappyPath
  Escenario: PERM-04 - Responsable de Facturación NO puede acceder
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a mi pantalla principal

  @ejecutivoFacturacion @cuadroControlAdmision @unhappyPath
  Escenario: PERM-05 - Ejecutivo de Facturación NO puede acceder
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"

  @ejecutivoAdmision @cuadroControlAdmision @unhappyPath
  Escenario: PERM-06 - Ejecutivo de Admisión NO puede acceder
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a "Lista de encuentros"

  # ========================================================================
  # TÉCNICA: ACCESO SIN AUTENTICACIÓN
  # ========================================================================

  @cuadroControlAdmision @unhappyPath
  Escenario: PERM-07 - Usuario no autenticado no puede acceder
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe redirigirme a la página de login
    Y debe mostrarse el mensaje "Debe iniciar sesión para continuar"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE NAVEGACIÓN EN MENÚ
  # ========================================================================

  @superusuarioAdmision @cuadroControlAdmision @happyPath
  Escenario: PERM-08 - Cuadro de control aparece en menú de Superusuario Admisión
    Dado que he iniciado sesión como "Superusuario de Admisión"
    Cuando visualizo el menú de navegación
    Entonces debe mostrarse la opción "Cuadro de control Admisión" en la sección Admisión
    Y debo poder hacer clic en la opción para acceder

  @gestorTA @cuadroControlAdmision @happyPath
  Escenario: PERM-09 - Cuadro de control aparece en menú de Gestor TA
    Dado que he iniciado sesión como "Gestor TA"
    Cuando visualizo el menú de navegación
    Entonces debe mostrarse la opción "Cuadro de control Admisión" en la sección Admisión
    Y debo poder hacer clic en la opción para acceder

  @ejecutivoAdmision @cuadroControlAdmision @unhappyPath
  Escenario: PERM-10 - Cuadro de control NO aparece en menú de Ejecutivo Admisión
    Dado que he iniciado sesión como "Ejecutivo de Admisión"
    Cuando visualizo el menú de navegación
    Entonces NO debe mostrarse la opción "Cuadro de control Admisión"
    Y solo debo ver "Lista de encuentros" en mi menú
