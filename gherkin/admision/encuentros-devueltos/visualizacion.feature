# language: es

Característica: Visualización de Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero visualizar la lista de encuentros devueltos desde Facturación
  Para identificar y subsanar las inconsistencias detectadas

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PANTALLA Y COLUMNAS
  # Cobertura: Sección 5.1 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-01 - Acceder a Encuentros Devueltos y visualizar grilla con columnas
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y existen encuentros devueltos desde Facturación
    Cuando accedo a la bandeja "Encuentros Devueltos"
    Entonces el sistema debe mostrar la lista de encuentros devueltos
    Y debe mostrar los primeros 50 registros
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de devolución
    Y debe visualizar la grilla con las siguientes columnas:
      | Columna                      |
      | Sede                         |
      | Encuentro                    |
      | Estado                       |
      | Apellidos                    |
      | Nombres                      |
      | NºHC                         |
      | Usuario                      |
      | Garante                      |
      | Tipo de encuentro            |
      | Fecha apert.                 |
      | Prioridad                    |
      | Devoluciones administrativas |
      | Devoluciones médicas         |
      | Devoluciones de proceso      |
      | Monto                        |

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE VISIBILIDAD POR ROL
  # Cobertura: Sección 5.2 del documento 18-Encuentros-Devueltos.md
  # RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: VIS-02 - Ejecutivo solo visualiza encuentros devueltos creados por él en su sede
    Dado que soy el ejecutivo "ejecutivo01" asignado a la sede "Auna Guardia Civil"
    Y existen los siguientes encuentros devueltos:
      | Encuentro | Usuario      | Sede               |
      | 12345678  | ejecutivo01  | Auna Guardia Civil |
      | 23456789  | ejecutivo01  | Auna Guardia Civil |
      | 34567890  | ejecutivo02  | Auna Guardia Civil |
      | 45678901  | ejecutivo01  | Auna Cañete        |
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo visualizar únicamente 2 encuentros
    Y debo visualizar el encuentro "12345678"
    Y debo visualizar el encuentro "23456789"
    Y NO debo visualizar el encuentro "34567890"
    Y NO debo visualizar el encuentro "45678901"

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @regresion
  Escenario: VIS-03 - Superusuario y Gestor TA visualizan todos los encuentros devueltos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros devueltos de múltiples sedes y usuarios
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo visualizar todos los encuentros devueltos
    Y debo visualizar encuentros de todas las sedes
    Y debo visualizar encuentros de todos los usuarios

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: VIS-04 - Ejecutivo sin encuentros devueltos visualiza lista vacía
    Dado que soy el ejecutivo "ejecutivo01"
    Y NO tengo encuentros devueltos
    Cuando accedo a "Encuentros Devueltos"
    Entonces debe mostrarse el mensaje "Sin encuentros devueltos"
    Y NO debe visualizarse ningún encuentro en la grilla


  # ========================================================================
  # TÉCNICA: ACCESO AL DETALLE
  # Cobertura: Sección 8 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-06 - Acceder al detalle del encuentro devuelto (RN-ED-025)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos
    Y visualizo la lista en "Encuentros Devueltos"
    Cuando selecciono un encuentro de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrar los datos del paciente
    Y debe mostrar los datos del encuentro
    Y debe mostrar los datos del seguro
    Y debe mostrar los motivos de devolución
    Y debe mostrar los comentarios si fueron registrados
    Y debe mostrar el estado del encuentro como "Devuelto"
    Y NO debe mostrar la fecha de devolución
    Y NO debe mostrar el usuario que realizó la devolución

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-07 - Visualizar columnas de devoluciones por tipo en la grilla
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido a "Encuentros Devueltos"
    Y existe un encuentro con los siguientes motivos:
      | Motivo                              | Tipo            |
      | Acta Conformidad                    | Administrativa  |
      | Actualizar Datos Económicos         | Administrativa  |
      | Carta de Garantía por Laboratorio   | Médica          |
      | Error CIE10                         | Médica          |
      | Duplicidad de Gastos                | Proceso         |
    Cuando visualizo la grilla de encuentros
    Entonces la columna "Devoluciones administrativas" debe mostrar "Acta Conformidad, Actualizar Datos Económicos"
    Y la columna "Devoluciones médicas" debe mostrar "Carta de Garantía por Laboratorio, Error CIE10"
    Y la columna "Devoluciones de proceso" debe mostrar "Duplicidad de Gastos"

  # ========================================================================
  # TÉCNICA: SCROLL INFINITO
  # Cobertura: Sección 11 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-08 - Cargar registros adicionales mediante scroll infinito
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo más de 50 encuentros devueltos
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar automáticamente los siguientes 50 registros
    Y no debe recargar la página
    Y debe mantener los filtros activos si existen
