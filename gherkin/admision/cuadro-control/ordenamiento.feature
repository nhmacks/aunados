# language: es

Característica: Ordenamiento de Columnas en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero ordenar las tablas por diferentes columnas
  Para analizar los datos según diferentes criterios

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO DE 3 ESTADOS - TABLA TOTAL POR EJECUTIVO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-01 - Primer clic ordena ascendente (menor a mayor)
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total por ejecutivo"
    Y la tabla NO está ordenada
    Cuando hago clic en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma ascendente
    Y debe mostrarse un indicador visual de orden ascendente (↑) en "<columna>"
    Y los datos deben reorganizarse de menor a mayor

    Ejemplos:
      | rol                        | columna              |
      | Superusuario de Admisión   | Ejecutivo            |
      | Gestor TA                  | Total cant.          |
      | Superusuario de Admisión   | Total monto          |
      | Gestor TA                  | Lista de enc. cant.  |
      | Superusuario de Admisión   | Lista de enc. monto  |
      | Gestor TA                  | Enc. devueltos cant. |
      | Superusuario de Admisión   | Enc. devueltos monto |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-02 - Segundo clic ordena descendente (mayor a menor)
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Total por ejecutivo" está ordenada por "<columna>" ascendente
    Y se muestra el indicador de orden ascendente (↑)
    Cuando hago clic nuevamente en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma descendente
    Y el indicador debe cambiar a orden descendente (↓)
    Y los datos deben reorganizarse de mayor a menor

    Ejemplos:
      | rol                        | columna              |
      | Superusuario de Admisión   | Total cant.          |
      | Gestor TA                  | Total monto          |
      | Superusuario de Admisión   | Lista de enc. cant.  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-03 - Tercer clic quita el ordenamiento
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Total por ejecutivo" está ordenada por "<columna>" descendente
    Y se muestra el indicador de orden descendente (↓)
    Cuando hago clic por tercera vez en el encabezado de la columna "<columna>"
    Entonces el ordenamiento debe eliminarse
    Y el indicador visual debe desaparecer
    Y la tabla debe volver a su orden original (por defecto)

    Ejemplos:
      | rol                        | columna              |
      | Superusuario de Admisión   | Total cant.          |
      | Gestor TA                  | Ejecutivo            |
      | Superusuario de Admisión   | Total monto          |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS DE TEXTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-04 - Ordenar alfabéticamente columna Ejecutivo ascendente
    Dado que soy un usuario con rol "<rol>"
    Y la tabla tiene los siguientes ejecutivos:
      | Ejecutivo                |
      | Abigail Yoselyn Si...    |
      | Abigail Bisquert Luz I   |
      | Adriana Castellar...     |
      | Adriana Molero Pl...     |
    Cuando ordeno por "Ejecutivo" ascendente
    Entonces el primer ejecutivo debe ser "Abigail Bisquert Luz I"
    Y el segundo ejecutivo debe ser "Abigail Yoselyn Si..."
    Y el orden debe ser alfabético A-Z

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-05 - Ordenar alfabéticamente columna Ejecutivo descendente
    Dado que soy un usuario con rol "<rol>"
    Y la tabla tiene múltiples ejecutivos
    Cuando ordeno por "Ejecutivo" descendente
    Entonces los ejecutivos deben mostrarse en orden Z-A
    Y los que empiezan con "Z" deben aparecer primero
    Y los que empiezan con "A" deben aparecer al final

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS NUMÉRICAS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-06 - Ordenar por cantidades ascendente
    Dado que soy un usuario con rol "<rol>"
    Y la tabla tiene ejecutivos con diferentes cantidades:
      | Ejecutivo   | Total cant. |
      | Ejecutivo A | 0           |
      | Ejecutivo B | 5           |
      | Ejecutivo C | 183         |
      | Ejecutivo D | 11          |
    Cuando ordeno por "Total cant." ascendente
    Entonces el orden debe ser: Ejecutivo A (0), Ejecutivo B (5), Ejecutivo D (11), Ejecutivo C (183)
    Y los valores deben ordenarse numéricamente, no alfabéticamente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-07 - Ordenar por montos descendente
    Dado que soy un usuario con rol "<rol>"
    Y la tabla tiene ejecutivos con diferentes montos:
      | Ejecutivo   | Total monto    |
      | Ejecutivo A | S/ 0.00        |
      | Ejecutivo B | S/ 2,148.87    |
      | Ejecutivo C | S/ 6,144.73    |
      | Ejecutivo D | S/ 1,024.72    |
    Cuando ordeno por "Total monto" descendente
    Entonces el orden debe ser: Ejecutivo C (S/ 6,144.73), Ejecutivo B (S/ 2,148.87), Ejecutivo D (S/ 1,024.72), Ejecutivo A (S/ 0.00)
    Y los montos mayores deben aparecer primero

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO EN TABLA TOTAL DE ENCUENTROS POR ESTADO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-08 - Ordenar tabla Total de encuentros por estado
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total de encuentros por estado"
    Cuando hago clic en el encabezado "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" ascendente
    Y debe mostrarse el indicador de orden ascendente (↑)

    Ejemplos:
      | rol                        | columna           |
      | Superusuario de Admisión   | Tipo de estado    |
      | Gestor TA                  | Estado            |
      | Superusuario de Admisión   | Total cant.       |
      | Gestor TA                  | Total monto       |
      | Superusuario de Admisión   | Lista enc. cant.  |
      | Gestor TA                  | Lista enc. monto  |
      | Superusuario de Admisión   | Enc. dev. cant.   |
      | Gestor TA                  | Enc. dev. monto   |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-09 - Tres clics en tabla Total de encuentros por estado
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total de encuentros por estado"
    Cuando hago 1er clic en "Total cant."
    Entonces debe ordenarse ascendente
    Cuando hago 2do clic en "Total cant."
    Entonces debe ordenarse descendente
    Cuando hago 3er clic en "Total cant."
    Entonces el orden debe eliminarse y volver al estado original

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON VALORES ESPECIALES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-10 - Ordenar con valores cero
    Dado que soy un usuario con rol "<rol>"
    Y existen ejecutivos con "Enc. devueltos cant." = 0
    Y existen ejecutivos con "Enc. devueltos cant." > 0
    Cuando ordeno por "Enc. devueltos cant." ascendente
    Entonces los ejecutivos con valor 0 deben aparecer primero
    Y los ejecutivos con valores mayores deben aparecer después en orden creciente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-11 - Ordenar con montos negativos
    Dado que soy un usuario con rol "<rol>"
    Y existe un encuentro con monto negativo "-S/ 2.69"
    Y existen encuentros con montos positivos
    Cuando ordeno por "Total monto" ascendente
    Entonces el encuentro con monto negativo debe aparecer primero
    Y luego deben aparecer los montos positivos en orden creciente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: CAMBIO DE COLUMNA DE ORDENAMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-12 - Cambiar de una columna a otra elimina orden previo
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "Ejecutivo" ascendente
    Cuando hago clic en el encabezado "Total cant."
    Entonces el ordenamiento por "Ejecutivo" debe eliminarse
    Y la tabla debe ordenarse por "Total cant." ascendente
    Y solo debe mostrarse un indicador de ordenamiento activo en "Total cant."

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-13 - Solo una columna puede estar ordenada a la vez
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "Total monto" descendente
    Cuando hago clic en el encabezado "Lista de enc. cant."
    Entonces debe mostrarse el indicador de ordenamiento solo en "Lista de enc. cant."
    Y NO debe mostrarse indicador en "Total monto"
    Y la tabla debe ordenarse únicamente por "Lista de enc. cant." ascendente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON FILTROS ACTIVOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-14 - Ordenar después de aplicar filtros
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y la tabla muestra 15 ejecutivos filtrados
    Cuando ordeno por "Total cant." descendente
    Entonces solo los 15 ejecutivos filtrados deben ordenarse
    Y el ejecutivo con mayor "Total cant." debe aparecer primero

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-15 - Aplicar filtros mantiene el ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y he ordenado la tabla por "Total monto" descendente
    Cuando aplico el filtro "Garante" = "PACIFICO SEGUROS"
    Y presiono "Filtrar"
    Entonces el ordenamiento por "Total monto" descendente debe mantenerse
    Y los datos filtrados deben mostrarse en el orden correcto

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO Y TOGGLE SOLO POSITIVOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-16 - Ordenar con toggle Solo positivos activo
    Dado que soy un usuario con rol "<rol>"
    Y he activado el toggle "Solo positivos"
    Y he presionado "Filtrar"
    Y la tabla muestra solo filas con valores > 0
    Cuando ordeno por "Total cant." descendente
    Entonces solo las filas con valores > 0 deben ordenarse
    Y el ordenamiento debe funcionar correctamente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL ORDENAMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-17 - El ordenamiento persiste al hacer scroll
    Dado que soy un usuario con rol "<rol>"
    Y he ordenado la tabla por "Ejecutivo" ascendente
    Cuando hago scroll hacia abajo en la tabla
    Entonces el ordenamiento debe mantenerse
    Y el indicador visual debe seguir siendo visible

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: ORD-18 - El ordenamiento NO persiste al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y he ordenado la tabla por "Total cant." descendente
    Cuando refresco la página del navegador
    Entonces el ordenamiento debe eliminarse
    Y la tabla debe volver a su orden original por defecto
    Y NO debe mostrarse ningún indicador de ordenamiento

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-19 - Validar indicadores visuales de ordenamiento
    Dado que soy un usuario con rol "<rol>"
    Y la tabla NO está ordenada
    Cuando hago clic en "Total cant."
    Entonces debe mostrarse un ícono de flecha ascendente (↑) en el encabezado "Total cant."
    Y el encabezado debe destacarse visualmente
    Cuando hago clic nuevamente en "Total cant."
    Entonces debe mostrarse un ícono de flecha descendente (↓)
    Cuando hago clic por tercera vez en "Total cant."
    Entonces el ícono debe desaparecer completamente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: FILA TOTALES SIEMPRE AL FINAL
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: ORD-20 - La fila Totales permanece fija al final
    Dado que soy un usuario con rol "<rol>"
    Cuando ordeno la tabla por cualquier columna
    Entonces la fila "Totales" debe permanecer siempre al final
    Y NO debe incluirse en el ordenamiento de las demás filas
    Y debe ser claramente distinguible (fondo diferente, negrita)

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
