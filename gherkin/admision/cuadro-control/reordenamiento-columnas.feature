# language: es

Característica: Reordenamiento de Columnas en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero reordenar las columnas de las tablas
  Para personalizar la visualización según mis necesidades

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - TABLA TOTAL POR EJECUTIVO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-01 - Mover columna de derecha a izquierda
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total por ejecutivo"
    Y las columnas están en el orden original:
      | Posición | Columna              |
      | 1        | Ejecutivo            |
      | 2        | Total cant.          |
      | 3        | Total monto          |
      | 4        | Lista de enc. cant.  |
      | 5        | Lista de enc. monto  |
      | 6        | Enc. devueltos cant. |
      | 7        | Enc. devueltos monto |
    Cuando arrastro la columna "Total monto" (posición 3) hacia la izquierda
    Y la suelto en la posición 2
    Entonces la columna "Total monto" debe moverse a la posición 2
    Y la columna "Total cant." debe desplazarse a la posición 3
    Y el nuevo orden debe ser: Ejecutivo, Total monto, Total cant., Lista de enc. cant., ...

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-02 - Mover columna de izquierda a derecha
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total por ejecutivo"
    Cuando arrastro la columna "Total cant." (posición 2)
    Y la suelto después de "Lista de enc. cant." (posición 4)
    Entonces la columna "Total cant." debe moverse después de la posición 4
    Y las columnas intermedias deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-03 - Mover columna al inicio de la tabla
    Dado que soy un usuario con rol "<rol>"
    Y la columna "Enc. devueltos monto" está en la última posición (7)
    Cuando arrastro "Enc. devueltos monto" hasta la primera posición
    Y la suelto antes de "Ejecutivo"
    Entonces "Enc. devueltos monto" debe moverse a la primera posición
    Y "Ejecutivo" debe desplazarse a la segunda posición
    Y todas las demás columnas deben desplazarse una posición a la derecha

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-04 - Mover columna al final de la tabla
    Dado que soy un usuario con rol "<rol>"
    Y la columna "Total cant." está en la posición 2
    Cuando arrastro "Total cant." hasta el final
    Y la suelto después de "Enc. devueltos monto"
    Entonces "Total cant." debe moverse a la última posición
    Y las columnas entre la posición 2 y 7 deben desplazarse una posición a la izquierda

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-05 - Indicador visual durante el arrastre
    Dado que soy un usuario con rol "<rol>"
    Cuando empiezo a arrastrar la columna "Total monto"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea o marcador indicando dónde se soltará la columna
    Y el cursor debe cambiar para indicar la acción de arrastre
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces el indicador de posición debe actualizarse dinámicamente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-06 - Cancelar arrastre sin soltar
    Dado que soy un usuario con rol "<rol>"
    Y he empezado a arrastrar la columna "Lista de enc. monto"
    Cuando presiono la tecla ESC
    O arrastro la columna fuera de la tabla
    Entonces el arrastre debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO EN TABLA TOTAL DE ENCUENTROS POR ESTADO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-07 - Mover columnas en tabla Total de encuentros por estado
    Dado que soy un usuario con rol "<rol>"
    Y estoy visualizando la tabla "Total de encuentros por estado"
    Y las columnas están en el orden original:
      | Posición | Columna           |
      | 1        | Tipo de estado    |
      | 2        | Estado            |
      | 3        | Total cant.       |
      | 4        | Total monto       |
      | 5        | Lista enc. cant.  |
      | 6        | Lista enc. monto  |
      | 7        | Enc. dev. cant.   |
      | 8        | Enc. dev. monto   |
    Cuando arrastro "Total monto" y la suelto antes de "Total cant."
    Entonces el orden debe cambiar correctamente
    Y todas las filas deben reflejar el nuevo orden de columnas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: TODAS LAS COLUMNAS SON MOVIBLES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-08 - Todas las columnas pueden moverse
    Dado que soy un usuario con rol "<rol>"
    Cuando intento arrastrar cada columna de la tabla "<tabla>"
    Entonces todas las columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

    Ejemplos:
      | rol                        | tabla                           |
      | Superusuario de Admisión   | Total por ejecutivo             |
      | Gestor TA                  | Total de encuentros por estado  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DATOS PRESENTES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-09 - Los datos se mantienen al reordenar columnas
    Dado que soy un usuario con rol "<rol>"
    Y el ejecutivo "Abigail Bisquert Luz I" tiene:
      | Columna       | Valor        |
      | Total cant.   | 10           |
      | Total monto   | S/ 2,148.87  |
    Cuando reordeno las columnas moviendo "Total monto" antes de "Total cant."
    Entonces los datos del ejecutivo deben mantenerse correctos:
      | Nueva posición | Columna       | Valor        |
      | 2              | Total monto   | S/ 2,148.87  |
      | 3              | Total cant.   | 10           |
    Y NO debe haber pérdida de datos ni mezcla de valores

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON FILTROS Y ORDENAMIENTO ACTIVOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-10 - Reordenar columnas con filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y la tabla muestra datos filtrados
    Cuando reordeno las columnas
    Entonces los filtros deben mantenerse activos
    Y los datos filtrados deben mostrarse en el nuevo orden de columnas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-11 - Reordenar columnas con ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y la tabla está ordenada por "Total cant." descendente
    Y se muestra el indicador de orden (↓)
    Cuando reordeno las columnas moviendo "Total cant." a otra posición
    Entonces el ordenamiento debe mantenerse activo
    Y el indicador (↓) debe moverse junto con la columna
    Y los datos deben seguir ordenados por "Total cant." descendente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-12 - Realizar múltiples reordenamientos consecutivos
    Dado que soy un usuario con rol "<rol>"
    Cuando muevo "Total monto" de la posición 3 a la posición 2
    Y luego muevo "Lista de enc. cant." de la posición 4 a la posición 1
    Y luego muevo "Total cant." de la posición 4 a la posición 6
    Entonces todas las columnas deben estar en las nuevas posiciones correctas
    Y el orden final debe reflejar todos los cambios realizados

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL REORDENAMIENTO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-13 - El reordenamiento persiste al hacer scroll
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas
    Cuando hago scroll hacia abajo en la tabla
    Entonces el orden de las columnas debe mantenerse
    Y los encabezados deben seguir mostrando el orden personalizado

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: REORD-14 - El reordenamiento NO persiste al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas a un orden personalizado
    Cuando refresco la página del navegador
    Entonces las columnas deben volver a su orden original por defecto
    Y NO debe mantenerse el orden personalizado

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO EN DIFERENTES TABLAS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-15 - El reordenamiento es independiente por tabla
    Dado que soy un usuario con rol "<rol>"
    Y he reordenado las columnas de la tabla "Total por ejecutivo"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces las columnas de esta tabla deben estar en su orden original
    Y NO deben estar afectadas por el reordenamiento de la otra tabla

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ACCESIBILIDAD Y USABILIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-16 - Cursor indica que columna es arrastrable
    Dado que soy un usuario con rol "<rol>"
    Cuando paso el mouse sobre el encabezado de una columna
    Entonces el cursor debe cambiar para indicar que la columna es arrastrable
    Y debe mostrarse una pista visual (ej: ícono de mano, líneas de arrastre)

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: REORD-17 - No se puede soltar columna en posición inválida
    Dado que soy un usuario con rol "<rol>"
    Y estoy arrastrando una columna
    Cuando intento soltarla fuera del área de la tabla
    Entonces el sistema debe rechazar el movimiento
    Y la columna debe volver a su posición original
    Y debe mostrarse una indicación visual de que la posición no es válida

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
