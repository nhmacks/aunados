# language: es

Característica: Responsable de Facturación - Asignaciones Masivas
  Como Responsable de Facturación
  Quiero gestionar encuentros pendientes de asignación
  Para distribuir eficientemente el trabajo entre ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ORIGEN DE ENCUENTROS
  # Cobertura: Validar que encuentros provienen del Job de Admisión
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @asignacionesMasivas @regresion
  Escenario: ASM-01 - Listar encuentros nuevos pendientes de asignación
    Dado que el Job de Admisión procesa nuevos encuentros hacia Facturación
    Cuando el Responsable de Facturación ingresa a la funcionalidad "Asignaciones Masivas"
    Entonces visualiza los encuentros pendientes de asignación
    Y los encuentros deben encontrarse en estado "Por asignar"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ENCUENTROS DEVUELTOS DESDE ADMISIÓN
  # Cobertura: Validar encuentros devueltos por Superusuario de Admisión
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @asignacionesMasivas @funcional
  Esquema del escenario: ASM-02 - Listar encuentros devueltos desde Admisión
    Dado que el Superusuario de Admisión cambia el estado del encuentro a "<estado>"
    Cuando el Responsable de Facturación ingresa a la funcionalidad "Asignaciones Masivas"
    Entonces visualiza el encuentro en estado "<estado>"
    Y el encuentro no debe encontrarse asignado a un ejecutivo de facturación

    Ejemplos:
      | estado               |
      | No facturable        |
      | Error de facturación |
      | Regularizado         |

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ASIGNACIÓN MASIVA DE ENCUENTROS NUEVOS
  # Cobertura: Validar que encuentros desaparecen de ambas bandejas
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @asignacionesMasivas @regresion
  Escenario: ASM-03 - Asignar masivamente encuentros nuevos
    Dado que existen encuentros pendientes de asignación
    Y el Responsable de Facturación se encuentra en "Asignaciones Masivas"
    Cuando realiza una asignación masiva
    Entonces los encuentros desaparecen de la bandeja "Asignaciones Masivas"
    Y los encuentros desaparecen de "Lista de encuentros por asignar"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - ASIGNACIÓN MASIVA DE ENCUENTROS DEVUELTOS
  # Cobertura: Validar asignación de encuentros devueltos desde Admisión
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @asignacionesMasivas @funcional
  Escenario: ASM-04 - Asignar masivamente encuentros devueltos
    Dado que existen encuentros devueltos pendientes de asignación
    Cuando el Responsable de Facturación realiza una asignación masiva
    Entonces los encuentros deben asignarse correctamente
