# language: es

Característica: Ordenamiento en Lista de Encuentros de Admisión
  Como usuario con permisos de ordenamiento
  Quiero ordenar las columnas de la lista de encuentros
  Para visualizar la información según mis necesidades operativas

  # ========================================================================
  # DISPONIBILIDAD DE ORDENAMIENTO POR ROL
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-01 - Superusuario y Gestor pueden ordenar columnas
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando visualizo la grilla de encuentros
    Entonces las siguientes columnas deben ser ordenables:
      | Columna           |
      | Encuentro         |
      | Nº HC             |
      | Apellidos         |
      | Nombres           |
      | Fecha Apert.      |
      | Usuario           |
      | Garante           |
      | Tipo de Encuentro |
      | Monto             |

  @ejecutivoAdmision @happyPath
  Escenario: ORD-02 - Ejecutivo puede ordenar las columnas permitidas de su vista
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando visualizo la grilla de encuentros
    Entonces las siguientes columnas deben ser ordenables:
      | Columna           |
      | Encuentro         |
      | Nº HC             |
      | Apellidos         |
      | Nombres           |
      | Fecha Apert.      |
      | Garante           |
      | Tipo de Encuentro |
    Y la columna "Usuario" NO debe estar disponible para ordenamiento
    Y la columna "Usuario" NO debe ser visible en la grilla

  # ========================================================================
  # ORDENAMIENTO POR ENCUENTRO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-03 - Ordenar por Encuentro ascendente (primer clic)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes números
    Cuando hago clic en el encabezado "Encuentro" por primera vez
    Entonces la grilla debe ordenarse por número de encuentro ascendente
    Y el primer registro debe ser el encuentro con número más bajo
    Y el último registro debe ser el encuentro con número más alto
    Y debe mostrarse el indicador de orden ascendente en la columna "Encuentro"

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-04 - Ordenar por Encuentro descendente (segundo clic)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Encuentro" ascendente
    Cuando hago clic en el encabezado "Encuentro" por segunda vez
    Entonces la grilla debe ordenarse por número de encuentro descendente
    Y el primer registro debe ser el encuentro con número más alto
    Y el último registro debe ser el encuentro con número más bajo
    Y debe mostrarse el indicador de orden descendente en la columna "Encuentro"

  # ========================================================================
  # ORDENAMIENTO POR NHC
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-05 - Ordenar por NHC ascendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes NHC
    Cuando hago clic en el encabezado "NHC" por primera vez
    Entonces la grilla debe ordenarse por NHC ascendente
    Y el primer registro debe ser el NHC más bajo
    Y el último registro debe ser el NHC más alto

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-06 - Ordenar por NHC descendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "NHC" ascendente
    Cuando hago clic en el encabezado "NHC" por segunda vez
    Entonces la grilla debe ordenarse por NHC descendente
    Y el primer registro debe ser el NHC más alto
    Y el último registro debe ser el NHC más bajo

  # ========================================================================
  # ORDENAMIENTO POR APELLIDOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-07 - Ordenar por Apellidos ascendente (alfabético A-Z)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros de pacientes con diferentes apellidos
    Cuando hago clic en el encabezado "Apellidos" por primera vez
    Entonces la grilla debe ordenarse por apellidos ascendente alfabéticamente
    Y los apellidos que comienzan con "A" deben aparecer primero
    Y los apellidos que comienzan con "Z" deben aparecer al final

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-08 - Ordenar por Apellidos descendente (alfabético Z-A)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Apellidos" ascendente
    Cuando hago clic en el encabezado "Apellidos" por segunda vez
    Entonces la grilla debe ordenarse por apellidos descendente alfabéticamente
    Y los apellidos que comienzan con "Z" deben aparecer primero
    Y los apellidos que comienzan con "A" deben aparecer al final

  # ========================================================================
  # ORDENAMIENTO POR NOMBRES
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-09 - Ordenar por Nombres ascendente (alfabético A-Z)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros de pacientes con diferentes nombres
    Cuando hago clic en el encabezado "Nombres" por primera vez
    Entonces la grilla debe ordenarse por nombres ascendente alfabéticamente
    Y los nombres que comienzan con "A" deben aparecer primero
    Y los nombres que comienzan con "Z" deben aparecer al final

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-10 - Ordenar por Nombres descendente (alfabético Z-A)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Nombres" ascendente
    Cuando hago clic en el encabezado "Nombres" por segunda vez
    Entonces la grilla debe ordenarse por nombres descendente alfabéticamente
    Y los nombres que comienzan con "Z" deben aparecer primero
    Y los nombres que comienzan con "A" deben aparecer al final

  # ========================================================================
  # ORDENAMIENTO POR FECHA DE APERTURA
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-11 - Ordenar por Fecha de Apertura ascendente (más antiguo primero)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes fechas de apertura
    Cuando hago clic en el encabezado "Fecha de Apertura" por primera vez
    Entonces la grilla debe ordenarse por fecha de apertura ascendente
    Y el primer registro debe ser el encuentro con fecha de apertura más antigua
    Y el último registro debe ser el encuentro con fecha de apertura más reciente

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-12 - Ordenar por Fecha de Apertura descendente (más reciente primero)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Fecha de Apertura" ascendente
    Cuando hago clic en el encabezado "Fecha de Apertura" por segunda vez
    Entonces la grilla debe ordenarse por fecha de apertura descendente
    Y el primer registro debe ser el encuentro con fecha de apertura más reciente
    Y el último registro debe ser el encuentro con fecha de apertura más antigua

  # ========================================================================
  # ORDENAMIENTO POR USUARIO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-13 - Ordenar por Usuario ascendente (alfabético A-Z)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros creados por diferentes usuarios
    Cuando hago clic en el encabezado "Usuario" por primera vez
    Entonces la grilla debe ordenarse por usuario ascendente alfabéticamente
    Y los usuarios que comienzan con "A" deben aparecer primero
    Y los usuarios que comienzan con "Z" deben aparecer al final

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-14 - Ordenar por Usuario descendente (alfabético Z-A)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Usuario" ascendente
    Cuando hago clic en el encabezado "Usuario" por segunda vez
    Entonces la grilla debe ordenarse por usuario descendente alfabéticamente
    Y los usuarios que comienzan con "Z" deben aparecer primero
    Y los usuarios que comienzan con "A" deben aparecer al final

  # ========================================================================
  # ORDENAMIENTO POR GARANTE
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-15 - Ordenar por Garante ascendente (alfabético A-Z)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes garantes
    Cuando hago clic en el encabezado "Garante" por primera vez
    Entonces la grilla debe ordenarse por garante ascendente alfabéticamente
    Y los garantes que comienzan con "A" deben aparecer primero (ej: "Auna")
    Y los garantes que comienzan con "P" deben aparecer después (ej: "Pacífico")

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-16 - Ordenar por Garante descendente (alfabético Z-A)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Garante" ascendente
    Cuando hago clic en el encabezado "Garante" por segunda vez
    Entonces la grilla debe ordenarse por garante descendente alfabéticamente
    Y los garantes que comienzan con "P" deben aparecer primero
    Y los garantes que comienzan con "A" deben aparecer al final

  # ========================================================================
  # ORDENAMIENTO POR TIPO DE ENCUENTRO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-17 - Ordenar por Tipo de Encuentro ascendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros ambulatorios y de emergencia
    Cuando hago clic en el encabezado "Tipo de Encuentro" por primera vez
    Entonces la grilla debe ordenarse por tipo de encuentro ascendente alfabéticamente
    Y los encuentros "Ambulatorio" deben aparecer primero
    Y los encuentros "Emergencia" deben aparecer después

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-18 - Ordenar por Tipo de Encuentro descendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Tipo de Encuentro" ascendente
    Cuando hago clic en el encabezado "Tipo de Encuentro" por segunda vez
    Entonces la grilla debe ordenarse por tipo de encuentro descendente alfabéticamente
    Y los encuentros "Emergencia" deben aparecer primero
    Y los encuentros "Ambulatorio" deben aparecer después

  # ========================================================================
  # ORDENAMIENTO POR MONTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-19 - Ordenar por Monto ascendente (menor a mayor)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes montos
    Cuando hago clic en el encabezado "Monto" por primera vez
    Entonces la grilla debe ordenarse por monto ascendente
    Y el primer registro debe ser el encuentro con monto más bajo
    Y el último registro debe ser el encuentro con monto más alto

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-20 - Ordenar por Monto descendente (mayor a menor)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla está ordenada por "Monto" ascendente
    Cuando hago clic en el encabezado "Monto" por segunda vez
    Entonces la grilla debe ordenarse por monto descendente
    Y el primer registro debe ser el encuentro con monto más alto
    Y el último registro debe ser el encuentro con monto más bajo

  # ========================================================================
  # COMPORTAMIENTO DE ORDENAMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-21 - Solo una columna ordenada a la vez
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y he ordenado la grilla por "Apellidos" ascendente
    Y el indicador de ordenamiento está visible en la columna "Apellidos"
    Cuando hago clic en el encabezado "Fecha de Apertura"
    Entonces el ordenamiento por "Apellidos" debe eliminarse
    Y el indicador de ordenamiento debe desaparecer de "Apellidos"
    Y la grilla debe ordenarse por "Fecha de Apertura" ascendente
    Y el indicador de ordenamiento debe aparecer en "Fecha de Apertura"

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-22 - Tercer clic elimina el ordenamiento
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y he ordenado la grilla por "Encuentro" descendente (segundo clic)
    Cuando hago clic en el encabezado "Encuentro" por tercera vez
    Entonces el ordenamiento debe eliminarse
    Y la grilla debe volver al orden por defecto (fecha de apertura más reciente primero)
    Y el indicador de ordenamiento debe desaparecer de "Encuentro"

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-23 - Ordenamiento persiste al hacer scroll infinito
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y he ordenado la grilla por "Apellidos" ascendente
    Y visualizo los primeros 50 registros ordenados
    Cuando realizo scroll infinito para cargar los siguientes 50 registros
    Entonces el ordenamiento por "Apellidos" debe mantenerse
    Y los nuevos 50 registros deben continuar el orden alfabético ascendente
    Y el indicador de ordenamiento debe permanecer visible en "Apellidos"

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-24 - Ordenamiento se aplica sobre resultados filtrados
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y la grilla muestra 100 encuentros filtrados
    Cuando hago clic en el encabezado "Monto" para ordenar ascendente
    Entonces el ordenamiento debe aplicarse solo sobre los 100 encuentros filtrados
    Y el primer registro debe ser el encuentro "Pendiente" con monto más bajo
    Y el último registro debe ser el encuentro "Pendiente" con monto más alto

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-25 - Ordenamiento se aplica sobre resultados de búsqueda
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y he realizado una búsqueda por apellido "García"
    Y la grilla muestra 25 resultados
    Cuando hago clic en el encabezado "Nombres" para ordenar ascendente
    Entonces el ordenamiento debe aplicarse solo sobre los 25 resultados de la búsqueda
    Y todos los registros deben tener apellido "García"
    Y deben estar ordenados por nombres ascendente

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-26 - Ordenamiento con filtros y búsqueda combinados
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y he aplicado el filtro "Prioridad" con valor "Prioridad 1"
    Y he realizado una búsqueda por nombre "Juan"
    Y la grilla muestra 10 resultados que cumplen ambos criterios
    Cuando hago clic en el encabezado "Fecha de Apertura" para ordenar descendente
    Entonces el ordenamiento debe aplicarse sobre los 10 registros filtrados y buscados
    Y todos deben tener Prioridad 1 y nombre "Juan"
    Y deben estar ordenados por fecha de apertura descendente (más recientes primero)

  # ========================================================================
  # INDICADORES VISUALES
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-27 - Visualizar indicador de ordenamiento ascendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y he hecho clic en el encabezado "Encuentro" por primera vez
    Cuando la grilla se ordena ascendente
    Entonces debe mostrarse un indicador visual de orden ascendente (flecha hacia arriba)
    Y el indicador debe estar visible en el encabezado de la columna "Encuentro"
    Y no debe haber indicadores en otras columnas

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-28 - Visualizar indicador de ordenamiento descendente
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y he hecho clic en el encabezado "Encuentro" por segunda vez
    Cuando la grilla se ordena descendente
    Entonces debe mostrarse un indicador visual de orden descendente (flecha hacia abajo)
    Y el indicador debe estar visible en el encabezado de la columna "Encuentro"
    Y no debe haber indicadores en otras columnas

  # ========================================================================
  # LIMPIEZA Y RESTABLECIMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-29 - Restablecer Vista elimina el ordenamiento
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y he ordenado la grilla por "Monto" descendente
    Y he aplicado el filtro "Estado" con valor "Tramitado"
    Cuando presiono el botón "Restablecer Vista"
    Entonces el ordenamiento por "Monto" debe eliminarse
    Y el filtro "Estado" debe eliminarse
    Y la grilla debe volver al orden por defecto (fecha de apertura más reciente primero)
    Y todos los indicadores de ordenamiento deben desaparecer

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-30 - Limpiar filtro NO elimina el ordenamiento
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y he ordenado la grilla por "Apellidos" ascendente
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Cuando presiono el botón "Limpiar" del filtro "Estado"
    Entonces el filtro "Estado" debe eliminarse
    Y el ordenamiento por "Apellidos" debe mantenerse activo
    Y la grilla debe mostrar todos los encuentros ordenados por apellidos ascendente
    Y el indicador de ordenamiento debe permanecer visible en "Apellidos"

  # ========================================================================
  # ORDEN POR DEFECTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-31 - Orden por defecto al cargar la lista (sin ordenamiento aplicado)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y accedo a la Lista de Encuentros sin ordenamiento previo
    Cuando la grilla se carga por primera vez
    Entonces los encuentros deben mostrarse ordenados por fecha de apertura descendente por defecto
    Y el encuentro más reciente debe aparecer primero
    Y el encuentro más antiguo debe aparecer al final
    Y NO debe mostrarse indicador de ordenamiento en ninguna columna

  # ========================================================================
  # CASOS ESPECIALES Y VALORES NULOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @unhappyPath
  Escenario: ORD-32 - Ordenar columna con valores nulos o vacíos
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros donde algunos tienen "Usuario" asignado y otros no
    Cuando hago clic en el encabezado "Usuario" para ordenar ascendente
    Entonces los encuentros con "Usuario" vacío o nulo deben aparecer al final
    Y los encuentros con "Usuario" asignado deben ordenarse alfabéticamente primero

  @superusuarioAdmision @gestorTA @unhappyPath
  Escenario: ORD-33 - Ordenar con valores idénticos mantiene suborden por fecha
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y existen 10 encuentros con el mismo "Garante" = "MAPFRE"
    Cuando hago clic en el encabezado "Garante" para ordenar ascendente
    Entonces todos los encuentros "MAPFRE" deben agruparse juntos
    Y dentro del grupo "MAPFRE" deben mantener el orden por fecha de apertura descendente
    Y los demás garantes deben ordenarse alfabéticamente

  # ========================================================================
  # CONTADOR CON ORDENAMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-34 - Contador no cambia al aplicar ordenamiento
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y la grilla muestra 150 encuentros
    Y el contador muestra "150 registros encontrados"
    Cuando hago clic en el encabezado "Apellidos" para ordenar ascendente
    Entonces el contador debe mantener "150 registros encontrados"
    Y la cantidad de registros NO debe cambiar
    Y solo el orden de visualización debe cambiar

  # ========================================================================
  # VALIDACIÓN DE RESTRICCIONES DE ROL
  # ========================================================================

  @ejecutivoAdmision @unhappyPath
  Escenario: ORD-35 - Ejecutivo no puede ordenar columnas exclusivas de Superusuario y Gestor
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Cuando visualizo la grilla de encuentros
    Entonces las columnas "Usuario" y "Monto" no deben ser visibles en su grilla
    Y no debe existir opción de ordenar por "Usuario"
    Y no debe existir opción de ordenar por "Monto"

  # ========================================================================
  # COLUMNAS NO ORDENABLES
  # ========================================================================

  @superusuarioAdmision @gestorTA @unhappyPath
  Escenario: ORD-36 - Columnas que NO son ordenables (incluso para Superusuario/Gestor)
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Cuando visualizo la grilla de encuentros
    Entonces las siguientes columnas NO deben ser ordenables:
      | Columna                   |
      | Sede                      |
      | Estado                    |
      | Prioridad                 |
      | Sustentos Administrativos |
      | Sustentos Médicos         |
      | Sustentos de Proceso      |
    Y NO debo poder hacer clic para ordenar estas columnas
    Y NO deben mostrar indicadores de que son ordenables

  # ========================================================================
  # PERFORMANCE Y ESTABILIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-37 - Ordenamiento con grandes volúmenes de datos
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Gestor TA"
    Y la grilla muestra 5000 encuentros disponibles mediante scroll infinito
    Cuando hago clic en el encabezado "Monto" para ordenar descendente
    Entonces el ordenamiento debe aplicarse sobre todos los 5000 registros
    Y al hacer scroll debe cargar los siguientes 50 registros siguiendo el orden aplicado
    Y el tiempo de respuesta debe ser aceptable

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: ORD-38 - Cambio rápido entre ordenamientos múltiples
    Dado que ingreso al aplicativo
    Y inicio sesión con el perfil "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y soy un usuario con rol "Superusuario de Admisión"
    Y visualizo la grilla de encuentros
    Cuando hago clic en el encabezado "Apellidos" para ordenar ascendente
    Y luego hago clic en el encabezado "Fecha de Apertura" para ordenar ascendente
    Y luego hago clic en el encabezado "Monto" para ordenar descendente
    Entonces el sistema debe procesar cada ordenamiento correctamente
    Y solo el último ordenamiento (Monto descendente) debe permanecer activo
    Y solo debe mostrarse el indicador en la columna "Monto"
