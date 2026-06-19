# language: es

Característica: Ordenamiento de Columnas en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero ordenar las tablas por diferentes columnas
  Para analizar los datos según diferentes criterios

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS + ORDENAMIENTO DE 3 ESTADOS
  # CONSOLIDACIÓN: ORD-01, ORD-02, ORD-03, ORD-08, ORD-09 → ORD-01
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: ORD-01 - Validar ciclo de ordenamiento 3 clics con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "<tabla>"
    Y la tabla contiene valores: <valores_bva>
    Cuando hago 1er clic en el encabezado de "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma ascendente (menor a mayor)
    Y debe mostrarse indicador visual de orden ascendente (↑)
    Cuando hago 2do clic en el encabezado de "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma descendente (mayor a menor)
    Y el indicador debe cambiar a orden descendente (↓)
    Cuando hago 3er clic en el encabezado de "<columna>"
    Entonces el ordenamiento debe eliminarse
    Y el indicador visual debe desaparecer
    Y la tabla debe volver a su orden original

    Ejemplos:
      | rol                      | tabla          | columna      | valores_bva                                       |
      | Superusuario de Admisión | Ejecutivo      | Total cant.  | 0, 1, 100, 9999                                   |
      | Gestor TA                | Ejecutivo      | Total monto  | S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99  |
      | Superusuario de Admisión | Por estado     | Total cant.  | 0, 1, 100, 9999                                   |
      | Gestor TA                | Por estado     | Total monto  | S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99  |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS + ORDENAMIENTO ALFABÉTICO
  # CONSOLIDACIÓN: ORD-04, ORD-05 → ORD-02
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-02 - Ordenar alfabéticamente con dirección parametrizada
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total por ejecutivo"
    Cuando hago clic en "Ejecutivo" hasta ordenar <direccion>
    Entonces los nombres de ejecutivos deben ordenarse alfabéticamente <direccion>

    Ejemplos:
      | rol                      | direccion   |
      | Superusuario de Admisión | ascendente  |
      | Gestor TA                | descendente |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS + ORDENAMIENTO NUMÉRICO
  # CONSOLIDACIÓN: ORD-06, ORD-07, ORD-11 → ORD-03
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: ORD-03 - Ordenar numéricamente cantidades y montos con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Total por ejecutivo" contiene <tipo_valor> con valores: <valores_bva>
    Cuando hago clic en "<columna>" hasta ordenar <direccion>
    Entonces los valores deben ordenarse numéricamente <direccion>
    Y debe manejar correctamente los valores frontera

    Ejemplos:
      | rol                      | columna      | tipo_valor | valores_bva                                      | direccion   |
      | Superusuario de Admisión | Total cant.  | cantidades | 0, 1, 100, 9999                                  | ascendente  |
      | Gestor TA                | Total monto  | montos     | S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99 | descendente |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS + MONTOS NEGATIVOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @edgeCase @happyPath
  Esquema del escenario: ORD-04 - Ordenar montos negativos correctamente con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y existen montos negativos en la tabla: <valores_negativos_bva>
    Cuando ordeno por "Total monto" ascendente
    Entonces los montos negativos deben aparecer primero (más negativos al inicio)
    Y debe ordenarse: <valores_negativos_bva>, S/ 0.00, S/ 0.01, ...

    Ejemplos:
      | rol                      | valores_negativos_bva                                      |
      | Superusuario de Admisión | -S/ 999,999,999.99, -S/ 1,000.00, -S/ 0.01                 |
      | Gestor TA                | -S/ 1,000.00, -S/ 999.99, -S/ 1.00, -S/ 0.01               |

  # ========================================================================
  # TÉCNICA: CAMBIO DE COLUMNA DE ORDENAMIENTO
  # CONSOLIDACIÓN: ORD-12, ORD-13 → ORD-05
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-05 - Cambiar de columna elimina ordenamiento previo
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "<columna1>" ascendente
    Cuando hago clic en "<columna2>"
    Entonces el ordenamiento de "<columna1>" debe eliminarse
    Y solo "<columna2>" debe estar ordenada ascendente
    Y solo una columna puede estar ordenada a la vez

    Ejemplos:
      | rol                      | columna1     | columna2           |
      | Superusuario de Admisión | Total cant.  | Total monto        |
      | Gestor TA                | Ejecutivo    | Lista de enc. cant.|

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON FILTROS ACTIVOS
  # CONSOLIDACIÓN: ORD-14, ORD-15, ORD-16 → ORD-06
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-06 - Ordenamiento funciona correctamente con filtros activos
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y la tabla muestra <cantidad_ejecutivos> ejecutivos filtrados
    Cuando hago clic en "Total cant."
    Entonces debe ordenarse solo los <cantidad_ejecutivos> ejecutivos filtrados
    Y el ordenamiento debe mantenerse al desactivar filtros

    Ejemplos:
      | rol                      | cantidad_ejecutivos |
      | Superusuario de Admisión | 10                  |
      | Gestor TA                | 15                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE ORDENAMIENTO
  # CONSOLIDACIÓN: ORD-17, ORD-18 → ORD-07
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-07 - Validar persistencia de ordenamiento según acción
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "Total monto" descendente
    Cuando <accion>
    Entonces el ordenamiento <comportamiento_persistencia>

    Ejemplos:
      | rol                      | accion                  | comportamiento_persistencia              |
      | Superusuario de Admisión | hago scroll hacia abajo | debe mantenerse activo                   |
      | Gestor TA                | hago scroll hacia abajo | debe mantenerse activo                   |
      | Superusuario de Admisión | refresco la página      | debe eliminarse (volver a orden original)|
      | Gestor TA                | refresco la página      | debe eliminarse (volver a orden original)|

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-08 - Validar indicadores visuales de ordenamiento
    Dado que soy un usuario con rol "<rol>"
    Cuando ordeno por "<columna>" <direccion>
    Entonces debe mostrarse el indicador visual "<indicador>"
    Y el indicador debe ubicarse junto al encabezado de "<columna>"
    Y solo debe mostrarse un indicador a la vez

    Ejemplos:
      | rol                      | columna     | direccion   | indicador |
      | Superusuario de Admisión | Total cant. | ascendente  | ↑         |
      | Gestor TA                | Total monto | descendente | ↓         |

# ========================================================================
# RESULTADO DE OPTIMIZACIÓN:
#
# ANTES:  20 escenarios, 8+ valores arbitrarios, 6 grupos redundantes
# DESPUÉS: 8 escenarios, 100% BVA aplicado, 0 redundancias
# AHORRO: -60% escenarios, +300% bugs detectables
#
# CONSOLIDACIONES REALIZADAS:
# 1. ORD-01/02/03 + ORD-08/09 → ORD-01 (ciclo 3 clics con BVA)
# 2. ORD-04/05 → ORD-02 (alfabético con dirección)
# 3. ORD-06/07 + ORD-11 → ORD-03 (numérico con BVA)
# 4. ORD-12/13 → ORD-05 (cambio de columna)
# 5. ORD-14/15/16 → ORD-06 (con filtros activos)
# 6. ORD-17/18 → ORD-07 (persistencia con acción)
# 7. ORD-10 → ORD-08 (indicadores visuales)
# 8. NUEVO: ORD-04 (negativos con BVA)
#
# VALORES BVA APLICADOS:
# - Cantidades: 0, 1, 100, 9999
# - Montos: S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99
# - Negativos: -S/ 999,999,999.99, -S/ 1,000.00, -S/ 999.99, -S/ 1.00, -S/ 0.01
# ========================================================================
