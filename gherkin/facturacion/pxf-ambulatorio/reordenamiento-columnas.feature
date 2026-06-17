# language: es

Característica: Reordenamiento de Columnas en PxF Ambulatorio
  Como Gestor TA
  Quiero reordenar las columnas de las tablas
  Para personalizar la visualización según mis necesidades

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a "PxF Ambulatorio"

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - TABLA PROTOCOLO
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-01 - Mover columna de derecha a izquierda en tabla Protocolo
    Dado que estoy visualizando la tabla "Protocolo"
    Y las columnas están en el orden original:
      | Posición | Columna      |
      | 1        | Protocolo    |
      | 2        | Total cant.  |
      | 3        | Total monto  |
      | 4        | PxS cant.    |
      | 5        | PxS monto    |
    Cuando arrastro la columna "Total monto" (posición 3) hacia la izquierda
    Y la suelto en la posición 2
    Entonces la columna "Total monto" debe moverse a la posición 2
    Y la columna "Total cant." debe desplazarse a la posición 3
    Y el nuevo orden debe ser: Protocolo, Total monto, Total cant., PxS cant., ...

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-02 - Mover columna de izquierda a derecha en tabla Protocolo
    Dado que estoy visualizando la tabla "Protocolo"
    Cuando arrastro la columna "Total cant." (posición 2)
    Y la suelto después de "PxS monto" (posición 5)
    Entonces la columna "Total cant." debe moverse después de la posición 5
    Y las columnas intermedias deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-03 - Mover columna al inicio de la tabla Protocolo
    Dado que estoy visualizando la tabla "Protocolo"
    Y la columna "CPM monto" está en la última posición
    Cuando arrastro "CPM monto" hasta la primera posición
    Y la suelto antes de "Protocolo"
    Entonces "CPM monto" debe moverse a la primera posición
    Y "Protocolo" debe desplazarse a la segunda posición
    Y todas las demás columnas deben desplazarse una posición a la derecha

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-04 - Mover columna al final de la tabla Protocolo
    Dado que estoy visualizando la tabla "Protocolo"
    Y la columna "Total cant." está en la posición 2
    Cuando arrastro "Total cant." hasta el final
    Y la suelto después de "CPM monto"
    Entonces "Total cant." debe moverse a la última posición
    Y las columnas entre la posición 2 y la última deben desplazarse una posición a la izquierda

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - TABLA ADMISIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-05 - Mover columnas en tabla Admisión
    Dado que estoy visualizando la tabla "Admisión"
    Y las columnas están en el orden original:
      | Posición | Columna        |
      | 1        | Tipo           |
      | 2        | Total cant.    |
      | 3        | Total monto    |
      | 4        | PxS cant.      |
      | 5        | PxS monto      |
      | 6        | Cápita cant    |
      | 7        | Cápita monto   |
    Cuando arrastro "Total monto" y la suelto antes de "Total cant."
    Entonces el orden debe cambiar correctamente
    Y todas las filas deben reflejar el nuevo orden de columnas

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - TABLA FACTURACIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-06 - Mover columnas en tabla Facturación
    Dado que estoy visualizando la tabla "Facturación"
    Cuando arrastro "PxS cant." y la suelto antes de "Total cant."
    Entonces el orden debe cambiar correctamente
    Y todas las filas deben reflejar el nuevo orden de columnas

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-07 - Indicador visual durante el arrastre
    Dado que estoy visualizando cualquier tabla
    Cuando empiezo a arrastrar la columna "Total monto"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea o marcador indicando dónde se soltará la columna
    Y el cursor debe cambiar para indicar la acción de arrastre
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces el indicador de posición debe actualizarse dinámicamente

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-08 - Cancelar arrastre sin soltar
    Dado que he empezado a arrastrar la columna "PxS monto"
    Cuando presiono la tecla ESC
    O arrastro la columna fuera de la tabla
    Entonces el arrastre debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

  # ========================================================================
  # TÉCNICA: TODAS LAS COLUMNAS SON MOVIBLES
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: REORD-09 - Todas las columnas pueden moverse
    Dado que estoy visualizando la tabla "<tabla>"
    Cuando intento arrastrar cada columna de la tabla
    Entonces todas las columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

    Ejemplos:
      | tabla        |
      | Protocolo    |
      | Admisión     |
      | Facturación  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DATOS PRESENTES
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-10 - Los datos se mantienen al reordenar columnas
    Dado que estoy visualizando la tabla "Protocolo"
    Y la fila "Con sustentos completos" tiene:
      | Columna      | Valor             |
      | Total cant.  | 25647             |
      | Total monto  | S/ 13,263,575.08  |
    Cuando reordeno las columnas moviendo "Total monto" antes de "Total cant."
    Entonces los datos de la fila deben mantenerse correctos:
      | Nueva posición | Columna      | Valor             |
      | 2              | Total monto  | S/ 13,263,575.08  |
      | 3              | Total cant.  | 25647             |
    Y NO debe haber pérdida de datos ni mezcla de valores

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON FILTROS Y ORDENAMIENTO ACTIVOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-11 - Reordenar columnas con filtros aplicados
    Dado que he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y las tablas muestran datos filtrados
    Cuando reordeno las columnas de la tabla "Admisión"
    Entonces los filtros deben mantenerse activos
    Y los datos filtrados deben mostrarse en el nuevo orden de columnas

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-12 - Reordenar columnas con ordenamiento activo
    Dado que la tabla "Facturación" está ordenada por "Total cant." descendente
    Y se muestra el indicador de orden (↓)
    Cuando reordeno las columnas moviendo "Total cant." a otra posición
    Entonces el ordenamiento debe mantenerse activo
    Y el indicador (↓) debe moverse junto con la columna
    Y los datos deben seguir ordenados por "Total cant." descendente

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-13 - Realizar múltiples reordenamientos consecutivos
    Dado que estoy visualizando la tabla "Protocolo"
    Cuando muevo "Total monto" de la posición 3 a la posición 2
    Y luego muevo "PxS cant." de la posición 4 a la posición 1
    Y luego muevo "Total cant." de la posición 4 a la posición 6
    Entonces todas las columnas deben estar en las nuevas posiciones correctas
    Y el orden final debe reflejar todos los cambios realizados

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL REORDENAMIENTO
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-14 - El reordenamiento persiste al hacer scroll
    Dado que he reordenado las columnas de la tabla "Admisión"
    Cuando hago scroll hacia abajo en la página
    Entonces el orden de las columnas debe mantenerse
    Y los encabezados deben seguir mostrando el orden personalizado

  @gestorTA @pxfAmbulatorio @unhappyPath
  Escenario: REORD-15 - El reordenamiento NO persiste al recargar la página
    Dado que he reordenado las columnas de la tabla "Facturación" a un orden personalizado
    Cuando refresco la página del navegador
    Entonces las columnas deben volver a su orden original por defecto
    Y NO debe mantenerse el orden personalizado

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO INDEPENDIENTE POR TABLA
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-16 - El reordenamiento es independiente por tabla
    Dado que he reordenado las columnas de la tabla "Protocolo"
    Cuando visualizo la tabla "Admisión"
    Entonces las columnas de "Admisión" deben estar en su orden original
    Y NO deben estar afectadas por el reordenamiento de "Protocolo"

  # ========================================================================
  # TÉCNICA: ACCESIBILIDAD Y USABILIDAD
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-17 - Cursor indica que columna es arrastrable
    Cuando paso el mouse sobre el encabezado de una columna en cualquier tabla
    Entonces el cursor debe cambiar para indicar que la columna es arrastrable
    Y debe mostrarse una pista visual (ej: ícono de mano, líneas de arrastre)

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: REORD-18 - No se puede soltar columna en posición inválida
    Dado que estoy arrastrando una columna
    Cuando intento soltarla fuera del área de la tabla
    Entonces el sistema debe rechazar el movimiento
    Y la columna debe volver a su posición original
    Y debe mostrarse una indicación visual de que la posición no es válida
