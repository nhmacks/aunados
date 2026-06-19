# language: es

Característica: Visualización de Detalle del Encuentro
  Como usuario autorizado del sistema AUNADOS
  Quiero visualizar el detalle completo de un encuentro
  Para revisar toda la información operativa y dar seguimiento administrativo

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - ACCESO POR ROL
  # Cobertura: RN-DE-01, Sección 2, 3
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @happyPath
  Escenario: DV-01 - Superusuario accede al detalle desde lista de encuentros
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y visualizo encuentros en la Lista de Encuentros
    Y existen datos completos del paciente "Juan Carlos García Pérez" con NHC "98765432"
    Y el encuentro "12345678" tiene estado "Pendiente"
    Y el ejecutivo responsable es "María Rodríguez López"
    Cuando selecciono el encuentro con número "12345678"
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrarse en una nueva vista
    Y debo permanecer autenticado
    Y debe mostrarse el título "Encuentro 12345678"
    Y el formato del número debe ser numérico de 8 dígitos
    Y debe mostrarse el estado "Pendiente" en la esquina superior derecha
    Y debe mostrarse "Nombres: Juan Carlos"
    Y debe mostrarse "Apellidos: García Pérez"
    Y debe mostrarse "NHC: 98765432"
    Y debe mostrarse "Ejecutivo Responsable: María Rodríguez López"
    Y debe mostrarse el agrupador "Datos del Encuentro"
    Y el agrupador "Datos del Encuentro" debe ser expandible
    Y debe mostrarse el agrupador "Datos del Seguro"
    Y el agrupador "Datos del Seguro" debe ser expandible

  @prioridadMedia @gestorTA @happyPath
  Escenario: DV-02 - Gestor TA accede al detalle desde lista de encuentros
    Dado que soy un usuario con rol "Gestor TA"
    Y visualizo encuentros en la Lista de Encuentros
    Y existen datos completos del paciente "Ana María López Torres" con NHC "11223344"
    Y el encuentro "87654321" tiene estado "Tramitado"
    Y el ejecutivo responsable es "Carlos Sánchez Díaz"
    Cuando selecciono el encuentro con número "87654321"
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrarse en una nueva vista
    Y debo permanecer autenticado
    Y debe mostrarse el título "Encuentro 87654321"
    Y el formato del número debe ser numérico de 8 dígitos
    Y debe mostrarse el estado "Tramitado" en la esquina superior derecha
    Y debe mostrarse "Nombres: Ana María"
    Y debe mostrarse "Apellidos: López Torres"
    Y debe mostrarse "NHC: 11223344"
    Y debe mostrarse "Ejecutivo Responsable: Carlos Sánchez Díaz"
    Y debe mostrarse el agrupador "Datos del Encuentro"
    Y el agrupador "Datos del Encuentro" debe ser expandible
    Y debe mostrarse el agrupador "Datos del Seguro"
    Y el agrupador "Datos del Seguro" debe ser expandible

  @prioridadMedia @ejecutivoAdmision @happyPath
  Escenario: DV-03 - Ejecutivo accede al detalle desde lista de encuentros
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y visualizo encuentros en la Lista de Encuentros
    Y existen datos completos del paciente "Pedro José Ramírez Cruz" con NHC "55667788"
    Y el encuentro "45678901" tiene estado "Derivado a Dirección Médica"
    Y el ejecutivo responsable es "Laura Fernández Ruiz"
    Cuando selecciono el encuentro con número "45678901"
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrarse en una nueva vista
    Y debo permanecer autenticado
    Y debe mostrarse el título "Encuentro 45678901"
    Y el formato del número debe ser numérico de 8 dígitos
    Y debe mostrarse el estado "Derivado a Dirección Médica" en la esquina superior derecha
    Y debe mostrarse "Nombres: Pedro José"
    Y debe mostrarse "Apellidos: Ramírez Cruz"
    Y debe mostrarse "NHC: 55667788"
    Y debe mostrarse "Ejecutivo Responsable: Laura Fernández Ruiz"
    Y debe mostrarse el agrupador "Datos del Encuentro"
    Y el agrupador "Datos del Encuentro" debe ser expandible
    Y debe mostrarse el agrupador "Datos del Seguro"
    Y el agrupador "Datos del Seguro" debe ser expandible

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTRUCTURA - CABECERA
  # Cobertura: Sección 5
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: DV-04 - Visualizar diferentes estados en cabecera
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "<estado>"
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse el estado "<estado>" en la esquina superior derecha

    Ejemplos:
      | estado                          |
      | Pendiente                       |
      | Tramitado                       |
      | Derivado a Dirección Médica     |
      | Error de Vinculación            |
      | Pago por Adelantado             |

  # ========================================================================
  # TÉCNICA: VALORES LÍMITE - SUSTENTOS PENDIENTES
  # Cobertura: Sección 5.3, RN-DE-07
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-05 - Visualizar sustentos administrativos cuando existen pendientes
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene los siguientes sustentos administrativos pendientes:
      | Sustento              |
      | Carta de Garantía     |
      | Hoja SITEDS           |
      | Denuncia Policial     |
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse la sección "Sustentos Administrativos Pendientes"
    Y debe listar los 3 sustentos pendientes
    Y debe mostrar "Carta de Garantía"
    Y debe mostrar "Hoja SITEDS"
    Y debe mostrar "Denuncia Policial"
    Y cada sustento administrativo debe mostrar el label "Pendiente"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: DV-06 - NO visualizar sustentos administrativos cuando NO existen pendientes
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro NO tiene sustentos administrativos pendientes
    Cuando visualizo la cabecera de la pantalla
    Entonces NO debe mostrarse la sección "Sustentos Administrativos Pendientes"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-07 - Visualizar sustentos médicos cuando existen pendientes
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene el sustento médico pendiente "Laboratorio"
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse la sección "Sustentos Médicos Pendientes"
    Y debe mostrar "Laboratorio"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: DV-08 - NO visualizar sustentos médicos cuando NO existen pendientes
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro NO tiene sustentos médicos pendientes
    Cuando visualizo la cabecera de la pantalla
    Entonces NO debe mostrarse la sección "Sustentos Médicos Pendientes"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-09 - Visualizar sustentos de proceso cuando existen pendientes
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene el sustento de proceso pendiente "Laboratorios no imputados"
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse la sección "Sustentos de Proceso Pendientes"
    Y debe mostrar "Laboratorios no imputados"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: DV-10 - NO visualizar sustentos de proceso cuando NO existen pendientes
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro NO tiene sustentos de proceso pendientes
    Cuando visualizo la cabecera de la pantalla
    Entonces NO debe mostrarse la sección "Sustentos de Proceso Pendientes"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE AGRUPADORES - DATOS DEL ENCUENTRO
  # Cobertura: Sección 7
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-11 - Visualizar campos completos en agrupador "Datos del Encuentro"
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene los siguientes datos:
      | Campo             | Valor        |
      | Número Encuentro  | 12345678     |
      | Fecha Apertura    | 03/06/2026   |
      | Tipo Encuentro    | Ambulatorio  |
      | Prestación        | ADM00050     |
    Cuando expando el agrupador "Datos del Encuentro"
    Entonces debe mostrarse "Número de Encuentro: 12345678"
    Y debe mostrarse "Fecha de Apertura: 03/06/2026"
    Y debe mostrarse "Tipo de Encuentro: Ambulatorio"
    Y debe mostrarse "Prestación: ADM00050"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-12 - Validar formato de fecha de apertura en detalle
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y la fecha de apertura es "03/06/2026"
    Cuando expando el agrupador "Datos del Encuentro"
    Entonces la fecha debe mostrarse en formato "DD/MM/YYYY"
    Y debe mostrarse como "03/06/2026"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-13 - Validar formato de número de encuentro (8 dígitos)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando expando el agrupador "Datos del Encuentro"
    Entonces el número de encuentro debe mostrarse como "12345678"
    Y debe tener exactamente 8 dígitos
    Y debe ser numérico

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: DV-14 - Visualizar diferentes tipos de encuentro
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el tipo de encuentro es "<tipo>"
    Cuando expando el agrupador "Datos del Encuentro"
    Entonces debe mostrarse "Tipo de Encuentro: <tipo>"

    Ejemplos:
      | tipo        |
      | Ambulatorio |
      | Emergencia  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE AGRUPADORES - DATOS DEL SEGURO
  # Cobertura: Sección 8
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-15 - Visualizar campos completos en agrupador "Datos del Seguro"
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene los siguientes datos de seguro:
      | Campo                   | Valor                    |
      | Garante                 | Pacífico EPS             |
      | Producto                | Salud EPS Pacífico       |
      | Plan Copago             | Salud EPS Pacífico       |
      | Beneficio               | Consulta Ambulatoria     |
      | Código de Autorización  | AUT-987654               |
    Cuando expando el agrupador "Datos del Seguro"
    Entonces debe mostrarse "Garante: Pacífico EPS"
    Y debe mostrarse "Producto: Salud EPS Pacífico"
    Y debe mostrarse "Plan Copago: Salud EPS Pacífico"
    Y debe mostrarse "Beneficio: Consulta Ambulatoria"
    Y debe mostrarse "Código de Autorización: AUT-987654"

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: DV-16 - Visualizar diferentes garantes en detalle
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el garante es "<garante>"
    Cuando expando el agrupador "Datos del Seguro"
    Entonces debe mostrarse "Garante: <garante>"

    Ejemplos:
      | garante       |
      | Pacífico EPS  |
      | MAPFRE EPS    |
      | Oncosalud     |

  # ========================================================================
  # TÉCNICA: PRUEBAS BASADAS EN RIESGO - RESTRICCIÓN SOLO LECTURA
  # Cobertura: Sección 4, RN-DE-02
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-17 - Validar que datos del paciente son de solo lectura
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo los datos del paciente
    Entonces los campos de nombres deben ser de solo lectura
    Y los campos de apellidos deben ser de solo lectura
    Y los campos de NHC deben ser de solo lectura
    Y NO debo poder modificar ningún dato del paciente

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-18 - Validar que datos del encuentro son de solo lectura
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Cuando expando el agrupador "Datos del Encuentro"
    Entonces el número de encuentro debe ser de solo lectura
    Y la fecha de apertura debe ser de solo lectura
    Y el tipo de encuentro debe ser de solo lectura
    Y la prestación debe ser de solo lectura
    Y NO debo poder modificar ningún dato del encuentro

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-19 - Validar que datos del seguro son de solo lectura
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando expando el agrupador "Datos del Seguro"
    Entonces el garante debe ser de solo lectura
    Y el producto debe ser de solo lectura
    Y el plan copago debe ser de solo lectura
    Y el beneficio debe ser de solo lectura
    Y el código de autorización debe ser de solo lectura
    Y NO debo poder modificar ningún dato del seguro

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-20 - Validar que sustentos son de solo lectura
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene sustentos administrativos pendientes
    Cuando visualizo los sustentos en la cabecera
    Entonces los sustentos administrativos deben ser de solo lectura
    Y los sustentos médicos deben ser de solo lectura
    Y los sustentos de proceso deben ser de solo lectura
    Y NO debo poder modificar ningún sustento

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - VISIBILIDAD POR ROL
  # Cobertura: Sección 9, 10
  # ========================================================================

  @prioridadMedia @ejecutivoAdmision @happyPath
  Escenario: DV-21 - Ejecutivo visualiza información permitida para su rol
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo la pantalla de detalle
    Entonces debo poder visualizar la cabecera del encuentro
    Y debo poder visualizar el estado actual
    Y debo poder visualizar los datos del paciente
    Y debo poder visualizar los datos del encuentro
    Y debo poder visualizar los datos del seguro
    Y debo poder visualizar los sustentos pendientes

  @prioridadMedia @superusuarioAdmision @happyPath
  Escenario: DV-22 - Superusuario visualiza toda la información disponible
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo la pantalla de detalle
    Entonces debo poder visualizar toda la información disponible para Ejecutivo
    Y debo tener visibilidad operativa completa
    Y debo poder visualizar sustentos agrupados
    Y debo poder visualizar estados especiales

  @prioridadMedia @gestorTA @happyPath
  Escenario: DV-23 - Gestor TA visualiza toda la información disponible
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo la pantalla de detalle
    Entonces debo poder visualizar toda la información disponible para Ejecutivo
    Y debo tener visibilidad operativa completa
    Y debo poder visualizar sustentos agrupados
    Y debo poder visualizar estados especiales

  # ========================================================================
  # TÉCNICA: PAIRWISE - COMBINACIONES DE MÚLTIPLES SUSTENTOS
  # Cobertura: Sección 5.3, RN-DE-07
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Esquema del escenario: DV-24 - Visualizar combinaciones de sustentos pendientes (Pairwise)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene "<sustentos_admin>" sustentos administrativos pendientes
    Y el encuentro tiene "<sustentos_medicos>" sustentos médicos pendientes
    Y el encuentro tiene "<sustentos_proceso>" sustentos de proceso pendientes
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse "<resultado_esperado>"

    Ejemplos:
      | sustentos_admin | sustentos_medicos | sustentos_proceso | resultado_esperado                                      |
      | 3               | 1                 | 0                 | Secciones de Admin y Médicos, NO mostrar Proceso        |
      | 0               | 1                 | 1                 | Secciones de Médicos y Proceso, NO mostrar Admin        |
      | 2               | 0                 | 1                 | Secciones de Admin y Proceso, NO mostrar Médicos        |
      | 0               | 0                 | 0                 | NO mostrar ninguna sección de sustentos                 |
      | 1               | 1                 | 1                 | Mostrar las 3 secciones de sustentos                    |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO
  # Cobertura: Sección 17
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-25 - Usuario puede acceder al detalle seleccionando un encuentro en la Lista
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando selecciono un encuentro de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe ser la única forma de acceder al detalle

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @unhappyPath
  Escenario: DV-26 - Superusuario y Ejecutivo pueden cambiar estado pero no editar datos del encuentro
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando intento modificar cualquier dato del paciente, encuentro o seguro
    Entonces el sistema NO debe permitir la modificación
    Y todos los campos deben ser de solo lectura
    Y la única acción permitida debe ser el cambio de estado

  @prioridadMedia @gestorTA @unhappyPath
  Escenario: DV-26A - Gestor TA puede visualizar detalle pero NO puede cambiar estado ni editar datos
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Cuando intento modificar cualquier dato del paciente, encuentro o seguro
    Entonces el sistema NO debe permitir la modificación
    Y todos los campos deben ser de solo lectura
    Y NO debe mostrarse ningún botón o control para cambiar estado
    Y la pantalla debe ser completamente de solo lectura

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-27 - Solo se muestran secciones de sustentos que tienen registros pendientes
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene 2 sustentos administrativos pendientes
    Y el encuentro NO tiene sustentos médicos pendientes
    Y el encuentro NO tiene sustentos de proceso pendientes
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse únicamente la sección "Sustentos Administrativos"
    Y NO debe mostrarse la sección "Sustentos médicos"
    Y NO debe mostrarse la sección "Sustentos de Proceso"

  # ========================================================================
  # TÉCNICA: CASOS EDGE - VALORES ESPECIALES Y LÍMITES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: DV-28 - Campo opcional vacío debe mostrar guión, nunca NULL ni undefined
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y existe el encuentro "12345678" con los siguientes datos:
      | Aspecto               | Valor                  |
      | Paciente              | Juan Carlos García     |
      | NHC                   | 98765432               |
      | Sede                  | Auna Guardia Civil      |
      | Estado                | Pendiente              |
      | Tipo de Seguro        | Seguro XYZ             |
      | Tipo de Afiliación    | Principal              |
      | Código de Autorización| (vacío/no aplica)      |
    Y he accedido al detalle del encuentro "12345678"
    Cuando expando el agrupador "Datos del Seguro"
    Entonces debo visualizar el campo "Tipo de Seguro" con valor "Seguro XYZ"
    Y debo visualizar el campo "Tipo de Afiliación" con valor "Principal"
    Y debo visualizar el campo "Código de Autorización" con valor "-"
    Y NO debe mostrarse "NULL" en ningún campo
    Y NO debe mostrarse "undefined" en ningún campo

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-29 - Visualizar detalle con máximo número de sustentos administrativos
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene los siguientes sustentos administrativos pendientes:
      | Sustento              |
      | Carta de Garantía     |
      | Hoja SITEDS           |
      | Denuncia Policial     |
      | SOAT Tarjeta Física   |
    Cuando visualizo la cabecera de la pantalla
    Entonces debe mostrarse la sección "Sustentos Administrativos Pendientes"
    Y debe listar todos los 4 sustentos correctamente
    Y todos deben ser visibles sin scroll

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FUENTE DE DATOS
  # Cobertura: Sección 18
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-30 - Validar que la información proviene de XHIS y Job de Admisión
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo toda la información del detalle
    Entonces los datos del paciente deben provenir de XHIS
    Y los datos del encuentro deben provenir de XHIS
    Y los datos del seguro deben provenir de XHIS
    Y la clasificación del encuentro debe provenir del Job de Admisión
    Y los sustentos deben provenir del Job de Admisión

  # ========================================================================
  # TÉCNICA: PRUEBAS DE PERFORMANCE Y CARGA
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-31 - Cargar detalle con información completa sin degradación
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene todos los campos completos
    Y el encuentro tiene 4 sustentos administrativos pendientes
    Y el encuentro tiene 1 sustento médico pendiente
    Y el encuentro tiene 1 sustento de proceso pendiente
    Cuando visualizo la pantalla de detalle completa
    Entonces toda la información debe cargarse en tiempo aceptable
    Y todos los agrupadores deben funcionar correctamente
    Y no debe haber degradación en la experiencia de usuario

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE NAVEGACIÓN
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-32 - Verificar que no se pierde contexto al acceder al detalle
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado filtros que muestran 50 encuentros
    Y he ordenado por "Fecha de Apertura"
    Cuando accedo al detalle del encuentro "12345678"
    Y luego regreso a la Lista de Encuentros
    Entonces los filtros aplicados deben mantenerse activos
    Y el ordenamiento debe mantenerse
    Y debe mostrarse la misma vista que tenía antes

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-33 - Validar carga de detalle con todos los agrupadores colapsados por defecto
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Cuando accedo al detalle del encuentro "12345678" por primera vez
    Entonces el agrupador "Datos del Encuentro" debe estar colapsado por defecto
    Y el agrupador "Datos del Seguro" debe estar colapsado por defecto
    Y debo poder expandir cada agrupador individualmente

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: DV-34 - Validar que la cabecera siempre es visible sin expandir
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Cuando visualizo la pantalla de detalle
    Entonces el título "Encuentro 12345678" debe ser visible inmediatamente
    Y el estado del encuentro debe ser visible inmediatamente
    Y los datos del paciente deben ser visibles inmediatamente
    Y el ejecutivo responsable debe ser visible inmediatamente
    Y NO debo necesitar expandir ningún agrupador para ver esta información básica
