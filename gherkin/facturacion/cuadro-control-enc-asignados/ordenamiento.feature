# language: es

Característica: Ordenamiento de Cuadro de Control - Encuentros Asignados
  Como Responsable de Facturación o Gestor TA
  Quiero ordenar la grilla de encuentros asignados por diferentes columnas
  Para analizar y priorizar el trabajo de los ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación" o "Gestor TA"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO POR TODAS LAS COLUMNAS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-01 - Ordenar grilla por cualquier columna en orden ascendente
    Dado que existen múltiples ejecutivos en la grilla
    Y la grilla NO está ordenada por "<columna>"
    Cuando hago clic en el encabezado de la columna "<columna>"
    Entonces la grilla debe ordenarse por "<columna>" en orden ascendente
    Y debe mostrarse un indicador visual de orden ascendente en "<columna>"
    Y los datos deben reorganizarse correctamente

    Ejemplos:
      | columna                  |
      | Ejecutivo                |
      | Facturado hoy            |
      | Monto fact.              |
      | Por facturar             |
      | Monto por fact.          |
      | En revisión              |
      | Monto en revisión        |
      | Regularizado             |
      | Monto regul.             |
      | No facturable            |
      | Monto NF                 |
      | Error de fact.           |
      | Monto error de f.        |
      | Total pendientes         |
      | Monto total pendientes   |
      | % Total pendiente        |
      | Devuelto a adm.          |
      | Monto devuelto           |

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-02 - Ordenar grilla por cualquier columna en orden descendente
    Dado que existen múltiples ejecutivos en la grilla
    Y la grilla está ordenada por "<columna>" en orden ascendente
    Cuando hago clic nuevamente en el encabezado de la columna "<columna>"
    Entonces la grilla debe ordenarse por "<columna>" en orden descendente
    Y debe mostrarse un indicador visual de orden descendente en "<columna>"
    Y los datos deben reorganizarse correctamente

    Ejemplos:
      | columna                  |
      | Ejecutivo                |
      | Facturado hoy            |
      | Monto fact.              |
      | Por facturar             |
      | Monto por fact.          |
      | En revisión              |
      | Monto en revisión        |
      | Regularizado             |
      | Monto regul.             |
      | No facturable            |
      | Monto NF                 |
      | Error de fact.           |
      | Monto error de f.        |
      | Total pendientes         |
      | Monto total pendientes   |
      | % Total pendiente        |
      | Devuelto a adm.          |
      | Monto devuelto           |

  # ========================================================================
  # TÉCNICA: ALTERNAR ENTRE ASC Y DESC
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-03 - Alternar entre ascendente y descendente repetidamente
    Dado que la grilla muestra datos sin ordenar
    Cuando hago clic en el encabezado "Ejecutivo"
    Entonces la grilla debe ordenarse alfabéticamente A-Z
    Y debe mostrarse el indicador de orden ascendente
    Cuando hago clic nuevamente en "Ejecutivo"
    Entonces la grilla debe ordenarse alfabéticamente Z-A
    Y debe mostrarse el indicador de orden descendente
    Cuando hago clic nuevamente en "Ejecutivo"
    Entonces la grilla debe ordenarse alfabéticamente A-Z
    Y debe mostrarse el indicador de orden ascendente

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS DE TEXTO
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-04 - Validar ordenamiento alfabético ascendente de ejecutivos
    Dado que existen los siguientes ejecutivos en la grilla:
      | Ejecutivo                |
      | ANDREA AMELIA PAZ CRUZ   |
      | Jenny Xamara Ponce Ega   |
      | Luis Medrano             |
      | Zulema Torres            |
    Cuando ordeno por "Ejecutivo" ascendente
    Entonces el primer ejecutivo debe ser "ANDREA AMELIA PAZ CRUZ"
    Y el segundo ejecutivo debe ser "Jenny Xamara Ponce Ega"
    Y el tercer ejecutivo debe ser "Luis Medrano"
    Y el cuarto ejecutivo debe ser "Zulema Torres"

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-05 - Validar ordenamiento alfabético descendente de ejecutivos
    Dado que existen los siguientes ejecutivos en la grilla:
      | Ejecutivo                |
      | ANDREA AMELIA PAZ CRUZ   |
      | Jenny Xamara Ponce Ega   |
      | Luis Medrano             |
      | Zulema Torres            |
    Cuando ordeno por "Ejecutivo" descendente
    Entonces el primer ejecutivo debe ser "Zulema Torres"
    Y el segundo ejecutivo debe ser "Luis Medrano"
    Y el tercer ejecutivo debe ser "Jenny Xamara Ponce Ega"
    Y el cuarto ejecutivo debe ser "ANDREA AMELIA PAZ CRUZ"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS NUMÉRICAS (CANTIDADES)
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-06 - Validar ordenamiento numérico ascendente de cantidades
    Dado que existen ejecutivos con diferentes valores en "<columna>":
      | Ejecutivo   | Valor |
      | Ejecutivo A | 0     |
      | Ejecutivo B | 5     |
      | Ejecutivo C | 183   |
      | Ejecutivo D | 20    |
    Cuando ordeno por "<columna>" ascendente
    Entonces el orden debe ser: Ejecutivo A (0), Ejecutivo B (5), Ejecutivo D (20), Ejecutivo C (183)
    Y los valores deben ordenarse numéricamente, no alfabéticamente

    Ejemplos:
      | columna           |
      | Facturado hoy     |
      | Por facturar      |
      | En revisión       |
      | Regularizado      |
      | No facturable     |
      | Error de fact.    |
      | Total pendientes  |
      | Devuelto a adm.   |

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-07 - Validar ordenamiento numérico descendente de cantidades
    Dado que existen ejecutivos con diferentes valores en "<columna>":
      | Ejecutivo   | Valor |
      | Ejecutivo A | 0     |
      | Ejecutivo B | 5     |
      | Ejecutivo C | 183   |
      | Ejecutivo D | 20    |
    Cuando ordeno por "<columna>" descendente
    Entonces el orden debe ser: Ejecutivo C (183), Ejecutivo D (20), Ejecutivo B (5), Ejecutivo A (0)
    Y los valores mayores deben aparecer primero

    Ejemplos:
      | columna           |
      | Facturado hoy     |
      | Por facturar      |
      | En revisión       |
      | Regularizado      |
      | No facturable     |
      | Error de fact.    |
      | Total pendientes  |
      | Devuelto a adm.   |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS NUMÉRICAS (MONTOS)
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-08 - Validar ordenamiento de montos ascendente
    Dado que existen ejecutivos con diferentes valores en "<columna>":
      | Ejecutivo   | Monto      |
      | Ejecutivo A | 0.00       |
      | Ejecutivo B | 150.50     |
      | Ejecutivo C | 25301.89   |
      | Ejecutivo D | 5401.09    |
    Cuando ordeno por "<columna>" ascendente
    Entonces el orden debe ser: Ejecutivo A (0.00), Ejecutivo B (150.50), Ejecutivo D (5401.09), Ejecutivo C (25301.89)
    Y los montos deben ordenarse numéricamente

    Ejemplos:
      | columna                 |
      | Monto fact.             |
      | Monto por fact.         |
      | Monto en revisión       |
      | Monto regul.            |
      | Monto NF                |
      | Monto error de f.       |
      | Monto total pendientes  |
      | Monto devuelto          |

  @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: ORD-09 - Validar ordenamiento de montos descendente
    Dado que existen ejecutivos con diferentes valores en "<columna>":
      | Ejecutivo   | Monto      |
      | Ejecutivo A | 0.00       |
      | Ejecutivo B | 150.50     |
      | Ejecutivo C | 25301.89   |
      | Ejecutivo D | 5401.09    |
    Cuando ordeno por "<columna>" descendente
    Entonces el orden debe ser: Ejecutivo C (25301.89), Ejecutivo D (5401.09), Ejecutivo B (150.50), Ejecutivo A (0.00)
    Y los montos mayores deben aparecer primero

    Ejemplos:
      | columna                 |
      | Monto fact.             |
      | Monto por fact.         |
      | Monto en revisión       |
      | Monto regul.            |
      | Monto NF                |
      | Monto error de f.       |
      | Monto total pendientes  |
      | Monto devuelto          |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNA DE PORCENTAJE
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-10 - Validar ordenamiento de porcentajes ascendente
    Dado que existen ejecutivos con diferentes valores en "% Total pendiente":
      | Ejecutivo   | Porcentaje |
      | Ejecutivo A | 0.00       |
      | Ejecutivo B | 2.31       |
      | Ejecutivo C | 28.58      |
      | Ejecutivo D | 11.34      |
    Cuando ordeno por "% Total pendiente" ascendente
    Entonces el orden debe ser: Ejecutivo A (0.00%), Ejecutivo B (2.31%), Ejecutivo D (11.34%), Ejecutivo C (28.58%)
    Y los porcentajes deben ordenarse numéricamente

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-11 - Validar ordenamiento de porcentajes descendente
    Dado que existen ejecutivos con diferentes valores en "% Total pendiente":
      | Ejecutivo   | Porcentaje |
      | Ejecutivo A | 0.00       |
      | Ejecutivo B | 2.31       |
      | Ejecutivo C | 28.58      |
      | Ejecutivo D | 11.34      |
    Cuando ordeno por "% Total pendiente" descendente
    Entonces el orden debe ser: Ejecutivo C (28.58%), Ejecutivo D (11.34%), Ejecutivo B (2.31%), Ejecutivo A (0.00%)
    Y los porcentajes mayores deben aparecer primero

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON FILTROS APLICADOS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-12 - Ordenar grilla después de aplicar filtros
    Dado que he aplicado el filtro "Garante" con valor "IAFAS PÚBLICAS"
    Y he presionado el botón "Filtrar"
    Y la grilla muestra 30 ejecutivos filtrados
    Cuando ordeno por "Por facturar" descendente
    Entonces solo los 30 ejecutivos filtrados deben ordenarse
    Y el ejecutivo con mayor cantidad de "Por facturar" debe aparecer primero
    Y el orden debe aplicarse solo a los datos filtrados

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-13 - Mantener ordenamiento al modificar filtros
    Dado que he ordenado la grilla por "Monto fact." descendente
    Y he aplicado el filtro "Sede" con valor "Auna Guardia Civil"
    Cuando presiono el botón "Filtrar"
    Entonces el ordenamiento por "Monto fact." descendente debe mantenerse
    Y los datos filtrados deben mostrarse en el orden correcto

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-14 - Restablecer ordenamiento al limpiar filtros
    Dado que he aplicado filtros y ordenado por "Total pendientes" ascendente
    Cuando presiono el botón "Limpiar"
    Entonces los filtros deben limpiarse
    Y el ordenamiento debe mantenerse
    Y todos los ejecutivos deben mostrarse ordenados por "Total pendientes" ascendente

  # ========================================================================
  # TÉCNICA: CAMBIO DE COLUMNA DE ORDENAMIENTO
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-15 - Cambiar de una columna de ordenamiento a otra
    Dado que la grilla está ordenada por "Ejecutivo" ascendente
    Cuando hago clic en el encabezado "Por facturar"
    Entonces el ordenamiento por "Ejecutivo" debe removerse
    Y la grilla debe ordenarse por "Por facturar" ascendente
    Y solo debe mostrarse un indicador de ordenamiento activo

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-16 - Validar que solo una columna puede ordenarse a la vez
    Dado que la grilla está ordenada por "Monto fact." descendente
    Cuando hago clic en el encabezado "En revisión"
    Entonces debe mostrarse el indicador de ordenamiento solo en "En revisión"
    Y NO debe mostrarse indicador de ordenamiento en "Monto fact."
    Y la grilla debe ordenarse únicamente por "En revisión" ascendente

  # ========================================================================
  # TÉCNICA: MANEJO DE VALORES IGUALES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-17 - Ordenar cuando múltiples ejecutivos tienen el mismo valor
    Dado que existen 5 ejecutivos con "Facturado hoy" = 0
    Y existen 3 ejecutivos con "Facturado hoy" = 20
    Cuando ordeno por "Facturado hoy" ascendente
    Entonces los 5 ejecutivos con valor 0 deben aparecer primero
    Y los 3 ejecutivos con valor 20 deben aparecer después
    Y el orden relativo entre ejecutivos con el mismo valor debe mantenerse estable

  # ========================================================================
  # TÉCNICA: MANEJO DE VALORES NULOS O VACÍOS
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-18 - Ordenar columnas que contienen valores cero
    Dado que existen ejecutivos con "Facturado hoy" = 0
    Y existen ejecutivos con "Facturado hoy" > 0
    Cuando ordeno por "Facturado hoy" ascendente
    Entonces los ejecutivos con valor 0 deben aparecer primero
    Y los ejecutivos con valores mayores deben aparecer después en orden creciente

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-19 - Ordenar columnas de montos que contienen 0.00
    Dado que existen ejecutivos con "Monto fact." = 0.00
    Y existen ejecutivos con "Monto fact." > 0
    Cuando ordeno por "Monto fact." descendente
    Entonces los ejecutivos con montos mayores deben aparecer primero
    Y los ejecutivos con monto 0.00 deben aparecer al final

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES DE ORDENAMIENTO
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-20 - Validar indicadores visuales de ordenamiento
    Dado que la grilla NO está ordenada
    Cuando hago clic en el encabezado "Por facturar"
    Entonces debe mostrarse un ícono de flecha ascendente (↑) en el encabezado "Por facturar"
    Y el encabezado "Por facturar" debe destacarse visualmente
    Cuando hago clic nuevamente en "Por facturar"
    Entonces debe mostrarse un ícono de flecha descendente (↓) en el encabezado "Por facturar"
    Y el encabezado "Por facturar" debe seguir destacándose visualmente

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON GRANDES VOLÚMENES
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-21 - Ordenar grilla con gran cantidad de ejecutivos
    Dado que existen 200 ejecutivos en la grilla
    Cuando ordeno por "Monto total pendientes" descendente
    Entonces todos los 200 ejecutivos deben ordenarse correctamente
    Y el ordenamiento debe completarse en menos de 2 segundos
    Y la grilla debe ser navegable mediante scroll

  # ========================================================================
  # TÉCNICA: RESTABLECER VISTA
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-22 - Validar ordenamiento después de restablecer vista
    Dado que he ordenado la grilla por "Total pendientes" descendente
    Cuando presiono el botón "Restablecer vista"
    Entonces el ordenamiento debe eliminarse
    Y la grilla debe volver a su estado inicial sin orden aplicado
    Y NO debe mostrarse ningún indicador de ordenamiento

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO DESPUÉS DE EXPORTAR
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-23 - Mantener ordenamiento en pantalla después de exportar
    Dado que he ordenado la grilla por "Ejecutivo" ascendente
    Cuando descargo el archivo Excel
    Entonces el ordenamiento en la grilla debe mantenerse
    Y la grilla debe seguir mostrando el orden por "Ejecutivo" ascendente
    Y el indicador visual de ordenamiento debe seguir visible

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERSISTENCIA
  # ========================================================================

  @responsableFacturacion @gestorTA @happyPath
  Escenario: ORD-24 - El ordenamiento se pierde al refrescar la página
    Dado que he ordenado la grilla por "Monto por fact." descendente
    Cuando refresco la página del navegador
    Entonces la grilla debe volver a su estado inicial
    Y NO debe mantener el ordenamiento previo
    Y NO debe mostrarse ningún indicador de ordenamiento
