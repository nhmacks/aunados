# language: es

Característica: Reordenamiento de Columnas en Lista de Encuentros para Asignar
  Como Responsable de Facturación
  Quiero reordenar las columnas de la tabla de encuentros
  Para personalizar la visualización según mis necesidades

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Lista de encuentros para asignar"

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-01 - Mover columna de derecha a izquierda
    Dado que estoy visualizando la tabla de encuentros
    Y las columnas están en el orden original:
      | Posición | Columna           |
      | 1        | Encuentro         |
      | 2        | Clasific.         |
      | 3        | Sede              |
      | 4        | Apellidos         |
      | 5        | Nombres           |
      | 6        | Garante           |
    Cuando arrastro la columna "Sede" (posición 3) hacia la izquierda
    Y la suelto en la posición 2
    Entonces la columna "Sede" debe moverse a la posición 2
    Y la columna "Clasific." debe desplazarse a la posición 3
    Y el nuevo orden debe ser: Encuentro, Sede, Clasific., Apellidos, ...

  @responsableFacturacion @happyPath
  Escenario: REORD-02 - Mover columna de izquierda a derecha
    Dado que estoy visualizando la tabla de encuentros
    Cuando arrastro la columna "Clasific." (posición 2)
    Y la suelto después de "Garante" (posición 6)
    Entonces la columna "Clasific." debe moverse después de la posición 6
    Y las columnas intermedias deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

  @responsableFacturacion @happyPath
  Escenario: REORD-03 - Mover columna al inicio de la tabla
    Dado que estoy visualizando la tabla de encuentros
    Y la columna "Fact. Fin" está en la última posición (15)
    Cuando arrastro "Fact. Fin" hasta la primera posición
    Y la suelto antes de "Encuentro"
    Entonces "Fact. Fin" debe moverse a la primera posición
    Y "Encuentro" debe desplazarse a la segunda posición
    Y todas las demás columnas deben desplazarse una posición a la derecha

  @responsableFacturacion @happyPath
  Escenario: REORD-04 - Mover columna al final de la tabla
    Dado que estoy visualizando la tabla de encuentros
    Y la columna "Encuentro" está en la posición 1
    Cuando arrastro "Encuentro" hasta el final
    Y la suelto después de "Fact. Fin"
    Entonces "Encuentro" debe moverse a la última posición
    Y las columnas entre la posición 1 y 15 deben desplazarse una posición a la izquierda

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-05 - Indicador visual durante el arrastre
    Cuando empiezo a arrastrar la columna "Garante"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea o marcador indicando dónde se soltará la columna
    Y el cursor debe cambiar para indicar la acción de arrastre
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces el indicador de posición debe actualizarse dinámicamente

  @responsableFacturacion @happyPath
  Escenario: REORD-06 - Cancelar arrastre sin soltar
    Dado que he empezado a arrastrar la columna "Apellidos"
    Cuando presiono la tecla ESC
    O arrastro la columna fuera de la tabla
    Entonces el arrastre debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

  # ========================================================================
  # TÉCNICA: TODAS LAS COLUMNAS SON MOVIBLES
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-07 - Todas las columnas pueden moverse
    Cuando intento arrastrar cada columna de la tabla
    Entonces todas las 15 columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DATOS PRESENTES
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-08 - Los datos se mantienen al reordenar columnas
    Dado que el encuentro "12345678" del paciente "García Pérez, Juan" tiene:
      | Columna      | Valor              |
      | Sede         | Auna Guardia Civil |
      | Garante      | PACIFICO SEGUROS   |
      | Por Fact. Fin| S/ 1,500.00        |
    Cuando reordeno las columnas moviendo "Por Fact. Fin" antes de "Sede"
    Entonces los datos del encuentro deben mantenerse correctos:
      | Nueva posición | Columna       | Valor              |
      | 3              | Por Fact. Fin | S/ 1,500.00        |
      | 4              | Sede          | Auna Guardia Civil |
    Y NO debe haber pérdida de datos ni mezcla de valores

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON BÚSQUEDA Y ORDENAMIENTO ACTIVOS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-09 - Reordenar columnas con búsqueda aplicada
    Dado que he buscado encuentros por "García"
    Y la tabla muestra resultados filtrados
    Cuando reordeno las columnas
    Entonces la búsqueda debe mantenerse activa
    Y los datos filtrados deben mostrarse en el nuevo orden de columnas

  @responsableFacturacion @happyPath
  Escenario: REORD-10 - Reordenar columnas con ordenamiento activo
    Dado que la tabla está ordenada por "Apellidos" descendente
    Y se muestra el indicador de orden (↓)
    Cuando reordeno las columnas moviendo "Apellidos" a otra posición
    Entonces el ordenamiento debe mantenerse activo
    Y el indicador (↓) debe moverse junto con la columna
    Y los datos deben seguir ordenados por "Apellidos" descendente

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO Y SELECCIÓN DE REGISTROS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-11 - La selección se mantiene al reordenar columnas
    Dado que he seleccionado 10 encuentros con sus checkboxes marcados
    Y el contador muestra "10 registro seleccionado de 25040"
    Cuando reordeno las columnas
    Entonces los 10 encuentros deben seguir seleccionados
    Y sus checkboxes deben permanecer marcados
    Y el contador debe seguir mostrando "10 registro seleccionado de 25040"

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-12 - Realizar múltiples reordenamientos consecutivos
    Cuando muevo "Sede" de la posición 3 a la posición 1
    Y luego muevo "Garante" de la posición 6 a la posición 2
    Y luego muevo "Por Fact. Fin" de la posición 13 a la posición 4
    Entonces todas las columnas deben estar en las nuevas posiciones correctas
    Y el orden final debe reflejar todos los cambios realizados

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL REORDENAMIENTO
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-13 - El reordenamiento persiste al hacer scroll
    Dado que he reordenado las columnas
    Cuando hago scroll vertical en la tabla
    Entonces el orden de las columnas debe mantenerse
    Y los encabezados deben seguir mostrando el orden personalizado

  @responsableFacturacion @unhappyPath
  Escenario: REORD-14 - El reordenamiento NO persiste al recargar la página
    Dado que he reordenado las columnas a un orden personalizado
    Cuando refresco la página del navegador
    Entonces las columnas deben volver a su orden original por defecto
    Y NO debe mantenerse el orden personalizado

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO Y RESTABLECER VISTA
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-15 - Restablecer vista elimina el reordenamiento
    Dado que he reordenado las columnas
    Cuando presiono el botón "Restablecer vista"
    Entonces el orden de las columnas debe volver al estado original
    Y NO debe mantenerse el reordenamiento personalizado

  # ========================================================================
  # TÉCNICA: ACCESIBILIDAD Y USABILIDAD
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-16 - Cursor indica que columna es arrastrable
    Cuando paso el mouse sobre el encabezado de una columna
    Entonces el cursor debe cambiar para indicar que la columna es arrastrable
    Y debe mostrarse una pista visual (ej: ícono de mano, líneas de arrastre)

  @responsableFacturacion @happyPath
  Escenario: REORD-17 - No se puede soltar columna en posición inválida
    Dado que estoy arrastrando una columna
    Cuando intento soltarla fuera del área de la tabla
    Entonces el sistema debe rechazar el movimiento
    Y la columna debe volver a su posición original
    Y debe mostrarse una indicación visual de que la posición no es válida

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO Y FUNCIONALIDADES DE ACCIÓN
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: REORD-18 - Los botones funcionan después de reordenar columnas
    Dado que he reordenado las columnas
    Y he seleccionado 5 encuentros
    Cuando intento usar el botón "Asignar"
    Entonces el botón "Asignar" debe funcionar correctamente
    Y debe abrir el modal de asignación con los 5 encuentros seleccionados

  @responsableFacturacion @happyPath
  Escenario: REORD-19 - El botón Descargar funciona con columnas reordenadas
    Dado que he reordenado las columnas
    Cuando presiono el botón "Descargar"
    Entonces el archivo Excel debe generarse correctamente
    Y debe contener todas las columnas en su orden original (no el reordenado)
