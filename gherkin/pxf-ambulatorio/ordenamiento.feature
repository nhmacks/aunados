# language: es

Característica: Ordenamiento de Columnas en PxF Ambulatorio
  Como Gestor TA
  Quiero ordenar las tablas por diferentes columnas
  Para analizar los datos según diferentes criterios

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a "PxF Ambulatorio"

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO DE 3 ESTADOS - TABLA PROTOCOLO
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-01 - Primer clic ordena ascendente (menor a mayor)
    Dado que estoy visualizando la tabla "Protocolo"
    Y la tabla NO está ordenada
    Cuando hago clic en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma ascendente
    Y debe mostrarse un indicador visual de orden ascendente (↑) en "<columna>"
    Y los datos deben reorganizarse de menor a mayor

    Ejemplos:
      | columna      |
      | Protocolo    |
      | Total cant.  |
      | Total monto  |
      | PxS cant.    |
      | PxS monto    |

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-02 - Segundo clic ordena descendente (mayor a menor)
    Dado que la tabla "Protocolo" está ordenada por "<columna>" ascendente
    Y se muestra el indicador de orden ascendente (↑)
    Cuando hago clic nuevamente en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma descendente
    Y el indicador debe cambiar a orden descendente (↓)
    Y los datos deben reorganizarse de mayor a menor

    Ejemplos:
      | columna      |
      | Total cant.  |
      | Total monto  |
      | PxS cant.    |
      | PxS monto    |

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-03 - Tercer clic quita el ordenamiento
    Dado que la tabla "Protocolo" está ordenada por "<columna>" descendente
    Y se muestra el indicador de orden descendente (↓)
    Cuando hago clic por tercera vez en el encabezado de la columna "<columna>"
    Entonces el ordenamiento debe eliminarse
    Y el indicador visual debe desaparecer
    Y la tabla debe volver a su orden original (por defecto)

    Ejemplos:
      | columna      |
      | Protocolo    |
      | Total cant.  |
      | Total monto  |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO - TABLA ADMISIÓN
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-04 - Ordenar tabla Admisión por columnas
    Dado que estoy visualizando la tabla "Admisión"
    Cuando hago clic en el encabezado "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" ascendente
    Y debe mostrarse el indicador de orden ascendente (↑)

    Ejemplos:
      | columna        |
      | Tipo           |
      | Total cant.    |
      | Total monto    |
      | PxS cant.      |
      | PxS monto      |
      | Cápita cant    |
      | Cápita monto   |
      | CPM cant.      |
      | CPM monto      |

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-05 - Tres clics en tabla Admisión
    Dado que estoy visualizando la tabla "Admisión"
    Cuando hago 1er clic en "Total cant."
    Entonces debe ordenarse ascendente
    Cuando hago 2do clic en "Total cant."
    Entonces debe ordenarse descendente
    Cuando hago 3er clic en "Total cant."
    Entonces el orden debe eliminarse y volver al estado original

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO - TABLA FACTURACIÓN
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-06 - Ordenar tabla Facturación por columnas
    Dado que estoy visualizando la tabla "Facturación"
    Cuando hago clic en el encabezado "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" ascendente
    Y debe mostrarse el indicador de orden ascendente (↑)

    Ejemplos:
      | columna        |
      | Tipo           |
      | Total cant.    |
      | Total monto    |
      | PxS cant.      |
      | PxS monto      |
      | Cápita cant    |
      | Cápita monto   |
      | CPM cant.      |
      | CPM monto      |

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-07 - Tres clics en tabla Facturación
    Dado que estoy visualizando la tabla "Facturación"
    Cuando hago 1er clic en "Total monto"
    Entonces debe ordenarse ascendente
    Cuando hago 2do clic en "Total monto"
    Entonces debe ordenarse descendente
    Cuando hago 3er clic en "Total monto"
    Entonces el orden debe eliminarse y volver al estado original

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS DE TEXTO
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-08 - Ordenar alfabéticamente columna Protocolo ascendente
    Dado que la tabla "Protocolo" tiene las siguientes filas:
      | Protocolo                 |
      | Con sustentos completos   |
      | En plazo de laboratorio   |
    Cuando ordeno por "Protocolo" ascendente
    Entonces el orden debe ser alfabético A-Z

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-09 - Ordenar alfabéticamente columna Tipo en tabla Admisión
    Dado que la tabla "Admisión" tiene las siguientes filas:
      | Tipo                  |
      | Lista de encuentros   |
      | Encuentros devueltos  |
    Cuando ordeno por "Tipo" ascendente
    Entonces el orden debe ser alfabético A-Z

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS NUMÉRICAS
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-10 - Ordenar por cantidades ascendente en tabla Protocolo
    Dado que la tabla "Protocolo" tiene filas con diferentes cantidades
    Cuando ordeno por "Total cant." ascendente
    Entonces los valores deben ordenarse numéricamente de menor a mayor
    Y los valores cero deben aparecer primero

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-11 - Ordenar por montos descendente en tabla Admisión
    Dado que la tabla "Admisión" tiene filas con diferentes montos
    Cuando ordeno por "Total monto" descendente
    Entonces los montos mayores deben aparecer primero
    Y los montos deben ordenarse numéricamente

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-12 - Ordenar por montos descendente en tabla Facturación
    Dado que la tabla "Facturación" tiene filas con diferentes montos:
      | Tipo            | Total monto        |
      | Por asignar     | S/ 11,719,424.95   |
      | Asignados       | S/ 116,782.55      |
      | Facturados hoy  | S/ 0.00            |
    Cuando ordeno por "Total monto" descendente
    Entonces el orden debe ser: Por asignar, Asignados, Facturados hoy

  # ========================================================================
  # TÉCNICA: CAMBIO DE COLUMNA DE ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-13 - Cambiar de una columna a otra elimina orden previo
    Dado que la tabla "Protocolo" está ordenada por "Protocolo" ascendente
    Cuando hago clic en el encabezado "Total cant."
    Entonces el ordenamiento por "Protocolo" debe eliminarse
    Y la tabla debe ordenarse por "Total cant." ascendente
    Y solo debe mostrarse un indicador de ordenamiento activo en "Total cant."

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-14 - Solo una columna puede estar ordenada a la vez
    Dado que la tabla "Admisión" está ordenada por "Total monto" descendente
    Cuando hago clic en el encabezado "PxS cant."
    Entonces debe mostrarse el indicador de ordenamiento solo en "PxS cant."
    Y NO debe mostrarse indicador en "Total monto"
    Y la tabla debe ordenarse únicamente por "PxS cant." ascendente

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON FILTROS ACTIVOS
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-15 - Ordenar después de aplicar filtros
    Dado que he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y las tablas muestran datos filtrados
    Cuando ordeno la tabla "Protocolo" por "Total cant." descendente
    Entonces solo los datos filtrados deben ordenarse
    Y el filtro debe mantenerse activo

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-16 - Aplicar filtros mantiene el ordenamiento activo
    Dado que he ordenado la tabla "Facturación" por "Total monto" descendente
    Cuando aplico el filtro "Garante" = "PACIFICO SEGUROS"
    Y presiono "Filtrar"
    Entonces el ordenamiento por "Total monto" descendente debe mantenerse
    Y los datos filtrados deben mostrarse en el orden correcto

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO Y TOGGLE SOLO POSITIVOS
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-17 - Ordenar con toggle Solo positivos activo
    Dado que he activado el toggle "Solo positivos"
    Y he presionado "Filtrar"
    Y las tablas muestran solo filas con valores > 0
    Cuando ordeno la tabla "Admisión" por "Total cant." descendente
    Entonces solo las filas con valores > 0 deben ordenarse
    Y el ordenamiento debe funcionar correctamente

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-18 - Validar indicadores visuales de ordenamiento
    Dado que la tabla "Protocolo" NO está ordenada
    Cuando hago clic en "Total cant."
    Entonces debe mostrarse un ícono de flecha ascendente (↑) en el encabezado "Total cant."
    Y el encabezado debe destacarse visualmente
    Cuando hago clic nuevamente en "Total cant."
    Entonces debe mostrarse un ícono de flecha descendente (↓)
    Cuando hago clic por tercera vez en "Total cant."
    Entonces el ícono debe desaparecer completamente

  # ========================================================================
  # TÉCNICA: FILA TOTALES SIEMPRE AL FINAL
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: ORD-19 - La fila Totales permanece fija al final
    Dado que estoy visualizando la tabla "<tabla>"
    Cuando ordeno la tabla por cualquier columna
    Entonces la fila "Totales" debe permanecer siempre al final
    Y NO debe incluirse en el ordenamiento de las demás filas
    Y debe ser claramente distinguible (fondo diferente, negrita)

    Ejemplos:
      | tabla        |
      | Protocolo    |
      | Admisión     |
      | Facturación  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-20 - El ordenamiento persiste al hacer scroll
    Dado que he ordenado la tabla "Admisión" por "Tipo" ascendente
    Cuando hago scroll hacia abajo en la página
    Entonces el ordenamiento debe mantenerse
    Y el indicador visual debe seguir siendo visible

  @prioridadMedia @gestorTA @pxfAmbulatorio @unhappyPath
  Escenario: ORD-21 - El ordenamiento NO persiste al recargar la página
    Dado que he ordenado la tabla "Facturación" por "Total cant." descendente
    Cuando refresco la página del navegador
    Entonces el ordenamiento debe eliminarse
    Y las tablas deben volver a su orden original por defecto
    Y NO debe mostrarse ningún indicador de ordenamiento

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO INDEPENDIENTE POR TABLA
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: ORD-22 - El ordenamiento es independiente por tabla
    Dado que he ordenado la tabla "Protocolo" por "Total monto" descendente
    Cuando visualizo la tabla "Admisión"
    Entonces la tabla "Admisión" debe estar en su orden original
    Y NO debe estar afectada por el ordenamiento de "Protocolo"
    Cuando ordeno la tabla "Admisión" por "Tipo" ascendente
    Entonces la tabla "Protocolo" debe mantener su ordenamiento por "Total monto" descendente
