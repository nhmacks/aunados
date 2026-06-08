# language: es

Característica: Visualización de Información de Ejecutivos en Asignación Masiva
  Como Responsable de Facturación
  Quiero visualizar la información de carga de trabajo de los ejecutivos
  Para tomar decisiones informadas sobre asignaciones masivas

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Asignaciones masivas"
    Y he aplicado filtros y realizado una búsqueda exitosa
    Y he seleccionado garantes de la tabla
    Y he abierto el modal de asignación masiva

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE EJECUTIVO SIN ENCUENTROS
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: VIS-EJE-01 - Visualizar ejecutivo sin encuentros en su bandeja
    Dado que el ejecutivo de facturación "Ejecutivo 7" NO tiene encuentros asignados
    Cuando selecciono al "Ejecutivo 7" en el modal de asignación
    Entonces debe mostrarse el nombre y apellidos completos del ejecutivo
    Y debe mostrarse "En bandeja: 0"
    Y debe mostrarse "Asignados ahora: 0"
    Y debe estar disponible la opción "Ver más"
    Y el ejecutivo debe estar disponible para asignar los "<cantidad_garantes>" seleccionados

    Ejemplos:
      | cantidad_garantes |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Escenario: VIS-EJE-02 - Expandir información detallada de ejecutivo sin encuentros
    Dado que el ejecutivo "Ejecutivo 7" NO tiene encuentros asignados
    Y he seleccionado al "Ejecutivo 7" en el modal
    Cuando selecciono la opción "Ver más"
    Entonces debe mostrarse "En revisión: 0"
    Y debe mostrarse "Por facturar: 0"
    Y debe mostrarse "Regularizado: 0"
    Y debe mostrarse "No facturable: 0"
    Y debe mostrarse "Error de facturación: 0"
    Y todos los contadores deben estar en 0

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE EJECUTIVO CON ENCUENTROS
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: VIS-EJE-03 - Visualizar ejecutivo con encuentros en su bandeja
    Dado que el ejecutivo "Ejecutivo 5" tiene encuentros en diferentes estados:
      | Estado               | Cantidad |
      | Por facturar         | 2        |
      | Regularizado         | 2        |
      | No facturable        | 2        |
      | Error de facturación | 2        |
      | En revisión          | 1        |
    Cuando selecciono al "Ejecutivo 5" en el modal de asignación
    Entonces debe mostrarse el nombre y apellidos completos del ejecutivo
    Y debe mostrarse "En bandeja: 9"
    Y debe mostrarse "Asignados ahora: 0"
    Y debe estar disponible la opción "Ver más"
    Y el ejecutivo debe estar disponible para asignar los "<cantidad_garantes>" seleccionados

    Ejemplos:
      | cantidad_garantes |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Escenario: VIS-EJE-04 - Expandir información detallada de ejecutivo con encuentros
    Dado que el ejecutivo "Ejecutivo 5" tiene encuentros en diferentes estados:
      | Estado               | Cantidad |
      | Por facturar         | 2        |
      | Regularizado         | 2        |
      | No facturable        | 2        |
      | Error de facturación | 2        |
      | En revisión          | 1        |
    Y he seleccionado al "Ejecutivo 5" en el modal
    Cuando selecciono la opción "Ver más"
    Entonces debe mostrarse "En revisión: 1"
    Y debe mostrarse "Por facturar: 2"
    Y debe mostrarse "Regularizado: 2"
    Y debe mostrarse "No facturable: 2"
    Y debe mostrarse "Error de facturación: 2"
    Y el total de "En bandeja" debe sumar correctamente 9 encuentros

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE EJECUTIVO QUE DEVOLVIÓ ENCUENTROS
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: VIS-EJE-05 - Visualizar ejecutivo que devolvió encuentros a admisión
    Dado que el ejecutivo "Ejecutivo 3" tiene encuentros en diferentes estados:
      | Estado       | Cantidad |
      | Por facturar | 2        |
      | Devueltos    | 1        |
    Cuando selecciono al "Ejecutivo 3" en el modal de asignación
    Entonces debe mostrarse el nombre y apellidos completos del ejecutivo
    Y debe mostrarse "En bandeja: 2"
    Y debe mostrarse "Asignados ahora: 0"
    Y debe estar disponible la opción "Ver más"
    Y el ejecutivo debe estar disponible para asignar los "<cantidad_garantes>" seleccionados
    Y NO deben contabilizarse los encuentros "Devueltos" en "En bandeja"

    Ejemplos:
      | cantidad_garantes |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Escenario: VIS-EJE-06 - Expandir información de ejecutivo que devolvió encuentros
    Dado que el ejecutivo "Ejecutivo 3" tiene encuentros:
      | Estado       | Cantidad |
      | Por facturar | 2        |
      | Devueltos    | 1        |
    Y he seleccionado al "Ejecutivo 3" en el modal
    Cuando selecciono la opción "Ver más"
    Entonces debe mostrarse "En revisión: 0"
    Y debe mostrarse "Por facturar: 2"
    Y debe mostrarse "Regularizado: 0"
    Y debe mostrarse "No facturable: 0"
    Y debe mostrarse "Error de facturación: 0"
    Y NO debe mostrarse el estado "Devueltos" en el desglose
    Y el total debe ser 2 encuentros

  # ========================================================================
  # TÉCNICA: ACTUALIZACIÓN DINÁMICA AL CONFIGURAR ASIGNACIÓN
  # ========================================================================

  @responsableFacturacion
  Escenario: VIS-EJE-07 - Actualizar contador "Asignados ahora" al configurar sedes
    Dado que el ejecutivo "Ejecutivo 7" tiene "En bandeja: 0"
    Y he seleccionado al "Ejecutivo 7" en el modal
    Y el contador muestra "Asignados ahora: 0"
    Cuando configuro una sede con 15 encuentros
    Entonces el contador debe actualizarse a "Asignados ahora: 15"
    Y "En bandeja" debe permanecer en 0
    Y el total proyectado debe ser 15 encuentros

  @responsableFacturacion
  Escenario: VIS-EJE-08 - Actualizar contador al agregar múltiples sedes
    Dado que el ejecutivo "Ejecutivo 5" tiene "En bandeja: 9"
    Y he seleccionado al "Ejecutivo 5" en el modal
    Cuando configuro la "Sede Delgado" con 10 encuentros
    Y configuro la "Sede San Isidro" con 20 encuentros
    Y configuro la "Sede Guardia Civil" con 15 encuentros
    Entonces el contador debe mostrar "Asignados ahora: 45"
    Y "En bandeja" debe permanecer en 9
    Y el total proyectado debe ser 54 encuentros (9 + 45)

  @responsableFacturacion
  Escenario: VIS-EJE-09 - Actualizar contador al eliminar una sede
    Dado que he configurado 3 sedes con un total de 45 encuentros
    Y el contador muestra "Asignados ahora: 45"
    Cuando elimino una sede que tenía 15 encuentros
    Entonces el contador debe actualizarse a "Asignados ahora: 30"
    Y el total proyectado debe recalcularse correctamente

  @responsableFacturacion
  Escenario: VIS-EJE-10 - Contador vuelve a cero al limpiar todas las sedes
    Dado que he configurado sedes con un total de 45 encuentros
    Y el contador muestra "Asignados ahora: 45"
    Cuando elimino todas las sedes configuradas
    Entonces el contador debe volver a "Asignados ahora: 0"
    Y "En bandeja" debe permanecer sin cambios

  # ========================================================================
  # TÉCNICA: COMPARACIÓN ENTRE EJECUTIVOS
  # ========================================================================

  @responsableFacturacion
  Escenario: VIS-EJE-11 - Comparar carga de trabajo entre ejecutivos disponibles
    Dado que tengo 3 ejecutivos disponibles:
      | Ejecutivo   | En bandeja |
      | Ejecutivo 1 | 50         |
      | Ejecutivo 2 | 20         |
      | Ejecutivo 3 | 0          |
    Cuando visualizo la lista de ejecutivos en el modal
    Entonces los ejecutivos deben ordenarse por carga de trabajo ascendente
    Y "Ejecutivo 3" debe aparecer primero (0 encuentros)
    Y "Ejecutivo 2" debe aparecer segundo (20 encuentros)
    Y "Ejecutivo 1" debe aparecer tercero (50 encuentros)
    Y cada ejecutivo debe mostrar claramente su carga actual

  @responsableFacturacion
  Escenario: VIS-EJE-12 - Identificar visualmente ejecutivo con menor carga
    Dado que tengo ejecutivos con diferentes cargas de trabajo
    Cuando visualizo la lista de ejecutivos
    Entonces el ejecutivo con menor carga debe tener un indicador visual destacado
    Y debe mostrarse un badge "Recomendado" o similar
    Y debe facilitarse la identificación del mejor candidato para asignación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE INFORMACIÓN EN TIEMPO REAL
  # ========================================================================

  @responsableFacturacion
  Escenario: VIS-EJE-13 - Información de ejecutivo se actualiza en tiempo real
    Dado que he seleccionado al "Ejecutivo 5" con "En bandeja: 9"
    Y otro usuario asigna 5 nuevos encuentros al "Ejecutivo 5" simultáneamente
    Cuando el sistema detecta el cambio
    Entonces el contador debe actualizarse automáticamente a "En bandeja: 14"
    Y debe mostrarse una notificación "La información del ejecutivo se ha actualizado"
    Y debo poder continuar con mi asignación con la información actualizada

  @responsableFacturacion
  Escenario: VIS-EJE-14 - Validar que estados Devueltos no aparecen en visualización
    Dado que el ejecutivo tiene encuentros en estado "Devueltos"
    Cuando visualizo la información del ejecutivo con "Ver más"
    Entonces NO debe mostrarse una fila para "Devueltos"
    Y el desglose debe mostrar únicamente los estados relevantes:
      | Estado               |
      | En revisión          |
      | Por facturar         |
      | Regularizado         |
      | No facturable        |
      | Error de facturación |

  @responsableFacturacion
  Escenario: VIS-EJE-15 - Colapsar información detallada del ejecutivo
    Dado que he expandido la información del ejecutivo con "Ver más"
    Y se muestra el desglose detallado de estados
    Cuando selecciono nuevamente "Ver menos"
    Entonces debe colapsarse la información detallada
    Y debe mostrarse únicamente "En bandeja" y "Asignados ahora"
    Y el espacio del modal debe optimizarse
