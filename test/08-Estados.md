# 08-Estados.md

# Catálogo de Estados Operativos

## 1. Objetivo

Definir los estados operativos que pueden asignarse a un encuentro dentro de la bandeja de Admisión, así como su significado funcional, restricciones, responsables y comportamiento dentro del sistema.

---

# 2. Conceptos Fundamentales

## 2.1 Estado Operativo

Representa la situación de gestión de un encuentro.

Permite a los usuarios comunicar el avance o condición operativa del encuentro.

---

## 2.2 Bandeja Operativa

Representa la ubicación actual del encuentro dentro del flujo:

- Admisión
- Protocolo
- Facturación

---

## 2.3 Diferencia entre Estado y Bandeja

Los estados operativos NO determinan la bandeja.

La bandeja es determinada exclusivamente por el Job de Admisión.

Ejemplo:

Bandeja:
- Admisión

Estado:
- Tramitado

Resultado:
- El encuentro continúa en Admisión hasta que el Job determine otra clasificación.

---

# 3. Roles Autorizados

## Superusuario de Admisión

Puede asignar todos los estados.

---

## Gestor de A

Puede asignar todos los estados.

---

## Ejecutivo de Admisión

Puede asignar únicamente:

- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- Tramitado

---

# 4. Catálogo Completo de Estados

| Estado | Ejecutivo | Superusuario | Gestor |
|----------|----------|----------|----------|
| Pendiente | No | Sí | Sí |
| Pago por Adelantado | Sí | Sí | Sí |
| No Facturable | No | Sí | Sí |
| Derivado a Dirección Médica | Sí | Sí | Sí |
| Derivado a Supervisor | Sí | Sí | Sí |
| Error de Vinculación | Sí | Sí | Sí |
| Pendiente de Revisión | Sí | Sí | Sí |
| Terapia de Proceso | Sí | Sí | Sí |
| En Proceso | No | Sí | Sí |
| Error de Facturación | No | Sí | Sí |
| Tramitado | Sí | Sí | Sí |

---

# 5. Estado Pendiente

## Descripción

Estado inicial del encuentro dentro de Admisión.

Representa un encuentro que aún requiere revisión.

---

## Uso

Se asigna automáticamente al ingresar a la bandeja.

---

## Impacto

No modifica la clasificación del encuentro.

---

# 6. Estado Pago por Adelantado

## Descripción

Indica que el encuentro requiere o registra una gestión relacionada con un pago anticipado.

---

## Uso

Puede ser utilizado durante el seguimiento administrativo.

---

## Impacto

No modifica la bandeja.

El Job seguirá evaluando el encuentro normalmente.

---

# 7. Estado No Facturable

## Descripción

Indica que el encuentro ha sido identificado operativamente como no facturable.

---

## Roles

- Superusuario
- Gestor de A

---

## Comportamiento

Al asignarlo:

1. Se actualiza el estado.
2. Se retira temporalmente el encuentro de Admisión.
3. El encuentro espera una nueva evaluación del Job.

---

## Consideración Importante

No garantiza permanencia en Facturación.

---

# 8. Estado Derivado a Dirección Médica

## Descripción

Indica que el encuentro requiere revisión por Dirección Médica.

---

## Impacto

No modifica la clasificación.

---

# 9. Estado Derivado a Supervisor

## Descripción

Indica que el encuentro requiere revisión o seguimiento por un supervisor.

---

## Impacto

No modifica la clasificación.

---

# 10. Estado Error de Vinculación

## Descripción

Indica la existencia de una inconsistencia en la vinculación de información asociada al encuentro.

---

## Impacto

No modifica la clasificación.

---

# 11. Estado Pendiente de Revisión

## Descripción

Indica que el encuentro requiere una revisión posterior.

---

## Impacto

No modifica la clasificación.

---

# 12. Estado Terapia de Proceso

## Descripción

Estado operativo utilizado para seguimiento interno según las reglas de negocio definidas por el área operativa.

---

## Impacto

No modifica la clasificación.

---

# 13. Estado En Proceso

## Descripción

Indica que existe una gestión activa sobre el encuentro.

---

## Roles

- Superusuario
- Gestor de A

---

## Impacto

No modifica la clasificación.

---

# 14. Estado Error de Facturación

## Descripción

Indica que el encuentro presenta una situación operativa relacionada con facturación.

---

## Roles

- Superusuario
- Gestor de A

---

## Comportamiento

1. Actualiza el estado.
2. Retira temporalmente el encuentro de Admisión.
3. Espera nueva ejecución del Job.

---

## Consideración

No garantiza permanencia en Facturación.

---

# 15. Estado Tramitado

## Descripción

Indica que el encuentro ha sido gestionado por el usuario.

---

## Impacto

No modifica la clasificación.

---

# 16. Modal de Confirmación

## Objetivo

Evitar cambios involuntarios de estado.

---

## Mensaje Base

¿Deseas marcar el encuentro como {Estado}?

---

## Descripción

El encuentro permanecerá en tu bandeja de admisión para que puedas continuar revisándolo después.

---

## Botones

### Confirmar

Sí, cambiar estado

### Cancelar

No, cancelar

---

# 17. Flujo de Cambio de Estado

1. Usuario abre detalle.
2. Selecciona nuevo estado.
3. Sistema muestra modal.
4. Usuario confirma.
5. Sistema registra el cambio.
6. Sistema retorna a Lista de Encuentros.
7. Sistema actualiza la grilla.

---

# 18. Auditoría

Toda modificación deberá registrar:

- Encuentro.
- Estado anterior.
- Estado nuevo.
- Usuario.
- Fecha.
- Hora.
- Rol.

---

# 19. Reglas de Negocio

## RN-EST-01

Los estados operativos son independientes de la clasificación.

## RN-EST-02

El Job de Admisión determina la bandeja.

## RN-EST-03

Los usuarios no pueden mover encuentros entre bandejas.

## RN-EST-04

No Facturable provoca salida temporal de Admisión.

## RN-EST-05

Error de Facturación provoca salida temporal de Admisión.

## RN-EST-06

Toda modificación debe ser auditada.

## RN-EST-07

Los cambios de estado requieren confirmación.

## RN-EST-08

El encuentro puede volver a Admisión después de una reevaluación del Job.

---

# 20. Casos de Ejemplo

## Caso 1

Estado:
- Tramitado

Resultado:
- El encuentro continúa en Admisión.

---

## Caso 2

Estado:
- Derivado a Dirección Médica

Resultado:
- El encuentro continúa en Admisión.

---

## Caso 3

Estado:
- No Facturable

Resultado:
- Sale temporalmente de Admisión.
- El Job determinará posteriormente su bandeja.

---

## Caso 4

Estado:
- Error de Facturación

Resultado:
- Sale temporalmente de Admisión.
- El Job determinará posteriormente su bandeja.

---

# 21. Fuente de Verdad

Este documento constituye el catálogo oficial de estados operativos del sistema AUNADOS.

Toda funcionalidad, validación, automatización, caso de prueba o regla de negocio deberá respetar las definiciones establecidas en este documento.
