# language: es

Característica: Visualización de Lista de Encuentros en Admisión
  Como usuario del sistema AUNADOS
  Quiero visualizar la lista de encuentros clasificados para Admisión
  Para gestionar los encuentros según mi rol y permisos

  Antecedentes:
    Dado que el Job de Admisión ha clasificado encuentros

  # ========================================================================
  # CARGA INICIAL Y ACCESO
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: VIS-01 - Visualizar lista de encuentros como pantalla inicial después del login (Superusuario/Gestor)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando inicio sesión correctamente en el sistema
    Entonces el sistema debe mostrar la pantalla "Lista de Encuentros" automáticamente
    Y debe mostrar los primeros 50 registros
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de apertura
    Y debe mostrar el contador de resultados
    # ##### registros encontrados
    Y debe visualizar la grilla con las siguientes columnas:
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
      | Tipo de encuentro           |
      | Sustentos administrativos   |
      | Sustentos médicos           |
      | Sustentos de proceso        |
      | Monto                       |

  @ejecutivoAdmision
  Escenario: VIS-02 - Visualizar lista de encuentros como pantalla inicial después del login (Ejecutivo de admision)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando inicio sesión correctamente en el sistema
    Entonces el sistema debe mostrar la pantalla "Lista de Encuentros" automáticamente
    Y debe mostrar únicamente encuentros creados por mí
    Y debe mostrar únicamente encuentros de mi sede
    Y debe mostrar únicamente encuentros clasificados para Admisión
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de apertura
    Y debe visualizar la grilla con las siguientes columnas:
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

  # ========================================================================
  # SCROLL INFINITO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-03 - Cargar registros adicionales mediante scroll infinito
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen más de 50 encuentros clasificados para Admisión
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar automáticamente los siguientes 50 registros
    Y no debe recargar la página
    Y debe mantener los filtros activos si existen

  @superusuarioAdmision @gestorTA
  Escenario: VIS-04 - Scroll infinito sin más registros disponibles
    Dado que soy un usuario con rol "Gestor TA"
    Y existen exactamente 50 encuentros clasificados para Admisión
    Y he visualizado todos los 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema no debe cargar registros adicionales
    Y debe mantener los 50 registros visibles

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-05 - Scroll infinito con filtros activos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he aplicado un filtro que retorna 120 registros
    Y he visualizado los primeros 50 registros filtrados
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar los siguientes 50 registros que cumplan el filtro
    Y no debe recargar la página
    Y debe mantener el filtro activo

  # ========================================================================
  # RESTRICCIONES DE VISIBILIDAD
  # ========================================================================

  @ejecutivoAdmision
  Escenario: VIS-08 - Ejecutivo solo visualiza encuentros clasificados para Admisión creados por él en su sede
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01" asignado a la sede "Auna Guardia Civil"
    Y existen los siguientes encuentros:
      | Encuentro | Usuario      | Sede               | Bandeja    |
      | 12345678  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 23456789  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 34567890  | ejecutivo02  | Auna Guardia Civil | Admisión   |
      | 45678901  | ejecutivo01  | Auna Cañete        | Admisión   |
      | 56789012  | ejecutivo01  | Auna Guardia Civil | Protocolo  |
    Cuando accedo a la Lista de Encuentros
    Entonces debo visualizar únicamente 2 encuentros
    Y debo visualizar el encuentro "12345678"
    Y debo visualizar el encuentro "23456789"
    Y NO debo visualizar el encuentro "34567890"
    Y NO debo visualizar el encuentro "45678901"
    Y NO debo visualizar el encuentro "56789012"

  @superusuarioAdmision @gestorTA
  Escenario: VIS-09 - Superusuario y Gestor visualizan todos los encuentros clasificados para Admisión
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen los siguientes encuentros:
      | Encuentro | Usuario      | Sede               | Bandeja    |
      | 12345678  | ejecutivo01  | Auna Guardia Civil | Admisión   |
      | 23456789  | ejecutivo02  | Auna Cañete        | Admisión   |
      | 34567890  | ejecutivo03  | Auna San Borja     | Admisión   |
      | 45678901  | ejecutivo01  | Auna Guardia Civil | Protocolo  |
      | 56789012  | ejecutivo02  | Auna Cañete        | Facturación|
    Cuando accedo a la Lista de Encuentros
    Entonces debo visualizar 3 encuentros
    Y debo visualizar encuentros de todas las sedes
    Y debo visualizar encuentros de todos los usuarios
    Y NO debo visualizar encuentros de otras bandejas

  # ========================================================================
  # CONTADOR DE RESULTADOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-10 - Visualizar contador con 1 registro
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existe exactamente 1 encuentro clasificado para Admisión visible para mi rol
    Cuando accedo a la Lista de Encuentros
    Entonces el contador debe mostrar "1 registro encontrado"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-11 - Visualizar contador con múltiples registros
    Dado que soy un usuario con rol "Gestor TA"
    Y existen 150 encuentros clasificados para Admisión visibles para mi rol
    Cuando accedo a la Lista de Encuentros
    Entonces el contador debe mostrar "150 registros encontrados"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-13 - Contador se actualiza al realizar búsqueda
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen 200 encuentros clasificados para Admisión
    Y he accedido a la Lista de Encuentros
    Cuando realizo una búsqueda que retorna 8 registros
    Entonces el contador debe actualizarse automáticamente
    Y debe mostrar "8 registros encontrados"

  # ========================================================================
  # ESTADOS DE ERROR Y VACÍOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-15 - Lista vacía cuando no existen encuentros para mostrar
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y no existen encuentros clasificados para Admisión visibles para mi rol
    Cuando accedo a la Lista de Encuentros
    Entonces debe mostrarse el mensaje de error funcional
    Y el mensaje debe mostrar el título "Hubo un inconveniente"
    Y el mensaje debe mostrar la descripción "En estos momentos no podemos mostrar la información que necesita. Por favor, inténtelo nuevamente"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-17 - Error general al cargar la lista de encuentros
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y ocurre un error en el sistema al obtener los encuentros
    Cuando accedo a la Lista de Encuentros
    Entonces debe mostrarse el mensaje de error
    Y el mensaje debe mostrar el título "Hubo un inconveniente"
    Y el mensaje debe mostrar la descripción "En estos momentos no podemos mostrar la información que necesita. Por favor, inténtelo nuevamente"

  # ========================================================================
  # CLASIFICACIÓN Y FUENTE DE DATOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-18 - Información proviene de XHIS y Job de Admisión
    Dado que soy un usuario con rol "Gestor TA"
    Y el Job de Admisión obtiene información desde XHIS
    Y el Job clasifica encuentros para Admisión
    Cuando accedo a la Lista de Encuentros
    Entonces la información mostrada debe corresponder a:
      | Fuente          | Datos                                    |
      | XHIS            | Pacientes, Encuentros, Garantes, Sedes   |
      | Job de Admisión | Clasificación, Sustentos                 |
    Y la clasificación debe haber sido determinada por el Job de Admisión

  # ========================================================================
  # ACCESO AL DETALLE
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-19 - Acceder al detalle del encuentro desde la grilla
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y visualizo encuentros en la Lista de Encuentros
    Cuando selecciono cualquier encuentro de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrar la información completa del encuentro seleccionado

  # ========================================================================
  # PERFORMANCE Y CARGA
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-20 - Soportar miles de registros mediante paginación por scroll
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen 5000 encuentros clasificados para Admisión
    Cuando accedo a la Lista de Encuentros
    Entonces el sistema debe cargar únicamente los primeros 50 registros
    Y debe utilizar scroll infinito para cargar los siguientes registros
    Y no debe cargar todos los 5000 registros inicialmente
    Y debe mantener tiempos de respuesta aceptables

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: VIS-21 - Evitar cargas completas innecesarias al hacer scroll
    Dado que soy un usuario con rol "Gestor TA"
    Y he cargado los primeros 50 registros
    Cuando realizo scroll infinito para cargar más registros
    Entonces el sistema debe cargar únicamente los siguientes 50 registros
    Y no debe volver a cargar los registros previamente mostrados
    Y no debe recargar la página completa
