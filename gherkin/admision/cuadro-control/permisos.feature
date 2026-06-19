# language: es

Característica: Permisos de Acceso a Cuadro de Control Admisión
  Como sistema AUNADOS
  Quiero controlar el acceso al Cuadro de Control Admisión
  Para que solo Superusuario de Admisión y Gestor TA puedan visualizar las métricas

  # ========================================================================
  # TÉCNICA: CONTROL DE ACCESO - ROLES AUTORIZADOS
  # CONSOLIDACIÓN: PERM-01, PERM-02, PERM-03 → PERM-01
  # ========================================================================

  @autoP0 @prioridadExtrema @cuadroControlAdmision @happyPath
  Esquema del escenario: PERM-01 - Roles autorizados pueden acceder a Cuadro de Control Admisión
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol_autorizado>"
    Cuando accedo a "Cuadro de control Admisión"
    Entonces el sistema debe mostrar la pantalla "Cuadro de control Admisión"
    Y debe mostrarse el título "Cuadro de control Admisión"
    Y debo poder visualizar las 3 tarjetas de métricas
    Y debo poder visualizar las 4 tablas de información
    Y debo poder visualizar datos de todas las sedes
    Y debo poder visualizar datos de todos los ejecutivos de admisión
    Y no debo tener restricciones por sede ni ejecutivo

    Ejemplos:
      | rol_autorizado           |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: RESTRICCIÓN DE ACCESO - ROLES NO AUTORIZADOS
  # CONSOLIDACIÓN: PERM-04, PERM-05, PERM-06 → PERM-02
  # ========================================================================

  @autoP0 @prioridadExtrema @cuadroControlAdmision @unhappyPath
  Esquema del escenario: PERM-02 - Roles NO autorizados NO pueden acceder a Cuadro de Control Admisión
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "<rol_no_autorizado>"
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe bloquear el acceso
    Y debe mostrarse un mensaje "No tiene permisos para acceder a esta funcionalidad"
    Y debe redirigirme a "<pantalla_redireccion>"

    Ejemplos:
      | rol_no_autorizado          | pantalla_redireccion   |
      | Responsable de Facturación | pantalla principal     |
      | Ejecutivo de Facturación   | pantalla principal     |
      | Ejecutivo de Admisión      | Lista de encuentros    |

  # ========================================================================
  # TÉCNICA: ACCESO SIN AUTENTICACIÓN
  # ========================================================================

  @prioridadExtrema @cuadroControlAdmision @unhappyPath
  Escenario: PERM-03 - Usuario no autenticado no puede acceder
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder a "Cuadro de control Admisión"
    Entonces el sistema debe redirigirme a la página de login
    Y debe mostrarse el mensaje "Debe iniciar sesión para continuar"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE NAVEGACIÓN EN MENÚ
  # CONSOLIDACIÓN: PERM-08, PERM-09, PERM-10 → PERM-04
  # ========================================================================

  @autoP0 @prioridadExtrema @cuadroControlAdmision
  Esquema del escenario: PERM-04 - Validar visibilidad de opción en menú según rol
    Dado que he iniciado sesión como "<rol>"
    Cuando visualizo el menú de navegación
    Entonces la opción "Cuadro de control Admisión" <debe_aparecer>
    Y solo debo ver las opciones permitidas para mi rol: "<opciones_visibles>"

    Ejemplos:
      | rol                      | debe_aparecer              | opciones_visibles                    |
      | Superusuario de Admisión | debe mostrarse             | Cuadro de control Admisión          |
      | Gestor TA                | debe mostrarse             | Cuadro de control Admisión          |
      | Ejecutivo de Admisión    | NO debe mostrarse          | Lista de encuentros                 |
      | Responsable de Facturación| NO debe mostrarse         | Opciones de Facturación             |
      | Ejecutivo de Facturación | NO debe mostrarse          | Pendientes por Facturar             |

# ========================================================================
# RESULTADO DE OPTIMIZACIÓN:
#
# ANTES:  10 escenarios, 0 BVA (no aplica), 3 grupos redundantes
# DESPUÉS: 4 escenarios, 0 redundancias
# AHORRO: -60% escenarios (misma cobertura)
#
# CONSOLIDACIONES REALIZADAS:
# 1. PERM-01/02/03 → PERM-01 (roles autorizados)
# 2. PERM-04/05/06 → PERM-02 (roles NO autorizados)
# 3. PERM-08/09/10 → PERM-04 (visibilidad en menú)
# 4. PERM-07 → PERM-03 (sin cambios)
#
# MEJORAS ADICIONALES:
# - Convertidos a Esquema del escenario para mejor parametrización
# - Agregado redirección específica por rol
# - Agregado opciones visibles por rol para mayor cobertura
# - Todos los escenarios ahora incluyen validaciones completas
# ========================================================================
