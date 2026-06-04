# 15-Requerimientos-No-Funcionales.md

# Requerimientos No Funcionales del Sistema AUNADOS

## 1. Objetivo

Definir las características de calidad que debe cumplir el sistema AUNADOS para garantizar estabilidad, rendimiento, seguridad, disponibilidad, trazabilidad y escalabilidad.

Los requerimientos no funcionales complementan los requerimientos funcionales y constituyen criterios obligatorios para la aceptación de la solución.

---

# 2. Alcance

Aplica a todos los módulos:

- Admisión
- Protocolo
- Facturación
- Lista de Encuentros
- Detalle del Encuentro
- Estados
- Exportaciones
- Notificaciones
- Integraciones con XHIS
- Job de Admisión

---

# 3. Rendimiento

## RNF-001

La pantalla Lista de Encuentros deberá cargar los primeros 50 registros en un tiempo objetivo menor o igual a 3 segundos.

---

## RNF-002

La búsqueda general deberá responder en un tiempo objetivo menor o igual a 3 segundos.

---

## RNF-003

La aplicación de filtros deberá responder en un tiempo objetivo menor o igual a 3 segundos.

---

## RNF-004

El scroll infinito deberá cargar bloques adicionales sin recargar la página.

---

## RNF-005

La navegación al Detalle del Encuentro deberá completarse en un tiempo objetivo menor o igual a 2 segundos.

---

## RNF-006

La actualización de estados deberá ejecutarse en un tiempo objetivo menor o igual a 2 segundos.

---

# 4. Escalabilidad

## RNF-007

La solución deberá soportar miles de encuentros sin degradar significativamente la experiencia del usuario.

---

## RNF-008

La solución deberá soportar crecimiento de sedes, usuarios, garantes y encuentros sin requerir cambios funcionales.

---

## RNF-009

Los filtros deberán funcionar independientemente del volumen de datos existente.

---

# 5. Disponibilidad

## RNF-010

La aplicación deberá encontrarse disponible durante los horarios operativos definidos por la organización.

---

## RNF-011

Las interrupciones programadas deberán ser comunicadas previamente.

---

## RNF-012

Los procesos automáticos críticos deberán contar con monitoreo.

---

# 6. Seguridad

## RNF-013

Todo acceso deberá requerir autenticación.

---

## RNF-014

La información visible dependerá del rol autenticado.

---

## RNF-015

Las funcionalidades disponibles dependerán del rol autenticado.

---

## RNF-016

Los usuarios no deberán visualizar información fuera de su alcance funcional.

---

## RNF-017

Las operaciones críticas deberán quedar auditadas.

---

# 7. Auditoría

## RNF-018

Toda modificación de estado deberá registrar:

- Usuario
- Rol
- Fecha
- Hora
- Estado anterior
- Estado nuevo
- Encuentro

---

## RNF-019

Toda exportación deberá registrar:

- Usuario
- Fecha
- Hora
- Cantidad de registros
- Filtros utilizados

---

## RNF-020

Los accesos al detalle del encuentro deberán poder ser auditables.

---

# 8. Integridad de Datos

## RNF-021

La información mostrada deberá corresponder a la información vigente obtenida desde las fuentes oficiales.

---

## RNF-022

Los cambios de estado no deberán generar pérdida de información.

---

## RNF-023

La exportación deberá contener exactamente los mismos resultados visibles en la consulta realizada.

---

# 9. Integraciones

## RNF-024

El Job de Admisión deberá consumir información proveniente de XHIS.

---

## RNF-025

La clasificación de encuentros dependerá de la información obtenida desde las fuentes autorizadas.

---

## RNF-026

Las fallas de integración deberán ser registradas para análisis posterior.

---

# 10. Exportaciones

## RNF-027

Los reportes deberán generarse en formato XLSX.

---

## RNF-028

Los archivos deberán conservar la estructura definida en la especificación funcional.

---

## RNF-029

La generación asíncrona deberá permitir que el usuario continúe utilizando la aplicación.

---

## RNF-030

Los reportes temporales deberán expirar después de una hora para el Ejecutivo de Admisión.

---

# 11. Experiencia de Usuario

## RNF-031

La interfaz deberá mantener consistencia visual en todas las pantallas.

---

## RNF-032

Los mensajes de error deberán ser comprensibles para el usuario final.

---

## RNF-033

Las acciones críticas deberán solicitar confirmación cuando corresponda.

---

# 12. Compatibilidad

## RNF-034

La aplicación deberá ser compatible con los navegadores corporativos aprobados por la organización.

---

## RNF-035

La funcionalidad de exportación deberá ser compatible con Microsoft Excel.

---

# 13. Observabilidad

## RNF-036

Los errores funcionales deberán registrarse en logs.

---

## RNF-037

Las ejecuciones del Job de Admisión deberán ser monitoreadas.

---

## RNF-038

Las fallas en generación de reportes deberán registrarse.

---

# 14. Recuperación ante Fallos

## RNF-039

La aplicación deberá manejar errores inesperados sin exponer información sensible.

---

## RNF-040

Ante errores de consulta deberá mostrarse un mensaje amigable al usuario.

Mensaje estándar:

"Hubo un inconveniente. En estos momentos no podemos mostrar la información que necesita. Por favor, inténtelo nuevamente."

---

# 15. Mantenibilidad

## RNF-041

Las reglas de negocio deberán encontrarse centralizadas y documentadas.

---

## RNF-042

Toda modificación funcional deberá actualizar la documentación oficial.

---

## RNF-043

La trazabilidad entre requerimientos, reglas y pruebas deberá mantenerse vigente.

---

# 16. Calidad

## RNF-044

Toda funcionalidad deberá contar con cobertura de pruebas funcionales.

---

## RNF-045

Toda regla de negocio deberá contar con validación verificable.

---

## RNF-046

Los escenarios críticos deberán estar cubiertos por pruebas de regresión.

---

# 17. Fuente de Verdad

Este documento constituye la referencia oficial de los requerimientos no funcionales del sistema AUNADOS y deberá ser utilizado por los equipos de Arquitectura, Desarrollo, QA, Operaciones y Auditoría para validar la calidad de la solución.
