# language: es

Característica: Reordenamiento de Columnas en Lista de Encuentros de Admisión
  Como usuario del sistema AUNADOS
  Quiero reordenar las columnas de la lista de encuentros
  Para personalizar la visualización según mis necesidades operativas

  Antecedentes:
    Dado que he iniciado sesión en el sistema

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - SUPERUSUARIO Y GESTOR TA
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-01 - Mover columna de derecha a izquierda
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y las columnas están en el orden original:
      | Posición | Columna            |
      | 1        | Sede               |
      | 2        | Encuentro          |
      | 3        | Estado             |
      | 4        | Nº HC              |
      | 5        | Apellidos          |
      | 6        | Nombres            |
    Cuando arrastro la columna "Estado" (posición 3) hacia la izquierda
    Y la suelto en la posición 2
    Entonces la columna "Estado" debe moverse a la posición 2
    Y la columna "Encuentro" debe desplazarse a la posición 3
    Y el nuevo orden debe ser: Sede, Estado, Encuentro, Nº HC, ...

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-02 - Mover columna de izquierda a derecha
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando arrastro la columna "Encuentro" (posición 2)
    Y la suelto después de "Garante" (posición 10)
    Entonces la columna "Encuentro" debe moverse después de la posición 10
    Y las columnas intermedias deben reordenarse automáticamente
    Y el nuevo orden debe reflejar el cambio

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-03 - Mover columna al inicio de la grilla
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la columna "Monto" está en la última posición (15)
    Cuando arrastro "Monto" hasta la primera posición
    Y la suelto antes de "Sede"
    Entonces "Monto" debe moverse a la primera posición
    Y "Sede" debe desplazarse a la segunda posición
    Y todas las demás columnas deben desplazarse una posición a la derecha

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-04 - Mover columna al final de la grilla
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la columna "Encuentro" está en la posición 2
    Cuando arrastro "Encuentro" hasta el final
    Y la suelto después de "Monto"
    Entonces "Encuentro" debe moverse a la última posición
    Y las columnas entre la posición 2 y 15 deben desplazarse una posición a la izquierda

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO DE COLUMNAS - EJECUTIVO DE ADMISIÓN
  # ========================================================================

  @prioridadBaja @ejecutivoAdmision @happyPath
  Escenario: REORD-05 - Ejecutivo de Admisión puede reordenar columnas de su vista
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Y visualizo las columnas de mi vista restringida:
      | Posición | Columna           |
      | 1        | Encuentro         |
      | 2        | Estado            |
      | 3        | Nº HC             |
      | 4        | Apellidos         |
      | 5        | Nombres           |
      | 6        | Fecha Apert.      |
      | 7        | Prioridad         |
      | 8        | Garante           |
      | 9        | Tipo de Encuentro |
    Cuando arrastro "Apellidos" y la suelto antes de "Encuentro"
    Entonces el orden debe cambiar correctamente
    Y todas las filas deben reflejar el nuevo orden de columnas

  # ========================================================================
  # TÉCNICA: VALIDACIÓN VISUAL DURANTE EL ARRASTRE
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-06 - Indicador visual durante el arrastre
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando empiezo a arrastrar la columna "Apellidos"
    Entonces debe mostrarse un indicador visual de que la columna está siendo arrastrada
    Y debe mostrarse una línea o marcador indicando dónde se soltará la columna
    Y el cursor debe cambiar para indicar la acción de arrastre
    Cuando muevo el mouse sobre diferentes posiciones
    Entonces el indicador de posición debe actualizarse dinámicamente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-07 - Cancelar arrastre sin soltar
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he empezado a arrastrar la columna "Nombres"
    Cuando presiono la tecla ESC
    O arrastro la columna fuera de la grilla
    Entonces el arrastre debe cancelarse
    Y la columna debe volver a su posición original
    Y el orden de las columnas no debe cambiar

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: TODAS LAS COLUMNAS SON MOVIBLES
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-08 - Todas las columnas pueden moverse (Superusuario/Gestor)
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando intento arrastrar cada columna de la grilla
    Entonces todas las 15 columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @prioridadBaja @ejecutivoAdmision @happyPath
  Escenario: REORD-09 - Todas las columnas pueden moverse (Ejecutivo)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando intento arrastrar cada columna de la grilla
    Entonces todas las 9 columnas deben ser arrastrables
    Y todas las columnas deben poder moverse a cualquier posición
    Y ninguna columna debe estar bloqueada o fija

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON DATOS PRESENTES
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-10 - Los datos se mantienen al reordenar columnas
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y el encuentro "12345678" del paciente "García López, Juan" tiene:
      | Columna   | Valor              |
      | Sede      | Auna Guardia Civil |
      | Estado    | Pendiente          |
      | Monto     | S/ 2,500.00        |
    Cuando reordeno las columnas moviendo "Monto" antes de "Sede"
    Entonces los datos del encuentro deben mantenerse correctos:
      | Nueva posición | Columna | Valor              |
      | 1              | Monto   | S/ 2,500.00        |
      | 2              | Sede    | Auna Guardia Civil |
    Y NO debe haber pérdida de datos ni mezcla de valores

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON FILTROS Y ORDENAMIENTO ACTIVOS
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-11 - Reordenar columnas con filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he aplicado el filtro "Estado" = "Pendiente"
    Y la grilla muestra datos filtrados
    Cuando reordeno las columnas
    Entonces los filtros deben mantenerse activos
    Y los datos filtrados deben mostrarse en el nuevo orden de columnas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-12 - Reordenar columnas con ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y la grilla está ordenada por "Apellidos" descendente
    Y se muestra el indicador de orden (↓)
    Cuando reordeno las columnas moviendo "Apellidos" a otra posición
    Entonces el ordenamiento debe mantenerse activo
    Y el indicador (↓) debe moverse junto con la columna
    Y los datos deben seguir ordenados por "Apellidos" descendente

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO CON BÚSQUEDA ACTIVA
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-13 - Reordenar columnas con búsqueda activa
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he realizado una búsqueda por "García"
    Y la grilla muestra resultados filtrados
    Cuando reordeno las columnas
    Entonces la búsqueda debe mantenerse activa
    Y los resultados de búsqueda deben mostrarse en el nuevo orden de columnas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: MÚLTIPLES REORDENAMIENTOS
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: REORD-14 - Realizar múltiples reordenamientos consecutivos
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando muevo "Estado" de la posición 3 a la posición 1
    Y luego muevo "Garante" de la posición 10 a la posición 2
    Y luego muevo "Monto" de la posición 15 a la posición 4
    Entonces todas las columnas deben estar en las nuevas posiciones correctas
    Y el orden final debe reflejar todos los cambios realizados

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL REORDENAMIENTO
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-15 - El reordenamiento persiste al hacer scroll infinito
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he reordenado las columnas
    Y visualizo los primeros 50 registros
    Cuando hago scroll infinito para cargar los siguientes 50 registros
    Entonces el orden de las columnas debe mantenerse
    Y los nuevos registros deben mostrarse con el orden personalizado

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Esquema del escenario: REORD-16 - El reordenamiento NO persiste al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he reordenado las columnas a un orden personalizado
    Cuando refresco la página del navegador
    Entonces las columnas deben volver a su orden original por defecto
    Y NO debe mantenerse el orden personalizado

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: REORDENAMIENTO Y RESTABLECER VISTA
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-17 - Restablecer Vista elimina el reordenamiento
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he reordenado las columnas
    Cuando presiono el botón "Restablecer Vista"
    Entonces el orden de las columnas debe volver al estado original
    Y NO debe mantenerse el reordenamiento personalizado

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: ACCESIBILIDAD Y USABILIDAD
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-18 - Cursor indica que columna es arrastrable
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando paso el mouse sobre el encabezado de una columna
    Entonces el cursor debe cambiar para indicar que la columna es arrastrable
    Y debe mostrarse una pista visual (ej: ícono de mano, líneas de arrastre)

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-19 - No se puede soltar columna en posición inválida
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y estoy arrastrando una columna
    Cuando intento soltarla fuera del área de la grilla
    Entonces el sistema debe rechazar el movimiento
    Y la columna debe volver a su posición original
    Y debe mostrarse una indicación visual de que la posición no es válida

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON COLUMNAS REORDENADAS
  # ========================================================================

  @prioridadBaja @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Esquema del escenario: REORD-20 - El archivo exportado mantiene orden original
    Dado que soy un usuario con rol "<rol>"
    Y estoy en la pantalla "Lista de Encuentros"
    Y he reordenado las columnas en pantalla
    Cuando exporto los datos a Excel
    Entonces el archivo Excel debe contener las columnas en su orden original
    Y NO debe reflejar el reordenamiento personalizado de pantalla

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
      | Ejecutivo de Admisión      |
