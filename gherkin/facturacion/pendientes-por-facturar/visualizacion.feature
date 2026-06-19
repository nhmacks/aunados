# language: es

Característica: Visualización de Pendientes por Facturar
  Como Ejecutivo de Facturación
  Quiero visualizar mi lista de encuentros asignados pendientes de facturar
  Para gestionar mi carga de trabajo de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PANTALLA INICIAL
  # Cobertura: Sección 5.1, 6.1 del documento 21-Pendientes-Facturar.md
  # RN-PF-01, RN-PF-02, RN-PF-03
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-01 - Acceder a Pendientes por Facturar como pantalla inicial
    Dado que tengo encuentros asignados
    Cuando inicio sesión correctamente en el sistema
    Entonces el sistema debe mostrar la pantalla "Pendientes por Facturar" automáticamente
    Y debe mostrar los primeros 50 registros
    Y debe mostrar los encuentros más recientes primero basándose en la fecha de asignación
    Y debe mostrar el contador de carga de trabajo

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-02 - Visualizar columnas de la lista de pendientes
    Dado que he accedido a la pantalla "Pendientes por Facturar"
    Cuando visualizo la grilla de encuentros
    Entonces debe visualizar la grilla con las siguientes columnas:
      | Columna              |
      | Número de Encuentro  |
      | Estado               |
      | NHC                  |
      | Apellidos            |
      | Nombres              |
      | Fecha de Apertura    |
      | Fecha de Asignación  |
      | Tipo de Encuentro    |
      | Garante              |
      | Producto             |
      | Sede                 |
      | Prioridad            |
      | Monto                |
      | Observaciones        |

  # ========================================================================
  # TÉCNICA: SCROLL INFINITO
  # Cobertura: Sección 6.2 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-03 - Cargar registros adicionales mediante scroll infinito
    Dado que tengo más de 50 encuentros asignados
    Y he visualizado los primeros 50 registros
    Cuando me desplazo hasta el final de la grilla
    Entonces el sistema debe cargar automáticamente los siguientes 50 registros
    Y no debe recargar la página
    Y debe mantener los filtros activos si existen

  # ========================================================================
  # TÉCNICA: CONTADOR DE CARGA DE TRABAJO
  # Cobertura: Sección 12 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-04 - Visualizar contador de carga de trabajo
    Dado que tengo 45 encuentros asignados
    Y 32 encuentros están en estado "Pendiente"
    Y 8 encuentros están en estado "En Proceso"
    Y 5 encuentros fueron facturados hoy
    Cuando accedo a la pantalla "Pendientes por Facturar"
    Entonces debe mostrarse el contador con la siguiente información:
      | Indicador              | Valor |
      | Total Asignados        | 45    |
      | Pendientes             | 32    |
      | En Proceso             | 8     |
      | Facturados Hoy         | 5     |

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-05 - Visualizar monto total pendiente en contador
    Dado que tengo encuentros asignados pendientes de facturar
    Y el monto total pendiente es "S/ 125,340.00"
    Cuando accedo a la pantalla "Pendientes por Facturar"
    Entonces debe mostrarse "Monto Pendiente: S/ 125,340.00" en el contador de carga

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE VISIBILIDAD
  # Cobertura: Sección 5.2 del documento 21-Pendientes-Facturar.md
  # RN-PF-01, RN-PF-02, RN-PF-03
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: VIS-06 - Ejecutivo solo visualiza encuentros asignados a su usuario
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen 100 encuentros clasificados para Facturación
    Y 30 encuentros están asignados a "ejecutivo01"
    Y 70 encuentros están asignados a otros ejecutivos
    Cuando accedo a "Pendientes por Facturar"
    Entonces debo visualizar únicamente 30 encuentros
    Y todos los encuentros mostrados deben estar asignados a "ejecutivo01"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: VIS-07 - Ejecutivo NO visualiza encuentros sin asignar
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros en estado "Por asignar" sin ejecutivo asignado
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar encuentros en estado "Por asignar"
    Y solo debo visualizar encuentros asignados a mi usuario

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: VIS-08 - Ejecutivo sin encuentros asignados visualiza lista vacía
    Dado que soy el ejecutivo "ejecutivo01"
    Y NO tengo encuentros asignados
    Cuando accedo a "Pendientes por Facturar"
    Entonces debe mostrarse el mensaje "Sin encuentros asignados"
    Y debe mostrarse la descripción "Actualmente no tiene encuentros asignados para facturar. Contacte al Responsable de Facturación."

  # ========================================================================
  # TÉCNICA: ACCESO AL DETALLE
  # Cobertura: Sección 7.4 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: VIS-09 - Acceder al detalle del encuentro
    Dado que tengo encuentros asignados
    Y visualizo la lista en "Pendientes por Facturar"
    Cuando selecciono un encuentro de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Y debe mostrar los datos del paciente
    Y debe mostrar los datos del encuentro
    Y debe mostrar los datos del seguro
    Y debe mostrar los datos de facturación
    Y debe mostrar los sustentos

  # ========================================================================
  # TÉCNICA: ESTADOS DE FACTURACIÓN
  # Cobertura: Sección 9 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: VIS-10 - Visualizar encuentros según su estado de facturación
    Dado que tengo encuentros asignados en diferentes estados
    Y existen encuentros en estado "<estado>"
    Cuando accedo a "Pendientes por Facturar"
    Entonces debo visualizar los encuentros en estado "<estado>"
    Y la columna "Estado" debe mostrar "<estado>"

    Ejemplos:
      | estado                    |
      | Asignado                  |
      | En Proceso                |
      | Pendiente de Validación   |
      | Observado                 |

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: VIS-11 - NO visualizar encuentros ya facturados en la lista
    Dado que tengo encuentros que fueron marcados como "Facturado"
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar encuentros en estado "Facturado"
    Y solo debo visualizar encuentros pendientes de procesar

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: VIS-12 - NO visualizar encuentros devueltos en la lista activa
    Dado que devolví encuentros a Admisión
    Y los encuentros están en estado "Devuelto"
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar encuentros en estado "Devuelto"
    Y los encuentros devueltos deben salir de mi bandeja
