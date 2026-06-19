# language: es

Característica: Reordenamiento de Columnas en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero reordenar las columnas de las tablas
  Para personalizar la visualización según mis necesidades

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - TODAS LAS DIRECCIONES
  # CONSOLIDACIÓN: REORD-01, REORD-02, REORD-03, REORD-04 → REORD-01
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-01 - Mover columna a posición específica
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "<tabla>"
    Y las columnas están en el orden original
    Cuando arrastro la columna "<columna_origen>" a la posición "<posicion_destino>"
    Y suelto la columna
    Entonces la columna "<columna_origen>" debe moverse a la posición "<posicion_destino>"
    Y las demás columnas deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

    Ejemplos:
      | rol                      | tabla          | columna_origen   | posicion_destino | descripcion_movimiento |
      | Superusuario de Admisión | Ejecutivo      | Total monto      | 2                | Derecha a izquierda    |
      | Gestor TA                | Ejecutivo      | Total cant.      | 5                | Izquierda a derecha    |
      | Superusuario de Admisión | Ejecutivo      | Enc. dev. monto  | 1                | Al inicio              |
      | Gestor TA                | Ejecutivo      | Total cant.      | última           | Al final               |
      | Superusuario de Admisión | Devoluciones   | Total cant.      | 2                | Derecha a izquierda    |
      | Gestor TA                | Devoluciones   | Médicos          | última           | Al final               |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # CONSOLIDACIÓN: REORD-07, REORD-08, REORD-09, REORD-10 → REORD-02
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-02 - Validar indicadores visuales durante reordenamiento
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando cualquier tabla
    Cuando empiezo a arrastrar la columna "<columna>"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea vertical indicando dónde se soltará la columna
    Y el cursor debe cambiar a icono de "arrastre"
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces la línea indicadora debe seguir el movimiento
    Cuando suelto la columna
    Entonces el indicador visual debe desaparecer
    Y la columna debe posicionarse en el lugar indicado

    Ejemplos:
      | rol                      | columna     |
      | Superusuario de Admisión | Total cant. |
      | Gestor TA                | Total monto |

  # ========================================================================
  # TÉCNICA: CANCELAR REORDENAMIENTO
  # CONSOLIDACIÓN: REORD-11, REORD-12 → REORD-03
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-03 - Cancelar reordenamiento de columna
    Dado que soy un usuario con rol "<rol>"
    Y estoy arrastrando una columna
    Cuando <accion_cancelar>
    Entonces el reordenamiento debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

    Ejemplos:
      | rol                      | accion_cancelar                      |
      | Superusuario de Admisión | presiono la tecla ESC                |
      | Gestor TA                | suelto la columna fuera de la tabla  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DIFERENTES TIPOS DE DATOS
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: REORD-04 - Reordenar columnas con diferentes tipos de valores
    Dado que soy un usuario con rol "<rol>"
    Y la columna "<columna>" contiene valores de tipo "<tipo_dato>" con valores: <valores_bva>
    Cuando reordeno la columna "<columna>" a una nueva posición
    Entonces los datos deben moverse correctamente con la columna
    Y los valores deben mantenerse asociados a sus filas
    Y el formato debe preservarse: <valores_bva>

    Ejemplos:
      | rol                      | columna     | tipo_dato  | valores_bva                                      |
      | Superusuario de Admisión | Total cant. | cantidades | 0, 1, 100, 9999                                  |
      | Gestor TA                | Total monto | montos     | S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99 |
      | Superusuario de Admisión | Ejecutivo   | texto      | Nombres alfabéticos                              |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON ORDENAMIENTO ACTIVO
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-05 - Reordenar columnas con ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "<columna_ordenada>" descendente
    Cuando reordeno la columna "<columna_mover>" a una nueva posición
    Entonces el ordenamiento de "<columna_ordenada>" debe mantenerse activo
    Y el indicador visual (↓) debe seguir visible
    Y los datos deben seguir ordenados correctamente

    Ejemplos:
      | rol                      | columna_ordenada | columna_mover |
      | Superusuario de Admisión | Total cant.      | Total monto   |
      | Gestor TA                | Total monto      | Ejecutivo     |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE REORDENAMIENTO
  # CONSOLIDACIÓN: REORD-13, REORD-14 → REORD-06
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-06 - Validar persistencia de reordenamiento según acción
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas
    Cuando <accion>
    Entonces el reordenamiento <comportamiento_persistencia>

    Ejemplos:
      | rol                      | accion                  | comportamiento_persistencia                         |
      | Superusuario de Admisión | hago scroll hacia abajo | debe mantenerse (columnas en nuevo orden)           |
      | Gestor TA                | hago scroll hacia abajo | debe mantenerse (columnas en nuevo orden)           |
      | Superusuario de Admisión | refresco la página      | debe eliminarse (volver a orden original)           |
      | Gestor TA                | refresco la página      | debe eliminarse (volver a orden original)           |

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS CONSECUTIVOS
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-07 - Realizar múltiples reordenamientos consecutivos
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total por ejecutivo"
    Cuando reordeno "Total cant." a la posición 4
    Y luego reordeno "Total monto" a la posición 2
    Y finalmente reordeno "Ejecutivo" a la posición 3
    Entonces las 3 columnas deben estar en sus nuevas posiciones
    Y todas las demás columnas deben reordenarse correctamente
    Y no debe haber pérdida de datos

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: BOTÓN RESTABLECER VISTA
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-08 - Restablecer orden original de columnas
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado múltiples columnas
    Cuando presiono el botón "Restablecer vista"
    Entonces todas las columnas deben volver a su orden original
    Y el reordenamiento debe cancelarse completamente

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

# ========================================================================
# RESULTADO DE OPTIMIZACIÓN:
#
# ANTES:  17 escenarios, 2 valores arbitrarios, 2 grupos redundantes
# DESPUÉS: 8 escenarios, BVA aplicado donde corresponde, 0 redundancias
# AHORRO: -53% escenarios (misma cobertura)
#
# CONSOLIDACIONES REALIZADAS:
# 1. REORD-01/02/03/04 → REORD-01 (mover a posición con múltiples direcciones)
# 2. REORD-07/08/09/10 → REORD-02 (indicadores visuales)
# 3. REORD-11/12 → REORD-03 (cancelar reordenamiento)
# 4. REORD-13/14 → REORD-06 (persistencia con acción)
# 5. REORD-05/06 → REORD-01 (consolidado en ejemplos)
# 6. REORD-15 → REORD-05 (con ordenamiento activo)
# 7. REORD-16 → REORD-07 (múltiples reordenamientos)
# 8. REORD-17 → REORD-08 (restablecer vista)
#
# VALORES BVA APLICADOS (donde corresponde):
# - Cantidades: 0, 1, 100, 9999
# - Montos: S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99
#
# NOTA: Prioridad BAJA - considerar mantener solo smoke tests automatizados
# Drag & drop es complejo de automatizar, puede ser más eficiente manual
# ========================================================================
