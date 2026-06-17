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
  Escenario: VIS-01 - Ejecutivo accede a Encuentros Devueltos y visualiza grilla con columnas
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y existen encuentros devueltos desde Facturación
    Cuando accedo a la bandeja "Encuentros Devueltos"
    Entonces el sistema debe mostrar la lista de encuentros devueltos
    Y debe mostrar los primeros 50 registros
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de devolución
    Y debe visualizar la grilla con las siguientes columnas:
      | Columna           |
      | Encuentro         |
      | Estado            |
      | Apellidos         |
      | Nombres           |
      | NºHC              |
      | Garante           |
      | Tipo de encuentro |
      | Fecha apert.      |
      | Prioridad         |
      | Monto             |

  @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-01B - Gestor TA y Superusuario acceden a Encuentros Devueltos y visualizan grilla con todas las columnas
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
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
    Y he iniciado sesión en el sistema
    Y NO tengo encuentros devueltos
    Cuando accedo a "Encuentros Devueltos"
    Entonces debe mostrarse el mensaje "No encontramos resultados por atender"
    Y debe mostrarse la descripción "Por favor, realiza la búsqueda verificando los datos correctos y/o ingresando el número de encuentro."
    Y NO debe visualizarse ningún encuentro en la grilla

  @ejecutivoAdmision @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: VIS-04B - Validar visibilidad de botones cuando hay encuentros devueltos
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos
    Cuando accedo a "Encuentros Devueltos"
    Y visualizo la grilla con registros
    Entonces debe visualizarse el botón "Descargar"
    Y el botón "Descargar" debe estar habilitado
    Y debe visualizarse el botón "Restablecer vista"
    Y el botón "Restablecer vista" debe estar habilitado

    Ejemplos:
      | rol                      |
      | Ejecutivo de Admisión    |
      | Gestor TA                |
      | Superusuario de Admisión |

  # ========================================================================
  # TÉCNICA: ACCESO AL DETALLE
  # Cobertura: Sección 8 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-05 - Acceder al detalle del encuentro devuelto (RN-ED-025)
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

  @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-06 - Visualizar columnas de devoluciones por tipo en la grilla (RN-ED-002)
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a "Encuentros Devueltos"
    Y existe un encuentro con los siguientes motivos:
      | Motivo                              | Tipo            |
      | Acta Conformidad                    | Administrativa  |
      | Carta de Garantía por Laboratorio   | Médica          |
      | Error CIE10                         | Médica          |
      | Duplicidad de Gastos                | Proceso         |
    Cuando visualizo la grilla de encuentros
    Entonces la columna "Devoluciones administrativas" debe mostrar "Acta Conformidad"
    Y la columna "Devoluciones médicas" debe mostrar "Carta de Garantía por Laboratorio, Error CIE10"
    Y la columna "Devoluciones de proceso" debe mostrar "Duplicidad de Gastos"

  @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: VIS-07 - Visualizar guion en columnas de devoluciones sin datos
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido a "Encuentros Devueltos"
    Y existe un encuentro con los siguientes motivos:
      | Motivo   | Tipo   |
      | <motivo> | <tipo> |
    Cuando visualizo la grilla de encuentros
    Entonces la columna "Devoluciones administrativas" debe mostrar "<col_admin>"
    Y la columna "Devoluciones médicas" debe mostrar "<col_medica>"
    Y la columna "Devoluciones de proceso" debe mostrar "<col_proceso>"

    Ejemplos:
      | motivo                            | tipo           | col_admin        | col_medica                        | col_proceso          |
      | Acta Conformidad                  | Administrativa | Acta Conformidad | -                                 | -                    |
      | Carta de Garantía por Laboratorio | Médica         | -                | Carta de Garantía por Laboratorio | -                    |
      | Duplicidad de Gastos              | Proceso        | -                | -                                 | Duplicidad de Gastos |

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: VIS-08 - Ejecutivo de Admisión NO visualiza columnas exclusivas de Gestor y Superusuario
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he accedido a "Encuentros Devueltos"
    Cuando visualizo la grilla de encuentros
    Entonces NO debo visualizar la columna "Sede"
    Y NO debo visualizar la columna "Usuario"
    Y NO debo visualizar la columna "Devoluciones administrativas"
    Y NO debo visualizar la columna "Devoluciones médicas"
    Y NO debo visualizar la columna "Devoluciones de proceso"

  # ========================================================================
  # TÉCNICA: SCROLL INFINITO
  # Cobertura: Sección 11 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-09 - Cargar registros adicionales mediante scroll infinito
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo más de 50 encuentros devueltos
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar automáticamente los siguientes 50 registros
    Y no debe recargar la página
    Y debe mantener los filtros activos si existen

  # ========================================================================
  # TÉCNICA: SECCIONES EXPANDIBLES EN DETALLE
  # Cobertura: Sección 14 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: VIS-10 - Expandir sección Datos de encuentro en el detalle
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he accedido al detalle del encuentro "26192267"
    Y la sección "Datos de encuentro" está colapsada por defecto
    Cuando hago clic en "Datos de encuentro"
    Entonces la sección debe expandirse
    Y debe mostrarse la información del encuentro:
      | Campo              | Valor           |
      | Nº de encuentro    | 26192267        |
      | Fecha de apertura  | 29/05/2026      |
      | Tipo de encuentro  | CEX             |
      | Prestación         | CONSULTA MEDICA |

  @ejecutivoAdmision @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: VIS-11 - Expandir sección Datos del seguro en el detalle
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he accedido al detalle del encuentro "26192267"
    Y la sección "Datos del seguro" está colapsada por defecto
    Cuando hago clic en "Datos del seguro"
    Entonces la sección debe expandirse
    Y debe mostrarse la información del seguro:
      | Campo               | Valor                |
      | Nombre del garante  | AUNA NO ONCOLOGICO   |
      | Producto            | MAS SALUD            |
      | Plan copago         | MAS SALUD            |
      | Beneficio           | AMBULATORIA          |

  @ejecutivoAdmision @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: VIS-12 - Colapsar sección expandida en el detalle
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he accedido al detalle del encuentro "26192267"
    Y la sección "Datos de encuentro" está expandida
    Cuando hago clic nuevamente en "Datos de encuentro"
    Entonces la sección debe colapsarse
    Y la información detallada debe ocultarse

  @ejecutivoAdmision @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: VIS-13 - Expandir múltiples secciones simultáneamente
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he accedido al detalle del encuentro "26192267"
    Cuando expando la sección "Datos de encuentro"
    Y expando la sección "Datos del seguro"
    Entonces ambas secciones deben permanecer expandidas simultáneamente
    Y debo visualizar toda la información de ambas secciones

  @ejecutivoAdmision @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: VIS-14 - Estado por defecto de secciones expandibles
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Cuando accedo al detalle de un encuentro devuelto
    Entonces la sección "Datos generales" debe estar visible por defecto
    Y la sección "Datos de encuentro" debe estar colapsada por defecto
    Y la sección "Datos del seguro" debe estar colapsada por defecto
    Y cada sección colapsada debe mostrar un indicador visual de expansión
