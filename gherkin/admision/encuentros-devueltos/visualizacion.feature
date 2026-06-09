# language: es

Característica: Visualización de Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero visualizar la lista de encuentros devueltos desde Facturación
  Para identificar y subsanar las inconsistencias detectadas

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PANTALLA Y COLUMNAS
  # Cobertura: Sección 5.1 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-01 - Acceder a la pantalla Encuentros Devueltos
    Dado que existen encuentros devueltos desde Facturación
    Cuando accedo a la bandeja "Encuentros Devueltos"
    Entonces el sistema debe mostrar la lista de encuentros devueltos
    Y debe mostrar los primeros 50 registros
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de devolución

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-02 - Visualizar columnas de la lista de encuentros devueltos
    Dado que he accedido a "Encuentros Devueltos"
    Cuando visualizo la grilla de encuentros
    Entonces debe visualizar la grilla con las siguientes columnas:
      | Columna              |
      | Encuentro            |
      | Apellidos            |
      | Nombres              |
      | NHC                  |
      | Fecha de Devolución  |
      | Motivo de Devolución |
      | Usuario Responsable  |
      | Estado Actual        |
      | Sede                 |
      | Prioridad            |

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE VISIBILIDAD POR ROL
  # Cobertura: Sección 5.2 del documento 18-Encuentros-Devueltos.md
  # RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: VIS-03 - Ejecutivo solo visualiza encuentros devueltos creados por él en su sede
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
  Escenario: VIS-04 - Superusuario y Gestor TA visualizan todos los encuentros devueltos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros devueltos de múltiples sedes y usuarios
    Cuando accedo a "Encuentros Devueltos"
    Entonces debo visualizar todos los encuentros devueltos
    Y debo visualizar encuentros de todas las sedes
    Y debo visualizar encuentros de todos los usuarios

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: VIS-05 - Ejecutivo sin encuentros devueltos visualiza lista vacía
    Dado que soy el ejecutivo "ejecutivo01"
    Y NO tengo encuentros devueltos
    Cuando accedo a "Encuentros Devueltos"
    Entonces debe mostrarse el mensaje "Sin encuentros devueltos"
    Y NO debe visualizarse ningún encuentro en la grilla

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE MOTIVO DE DEVOLUCIÓN
  # Cobertura: Sección 4.2, 8.2 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: VIS-06 - Visualizar motivo de devolución en la grilla
    Dado que existe un encuentro devuelto por "<motivo>"
    Cuando visualizo la lista de "Encuentros Devueltos"
    Entonces la columna "Motivo de Devolución" debe mostrar "<motivo>"

    Ejemplos:
      | motivo                                    |
      | Falta documentación administrativa        |
      | Error en datos del seguro                 |
      | Cobertura insuficiente                    |
      | Falta autorización de garante             |
      | Información de paciente incompleta        |
      | Faltan sustentos médicos                  |

  # ========================================================================
  # TÉCNICA: ACCESO AL DETALLE
  # Cobertura: Sección 8 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-07 - Acceder al detalle del encuentro devuelto
    Dado que tengo encuentros devueltos
    Y visualizo la lista en "Encuentros Devueltos"
    Cuando selecciono un encuentro de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrar los datos del paciente
    Y debe mostrar los datos del encuentro
    Y debe mostrar los datos del seguro
    Y debe mostrar el motivo de devolución
    Y debe mostrar la fecha de devolución
    Y debe mostrar el usuario que realizó la devolución
    Y debe mostrar el historial de devoluciones previas

  # ========================================================================
  # TÉCNICA: SCROLL INFINITO
  # Cobertura: Sección 11 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: VIS-08 - Cargar registros adicionales mediante scroll infinito
    Dado que tengo más de 50 encuentros devueltos
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar automáticamente los siguientes 50 registros
    Y no debe recargar la página
    Y debe mantener los filtros activos si existen
