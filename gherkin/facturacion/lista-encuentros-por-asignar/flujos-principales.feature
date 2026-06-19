# language: es

Característica: Responsable de Facturación - Lista de Encuentros por Asignar
  Como Responsable de Facturación
  Quiero gestionar la lista de encuentros pendientes de asignación
  Para asignar encuentros a ejecutivos de facturación de manera individual

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ORIGEN DE ENCUENTROS
  # Cobertura: Validar que encuentros provienen del Job de Admisión
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @listaEncuentrosPorAsignar @regresion
  Escenario: LPA-01 - Listar encuentros nuevos pendientes de asignación
    Dado que el Job de Admisión procesa nuevos encuentros hacia Facturación
    Cuando el Responsable de Facturación ingresa a "Lista de Encuentros por Asignar"
    Entonces visualiza los encuentros pendientes
    Y los encuentros no deben encontrarse asignados

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ENCUENTROS DEVUELTOS DESDE ADMISIÓN
  # Cobertura: Validar encuentros devueltos por Superusuario de Admisión
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @listaEncuentrosPorAsignar @funcional
  Esquema del escenario: LPA-02 - Listar encuentros devueltos desde Admisión
    Dado que el Superusuario de Admisión cambia el estado del encuentro a "<estado>"
    Cuando el Responsable de Facturación ingresa a "Lista de Encuentros por Asignar"
    Entonces visualiza el encuentro en estado "<estado>"
    Y el encuentro no debe encontrarse asignado

    Ejemplos:
      | estado               |
      | No facturable        |
      | Error de facturación |
      | Regularizado         |

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ASIGNACIÓN INDIVIDUAL DE ENCUENTROS NUEVOS
  # Cobertura: Validar que encuentros desaparecen de ambas bandejas
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @listaEncuentrosPorAsignar @regresion
  Escenario: LPA-03 - Asignar un encuentro nuevo
    Dado que existe un encuentro pendiente de asignación
    Cuando el Responsable de Facturación asigna el encuentro a un Ejecutivo de Facturación
    Entonces el encuentro desaparece de la bandeja del Responsable de Facturación
    Y el encuentro desaparece de Asignaciones Masivas

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - REASIGNACIÓN A EJECUTIVO DIFERENTE
  # Cobertura: Validar reasignación y visualización en bandeja del ejecutivo
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @listaEncuentrosPorAsignar @funcional
  Esquema del escenario: LPA-04 - Reasignar encuentro devuelto a un nuevo ejecutivo
    Dado que existe un encuentro devuelto
    Cuando el Responsable de Facturación asigna el encuentro a un ejecutivo diferente
    Entonces el encuentro desaparece de la bandeja del Responsable de Facturación
    Y el encuentro debe visualizarse en la bandeja del nuevo Ejecutivo de Facturación

    Ejemplos:
      | estado               |
      | No facturable        |
      | Error de facturación |
      | Regularizado         |

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - REASIGNACIÓN AL MISMO EJECUTIVO
  # Cobertura: Validar que se puede reasignar al ejecutivo que lo devolvió
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @listaEncuentrosPorAsignar @funcional
  Esquema del escenario: LPA-05 - Reasignar encuentro devuelto al mismo ejecutivo
    Dado que existe un encuentro devuelto
    Cuando el Responsable de Facturación asigna el encuentro al mismo ejecutivo anterior
    Entonces el encuentro desaparece de la bandeja del Responsable de Facturación
    Y el encuentro debe visualizarse nuevamente en la bandeja del Ejecutivo de Facturación

    Ejemplos:
      | estado               |
      | No facturable        |
      | Error de facturación |
      | Regularizado         |
