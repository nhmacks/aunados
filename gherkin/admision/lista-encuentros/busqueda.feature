# language: es

Característica: Búsqueda en Lista de Encuentros de Admisión
  Como usuario del sistema AUNADOS
  Quiero buscar encuentros por número de encuentro, nombres o apellidos
  Para localizar rápidamente un encuentro específico

  # ========================================================================
  # VALIDACIÓN DE MÍNIMO 3 CARACTERES (RN-LE-038)
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-01 - Mensaje "Mínimo 3 caracteres" aparece al ingresar el primer carácter
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la caja de búsqueda está vacía
    Cuando ingreso el primer carácter "J" en la caja de búsqueda
    Entonces el sistema debe mostrar debajo de la caja de texto el mensaje "Mínimo 3 caracteres"
    Y el mensaje debe permanecer visible

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-02 - Mensaje "Mínimo 3 caracteres" permanece visible con 2 caracteres
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la caja de búsqueda está vacía
    Cuando ingreso el primer carácter "J" en la caja de búsqueda
    Entonces el sistema debe mostrar el mensaje "Mínimo 3 caracteres"
    Cuando ingreso un segundo carácter "u"
    Entonces el mensaje "Mínimo 3 caracteres" debe permanecer visible
    Y el campo debe contener "Ju"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-03 - Mensaje "Mínimo 3 caracteres" desaparece al completar el tercer carácter (RN-LE-038)
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la caja de búsqueda está vacía
    Cuando ingreso el primer carácter "J" en la caja de búsqueda
    Entonces el sistema debe mostrar el mensaje "Mínimo 3 caracteres"
    Cuando ingreso un segundo carácter "u"
    Entonces el mensaje "Mínimo 3 caracteres" debe permanecer visible
    Cuando ingreso un tercer carácter "a"
    Entonces el mensaje "Mínimo 3 caracteres" debe desaparecer automáticamente
    Y el campo debe contener "Jua"
    Y NO debe mostrarse ningún mensaje de error

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-04 - Búsqueda se habilita al ingresar exactamente 3 caracteres
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "Mar" en la caja de búsqueda
    Entonces el mensaje "Mínimo 3 caracteres" NO debe mostrarse
    Y debo poder presionar la tecla Enter para ejecutar la búsqueda

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: BUS-05 - Búsqueda funciona correctamente con más de 3 caracteres
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "María" en la caja de búsqueda
    Entonces el mensaje "Mínimo 3 caracteres" NO debe mostrarse
    Y debo poder presionar la tecla Enter para ejecutar la búsqueda

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: BUS-06 - Borrar caracteres hasta tener menos de 3 vuelve a mostrar el mensaje
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he ingresado "Juan" en la caja de búsqueda
    Y el mensaje "Mínimo 3 caracteres" NO se muestra
    Cuando borro caracteres hasta dejar solo "Ju"
    Entonces el mensaje "Mínimo 3 caracteres" debe aparecer nuevamente

  # ========================================================================
  # VALIDACIÓN DE CARACTERES ESPECIALES (RN-LE-039)
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-07 - Mensaje aparece al ingresar carácter especial @ (RN-LE-039)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso el carácter especial "@" en la caja de búsqueda
    Entonces el sistema debe mostrar debajo de la caja de texto el mensaje "No se permiten caracteres especiales en la búsqueda."

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-08 - Mensaje aparece con múltiples caracteres especiales
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "Juan#123" en la caja de búsqueda
    Entonces el sistema debe mostrar el mensaje "No se permiten caracteres especiales en la búsqueda."
    Y el mensaje debe permanecer visible mientras exista el carácter especial "#"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-09 - Mensaje desaparece al eliminar todos los caracteres especiales (RN-LE-039)
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he ingresado "Juan#" en la caja de búsqueda
    Y el sistema muestra el mensaje "No se permiten caracteres especiales en la búsqueda."
    Cuando elimino el carácter especial "#"
    Y el campo contiene solo "Juan"
    Entonces el mensaje "No se permiten caracteres especiales en la búsqueda." debe desaparecer
    Y NO debe mostrarse ningún mensaje de error

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: BUS-10 - Validar diferentes caracteres especiales no permitidos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "Test<caracter_especial>" en la caja de búsqueda
    Entonces el sistema debe mostrar el mensaje "No se permiten caracteres especiales en la búsqueda."

    Ejemplos:
      | caracter_especial |
      | @                 |
      | #                 |
      | $                 |
      | %                 |
      | &                 |
      | *                 |
      | (                 |
      | )                 |
      | {                 |
      | }                 |
      | [                 |
      | ]                 |
      | <                 |
      | >                 |
      | /                 |
      | \                 |
      | |                 |

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-11 - Búsqueda NO se ejecuta mientras existan caracteres especiales
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he ingresado "Juan$" en la caja de búsqueda
    Y el sistema muestra el mensaje "No se permiten caracteres especiales en la búsqueda."
    Cuando presiono la tecla Enter
    Entonces la búsqueda NO debe ejecutarse
    Y el mensaje debe permanecer visible
    Y la grilla debe mantener su estado actual

  # ========================================================================
  # CARACTERES PERMITIDOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-12 - Letras mayúsculas y minúsculas son caracteres permitidos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "Juan Pérez" en la caja de búsqueda
    Entonces NO debe mostrarse el mensaje de caracteres especiales
    Y debo poder ejecutar la búsqueda presionando Enter

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-13 - Números son caracteres permitidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "12345678" en la caja de búsqueda
    Entonces NO debe mostrarse el mensaje de caracteres especiales
    Y debo poder ejecutar la búsqueda presionando Enter

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-14 - Espacios son caracteres permitidos
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "María José" en la caja de búsqueda
    Entonces NO debe mostrarse el mensaje de caracteres especiales
    Y debo poder ejecutar la búsqueda presionando Enter

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-15 - Caracteres con tilde son permitidos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "José García Álvarez" en la caja de búsqueda
    Entonces NO debe mostrarse el mensaje de caracteres especiales
    Y debo poder ejecutar la búsqueda presionando Enter

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-16 - Letra Ñ es un carácter permitido
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando ingreso "Muñoz" en la caja de búsqueda
    Entonces NO debe mostrarse el mensaje de caracteres especiales
    Y debo poder ejecutar la búsqueda presionando Enter

  # ========================================================================
  # BÚSQUEDA POR NÚMERO DE ENCUENTRO (RN-LE-005, RN-LE-006)
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-17 - Buscar por número de encuentro exacto
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres |
      | 12345678  | García    | Juan    |
      | 87654321  | Pérez     | María   |
    Cuando ingreso "12345678" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente el encuentro "12345678"
    Y NO debe mostrar el encuentro "87654321"
    Y el contador debe mostrar "1 registro encontrado"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-18 - Buscar por número de encuentro parcial (mínimo 3 dígitos)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres |
      | 12345678  | García    | Juan    |
      | 12398765  | Martínez  | Pedro   |
      | 87654321  | Pérez     | María   |
    Cuando ingreso "123" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar los encuentros "12345678" y "12398765"
    Y NO debe mostrar el encuentro "87654321"
    Y el contador debe mostrar "2 registros encontrados"

  # ========================================================================
  # BÚSQUEDA POR APELLIDOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-19 - Buscar por apellido completo
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres |
      | 12345678  | García    | Juan    |
      | 87654321  | Pérez     | María   |
      | 11223344  | García    | Pedro   |
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar los encuentros "12345678" y "11223344"
    Y NO debe mostrar el encuentro "87654321"
    Y el contador debe mostrar "2 registros encontrados"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-20 - Buscar por apellido parcial (mínimo 3 caracteres)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres |
      | 12345678  | García    | Juan    |
      | 87654321  | Gómez     | María   |
      | 11223344  | González  | Pedro   |
    Cuando ingreso "Gar" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente el encuentro "12345678"
    Y el contador debe mostrar "1 registro encontrado"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-21 - Búsqueda por apellido es case-insensitive
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existe un encuentro con apellido "García"
    Cuando ingreso "garcia" en minúsculas en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar el encuentro con apellido "García"
    Y la búsqueda debe ser insensible a mayúsculas y minúsculas

  # ========================================================================
  # BÚSQUEDA POR NOMBRES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-22 - Buscar por nombre completo
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres |
      | 12345678  | García    | Juan    |
      | 87654321  | Pérez     | María   |
      | 11223344  | López     | Juan    |
    Cuando ingreso "Juan" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar los encuentros "12345678" y "11223344"
    Y NO debe mostrar el encuentro "87654321"
    Y el contador debe mostrar "2 registros encontrados"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-23 - Buscar por nombre parcial (mínimo 3 caracteres)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Nombres     |
      | 12345678  | García    | María       |
      | 87654321  | Pérez     | Mariana     |
      | 11223344  | López     | Pedro       |
    Cuando ingreso "Mar" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar los encuentros "12345678" y "87654321"
    Y NO debe mostrar el encuentro "11223344"
    Y el contador debe mostrar "2 registros encontrados"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-24 - Buscar por nombres compuestos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existe un encuentro con nombres "María José"
    Cuando ingreso "María José" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar el encuentro con nombres "María José"

  # ========================================================================
  # BÚSQUEDA SIN RESULTADOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-25 - Mensaje cuando búsqueda no retorna resultados
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen encuentros en la lista
    Cuando ingreso "XYZ999" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces debe mostrarse el mensaje "No encontramos resultados por atender"
    Y debe mostrarse la descripción "Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro."
    Y la grilla debe estar vacía
    Y el contador debe mostrar "0 registros encontrados"

  # ========================================================================
  # INTERACCIÓN CON FILTROS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-26 - Búsqueda se combina con filtros activos
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y existen encuentros con apellido "García" en estados "Pendiente" y "Tramitado"
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente encuentros con apellido "García" y estado "Pendiente"
    Y NO debe mostrar encuentros con apellido "García" y estado "Tramitado"
    Y el filtro "Estado" debe permanecer activo

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: BUS-27 - Limpiar búsqueda mantiene filtros activos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y he realizado una búsqueda por "García"
    Cuando limpio la caja de búsqueda
    Y presiono la tecla Enter
    Entonces el filtro "Estado" debe permanecer activo
    Y la grilla debe mostrar todos los encuentros con estado "Pendiente"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-28 - Restablecer Vista elimina búsqueda y filtros
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y he realizado una búsqueda por "García"
    Cuando presiono el botón "Restablecer Vista"
    Entonces la búsqueda debe eliminarse
    Y el filtro "Estado" debe eliminarse
    Y la grilla debe mostrar todos los encuentros disponibles para mi rol

  # ========================================================================
  # RESTRICCIONES POR ROL
  # ========================================================================

  @prioridadMedia @ejecutivoAdmision @happyPath
  Escenario: BUS-29 - Ejecutivo solo busca en encuentros de su sede y usuario
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01"
    Y estoy asignado a la sede "Auna Guardia Civil"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Usuario      | Sede               |
      | 12345678  | García    | ejecutivo01  | Auna Guardia Civil |
      | 87654321  | García    | ejecutivo02  | Auna Guardia Civil |
      | 11223344  | García    | ejecutivo01  | Auna Cañete        |
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces debo visualizar únicamente el encuentro "12345678"
    Y NO debo visualizar el encuentro "87654321" (diferente usuario)
    Y NO debo visualizar el encuentro "11223344" (diferente sede)
    Y la búsqueda debe respetar las restricciones de visibilidad de mi rol

  @prioridadMedia @superusuarioAdmision @gestorTA @happyPath
  Escenario: BUS-30 - Superusuario y Gestor buscan en todos los encuentros
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen los siguientes encuentros:
      | Encuentro | Apellidos | Usuario      | Sede               |
      | 12345678  | García    | ejecutivo01  | Auna Guardia Civil |
      | 87654321  | García    | ejecutivo02  | Auna Cañete        |
      | 11223344  | García    | ejecutivo03  | Las Flores         |
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces debo visualizar los 3 encuentros
    Y la búsqueda debe abarcar todas las sedes
    Y la búsqueda debe abarcar todos los usuarios

  # ========================================================================
  # ACTUALIZACIÓN DE CONTADOR
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: BUS-31 - Contador se actualiza automáticamente al realizar búsqueda (RN-LE-006)
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existen 200 encuentros en total
    Y el contador muestra "200 registros encontrados"
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Y la búsqueda retorna 8 encuentros
    Entonces el contador debe actualizarse automáticamente
    Y debe mostrar "8 registros encontrados"

  # ========================================================================
  # MANEJO DE ERRORES
  # PENDIENTE: Definir mensajes de error específicos para cada caso
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-32 - Error del servicio al ejecutar búsqueda
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y el servicio de búsqueda está experimentando problemas técnicos
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    # PENDIENTE: Definir resultado esperado
    # ¿Se muestra mensaje de error?
    # ¿Cuál es el título del mensaje?
    # ¿Cuál es la descripción del mensaje?
    # ¿Se mantiene la grilla con datos anteriores o se vacía?
    # ¿Qué sucede con el contador?
    Entonces el sistema debe mostrar un mensaje de error
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-33 - Timeout del servicio de búsqueda
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y el servicio de búsqueda no responde en el tiempo esperado
    Cuando ingreso "María" en la caja de búsqueda
    Y presiono la tecla Enter
    # PENDIENTE: Definir resultado esperado
    # ¿Hay un timeout definido (ej: 30 segundos)?
    # ¿Se muestra mensaje específico de timeout?
    # ¿Se muestra un loader/spinner mientras espera?
    # ¿El usuario puede cancelar la búsqueda?
    Entonces el sistema debe manejar el timeout adecuadamente
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-34 - Error de conexión durante la búsqueda
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la conexión a internet se pierde
    Cuando ingreso "123" en la caja de búsqueda
    Y presiono la tecla Enter
    # PENDIENTE: Definir resultado esperado
    # ¿Se muestra mensaje de error de conexión?
    # ¿Es diferente al mensaje de error general del servicio?
    # ¿El sistema reintenta automáticamente?
    Entonces el sistema debe notificar el error de conexión
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-35 - Error al ejecutar búsqueda con caracteres válidos pero búsqueda retorna error 500
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y ingreso "Juan" en la caja de búsqueda
    Cuando presiono la tecla Enter
    Y el servidor retorna un error 500 (Internal Server Error)
    # PENDIENTE: Definir resultado esperado
    # ¿Se muestra el mismo mensaje que error general?
    # ¿Se muestra mensaje técnico al usuario?
    # ¿Se registra el error en algún log?
    Entonces el sistema debe manejar el error del servidor
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-36 - Búsqueda falla pero filtros previos permanecen activos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y la grilla muestra 50 encuentros filtrados
    Y el servicio de búsqueda está experimentando problemas
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Y ocurre un error en el servicio de búsqueda
    # PENDIENTE: Definir resultado esperado
    # ¿Se mantienen los 50 encuentros filtrados previamente?
    # ¿Se vacía la grilla?
    # ¿El filtro "Estado" permanece activo?
    # ¿Se puede seguir usando el sistema normalmente?
    Entonces el sistema debe mantener el estado anterior de la grilla
    Y el filtro "Estado" debe permanecer activo
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-37 - Reintentar búsqueda después de error
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he intentado buscar "García"
    Y la búsqueda falló con error
    # PENDIENTE: Definir resultado esperado
    # ¿Se muestra un botón "Reintentar" en el mensaje de error?
    # ¿El usuario debe volver a ingresar el término de búsqueda?
    # ¿El término de búsqueda se mantiene en la caja de texto?
    Cuando corrijo el problema del servicio
    Y presiono el botón "Reintentar" o vuelvo a presionar Enter
    Entonces la búsqueda debe ejecutarse correctamente
    Y debe mostrar los resultados esperados
    # Resultado esperado: PENDIENTE POR DEFINIR

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @errorHandling
  Escenario: BUS-38 - Mensaje de error no impide realizar otras acciones en la pantalla
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he intentado buscar "Juan"
    Y la búsqueda falló mostrando un mensaje de error
    # PENDIENTE: Definir resultado esperado
    # ¿El usuario puede aplicar filtros mientras hay un error de búsqueda?
    # ¿El usuario puede acceder al detalle de un encuentro visible?
    # ¿El usuario puede descargar la lista actual?
    # ¿El mensaje de error bloquea la interfaz o es informativo?
    Cuando intento aplicar un filtro
    Entonces el sistema debe permitir aplicar el filtro
    Y no debe bloquear otras funcionalidades
    # Resultado esperado: PENDIENTE POR DEFINIR
