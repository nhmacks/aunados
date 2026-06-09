# language: es

Característica: Ejecutivo de Admisión - Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero gestionar encuentros devueltos desde Facturación
  Para subsanar inconsistencias y reenviarlos al flujo de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - LISTAR ENCUENTROS DEVUELTOS DESDE FACTURACIÓN
  # Cobertura: Sección 5.1, 7.1 del documento 18-Encuentros-Devueltos.md
  # RN-ED-01, RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @regresion
  Escenario: EDE-01 - Listar encuentros devueltos
    Dado que el Ejecutivo de Facturación devuelve un encuentro
    Cuando el Ejecutivo de Admisión ingresa a Encuentros Devueltos
    Entonces visualiza el encuentro devuelto
    Y el encuentro se encuentra en estado "Devuelto"

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - GESTIONAR ENCUENTRO DEVUELTO
  # Cobertura: Sección 6.3, 7.1 del documento 18-Encuentros-Devueltos.md
  # RN-ED-05, RN-ED-06
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @funcional
  Esquema del escenario: EDE-02 - Gestionar encuentro devuelto
    Dado que existe un encuentro devuelto
    Cuando el Ejecutivo de Admisión cambia el estado a "<estado>"
    Entonces el encuentro actualiza su estado correctamente

    Ejemplos:
      | estado               |
      | No facturable        |
      | Error de facturación |
      | Regularizado         |
