# language: es

Característica: Reordenamiento de Columnas en Cuadro de Control - Enc. Asignados
  Como Responsable de Facturación o Gestor TA
  Quiero reordenar las columnas de la grilla
  Para personalizar la visualización según mis necesidades

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-01 - Mover columna de derecha a izquierda
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la grilla con las columnas en el orden original:
      | Posición | Columna              |
      | 1        | Ejecutivo            |
      | 2        | Facturado hoy        |
      | 3        | Monto fact.          |
      | 4        | Por facturar         |
      | 5        | Monto por fact.      |
      | 6        | En revisión          |
    Cuando arrastro la columna "Monto fact." (posición 3) hacia la izquierda
    Y la suelto en la posición 2
    Entonces la columna "Monto fact." debe moverse a la posición 2
    Y la columna "Facturado hoy" debe desplazarse a la posición 3
    Y el nuevo orden debe ser: Ejecutivo, Monto fact., Facturado hoy, Por facturar, ...

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-02 - Mover columna de izquierda a derecha
    Dado que soy un usuario con rol "<rol>"
    Cuando arrastro la columna "Facturado hoy" (posición 2)
    Y la suelto después de "Monto por fact." (posición 5)
    Entonces la columna "Facturado hoy" debe moverse después de la posición 5
    Y las columnas intermedias deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-03 - Mover columna al inicio de la grilla
    Dado que soy un usuario con rol "<rol>"
    Y la columna "Monto devuelto" está en la última posición
    Cuando arrastro "Monto devuelto" hasta la primera posición
    Y la suelto antes de "Ejecutivo"
    Entonces "Monto devuelto" debe moverse a la primera posición
    Y "Ejecutivo" debe desplazarse a la segunda posición
    Y todas las demás columnas deben desplazarse una posición a la derecha

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-04 - Mover columna al final de la grilla
    Dado que soy un usuario con rol "<rol>"
    Y la columna "Facturado hoy" está en la posición 2
    Cuando arrastro "Facturado hoy" hasta el final
    Y la suelto después de "Monto devuelto"
    Entonces "Facturado hoy" debe moverse a la última posición
    Y las columnas entre la posición 2 y la última deben desplazarse una posición a la izquierda

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-05 - Indicador visual durante el arrastre
    Dado que soy un usuario con rol "<rol>"
    Cuando empiezo a arrastrar la columna "Por facturar"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea o marcador indicando dónde se soltará la columna
    Y el cursor debe cambiar para indicar la acción de arrastre
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces el indicador de posición debe actualizarse dinámicamente

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-06 - Cancelar arrastre sin soltar
    Dado que soy un usuario con rol "<rol>"
    Y he empezado a arrastrar la columna "Monto por fact."
    Cuando presiono la tecla ESC
    O arrastro la columna fuera de la grilla
    Entonces el arrastre debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: TODAS LAS COLUMNAS SON MOVIBLES
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-07 - Todas las columnas pueden moverse
    Dado que soy un usuario con rol "<rol>"
    Cuando intento arrastrar cada columna de la grilla
    Entonces todas las columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DATOS PRESENTES
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-08 - Los datos se mantienen al reordenar columnas
    Dado que soy un usuario con rol "<rol>"
    Y el ejecutivo "ANDREA AMELIA PAZ CRUZ" tiene:
      | Columna       | Valor     |
      | Facturado hoy | 10        |
      | Monto fact.   | S/ 150.50 |
    Cuando reordeno las columnas moviendo "Monto fact." antes de "Facturado hoy"
    Entonces los datos del ejecutivo deben mantenerse correctos:
      | Nueva posición | Columna       | Valor     |
      | 2              | Monto fact.   | S/ 150.50 |
      | 3              | Facturado hoy | 10        |
    Y NO debe haber pérdida de datos ni mezcla de valores

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON FILTROS Y ORDENAMIENTO ACTIVOS
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-09 - Reordenar columnas con filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado el filtro "Garante" = "IAFAS PÚBLICAS"
    Y la grilla muestra datos filtrados
    Cuando reordeno las columnas
    Entonces los filtros deben mantenerse activos
    Y los datos filtrados deben mostrarse en el nuevo orden de columnas

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-10 - Reordenar columnas con ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y la grilla está ordenada por "Por facturar" descendente
    Y se muestra el indicador de orden (↓)
    Cuando reordeno las columnas moviendo "Por facturar" a otra posición
    Entonces el ordenamiento debe mantenerse activo
    Y el indicador (↓) debe moverse junto con la columna
    Y los datos deben seguir ordenados por "Por facturar" descendente

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-11 - Realizar múltiples reordenamientos consecutivos
    Dado que soy un usuario con rol "<rol>"
    Cuando muevo "Monto fact." de la posición 3 a la posición 2
    Y luego muevo "Por facturar" de la posición 4 a la posición 1
    Y luego muevo "Facturado hoy" de la posición 4 a la posición 6
    Entonces todas las columnas deben estar en las nuevas posiciones correctas
    Y el orden final debe reflejar todos los cambios realizados

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL REORDENAMIENTO
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-12 - El reordenamiento persiste al hacer scroll
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas
    Cuando hago scroll horizontal o vertical en la grilla
    Entonces el orden de las columnas debe mantenerse
    Y los encabezados deben seguir mostrando el orden personalizado

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @unhappyPath
  Esquema del escenario: REORD-13 - El reordenamiento NO persiste al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas a un orden personalizado
    Cuando refresco la página del navegador
    Entonces las columnas deben volver a su orden original por defecto
    Y NO debe mantenerse el orden personalizado

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ACCESIBILIDAD Y USABILIDAD
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-14 - Cursor indica que columna es arrastrable
    Dado que soy un usuario con rol "<rol>"
    Cuando paso el mouse sobre el encabezado de una columna
    Entonces el cursor debe cambiar para indicar que la columna es arrastrable
    Y debe mostrarse una pista visual (ej: ícono de mano, líneas de arrastre)

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-15 - No se puede soltar columna en posición inválida
    Dado que soy un usuario con rol "<rol>"
    Y estoy arrastrando una columna
    Cuando intento soltarla fuera del área de la grilla
    Entonces el sistema debe rechazar el movimiento
    Y la columna debe volver a su posición original
    Y debe mostrarse una indicación visual de que la posición no es válida

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DESPUÉS DE OTRAS ACCIONES
  # ========================================================================

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-16 - Reordenamiento se mantiene después de restablecer vista
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas
    Cuando presiono el botón "Restablecer vista"
    Entonces el orden de las columnas debe volver al estado original
    Y NO debe mantenerse el reordenamiento personalizado

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadBaja @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: REORD-17 - El reordenamiento se mantiene después de exportar
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas
    Cuando descargo el archivo Excel
    Entonces el orden de las columnas en pantalla debe mantenerse
    Y la grilla debe seguir mostrando el orden personalizado

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |
