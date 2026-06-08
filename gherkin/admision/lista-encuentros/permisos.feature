# language: es

Característica: Permisos y Control de Acceso en Lista de Encuentros
  Como administrador del sistema AUNADOS
  Quiero que los permisos se apliquen correctamente según el rol del usuario
  Para garantizar la seguridad y el acceso controlado a la información

  # ========================================================================
  # AUTENTICACIÓN
  # ========================================================================

  Escenario: Intentar acceder al sistema con un usuario inválido
    Dado que el usuario se encuentra en la pantalla de inicio de sesión de AUNADOS
    Cuando ingresa un nombre de usuario inválido
    Y una contraseña válida
    Y selecciona la opción "Iniciar sesión"
    Entonces el sistema rechazará la autenticación
    Y mostrará el mensaje "Usuario o contraseña incorrectos"
    Y permanecerá en la pantalla de inicio de sesión

  Escenario: Intentar acceder al sistema con un usuario inexistente
    Dado que el usuario se encuentra en la pantalla de inicio de sesión de AUNADOS
    Cuando ingresa un usuario que no existe en el sistema
    Y una contraseña cualquiera
    Y selecciona la opción "Iniciar sesión"
    Entonces el sistema rechazará la autenticación
    Y mostrará un mensaje indicando que las credenciales son inválidas

  Escenario: Intentar acceder al sistema con contraseña incorrecta
    Dado que el usuario se encuentra en la pantalla de inicio de sesión de AUNADOS
    Cuando ingresa un usuario válido
    Y una contraseña incorrecta
    Y selecciona la opción "Iniciar sesión"
    Entonces el sistema rechazará la autenticación
    Y mostrará un mensaje indicando que las credenciales son inválidas

  Escenario: Intentar acceder al sistema con un usuario bloqueado
    Dado que existe un usuario bloqueado en el sistema
    Cuando ingresa sus credenciales válidas
    Y selecciona la opción "Iniciar sesión"
    Entonces el sistema rechazará la autenticación
    Y mostrará un mensaje indicando que la cuenta se encuentra bloqueada

  # ========================================================================
  # MENÚS POR ROL
  # ========================================================================

  Escenario: Visualizar menús accesibles para el usuario con rol Gestor TA
    Dado que el usuario con rol "Gestor TA" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Gestor TA"
    Y visualizará los siguientes submódulos:
      | PxF Ambulatorio                      |
      | Admisión - Lista de encuentros       |
      | Admisión - Encuentros devueltos      |
      | Admisión - Cuadro de control         |
      | Facturación - Encuentros por asignar |
      | Facturación - Cuadro de control      |
      | Encuentros en protocolo              |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Superusuario Admisión
    Dado que el usuario con rol "Superusuario Admisión" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Superusuario Admisión"
    Y visualizará los siguientes submódulos:
      | Cuadro de control    |
      | Encuentros devueltos |
      | Lista de encuentros  |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Ejecutivo de Admisión
    Dado que el usuario con rol "Ejecutivo de Admisión" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Admisión"
    Y visualizará los siguientes submódulos:
      | Encuentros devueltos |
      | Lista de encuentros  |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Responsable de Facturación
    Dado que el usuario con rol "Responsable de Facturación" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Resp. Facturación"
    Y visualizará los siguientes submódulos:
      | Asignaciones        |
      | Lista de encuentros |
      | Cuadro de control   |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Ejecutivo de Facturación
    Dado que el usuario con rol "Ejecutivo de Facturación" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Facturación"
    Y visualizará los siguientes submódulos:
      | Pendientes por facturar |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Gestor de Sustentos Médicos
    Dado que el usuario con rol "Gestor de Sustentos Médicos" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Gestor de sustentos médicos"
    Y visualizará los siguientes submódulos:
      | Pendiente de sustento |
    Y no visualizará submódulos adicionales

  Escenario: Visualizar menús accesibles para el usuario con rol Ejecutivo de Admisión de Servicios
    Dado que el usuario con rol "Ejecutivo de Admisión de Servicios" ingresa al sistema AUNADOS
    Cuando visualiza el menú lateral de navegación
    Entonces visualizará el menú principal "Admisión de servicios"
    Y visualizará los siguientes submódulos:
      | Encuentro por servicios |
    Y no visualizará submódulos adicionales
