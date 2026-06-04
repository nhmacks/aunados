# 16-Glosario.md

# Glosario Funcional y de Negocio del Sistema AUNADOS

## 1. Objetivo

Este documento establece el significado oficial de los términos, conceptos, acrónimos y definiciones utilizados en la documentación funcional del sistema AUNADOS.

Su propósito es garantizar que todos los participantes del proyecto interpreten los conceptos de manera uniforme.

Aplica para:

- Negocio
- Operaciones
- Admisión
- Facturación
- Protocolo
- Desarrollo
- QA
- UAT
- Soporte
- Auditoría

---

# 2. Acrónimos

## AUNADOS

Sistema utilizado para la gestión, clasificación y seguimiento de encuentros dentro del flujo operativo de Admisión, Protocolo y Facturación.

---

## NHC

Número de Historia Clínica.

Identificador único asociado a un paciente.

---

## DM

Dirección Médica.

Área responsable de la evaluación médica de casos derivados.

---

## QA

Quality Assurance.

Disciplina encargada de asegurar la calidad del software.

---

## UAT

User Acceptance Testing.

Pruebas de aceptación realizadas por usuarios de negocio.

---

## XLSX

Formato estándar de Microsoft Excel utilizado para exportaciones.

---

# 3. Conceptos Generales

## Encuentro

Unidad principal de gestión del sistema.

Representa una atención médica que debe ser evaluada y clasificada dentro de una bandeja operativa.

---

## Paciente

Persona asociada al encuentro.

---

## Usuario

Persona autenticada que interactúa con el sistema.

---

## Rol

Conjunto de permisos asignados a un usuario.

Determina:

- Información visible.
- Funcionalidades disponibles.
- Acciones permitidas.

---

## Bandeja

Agrupación lógica donde se ubica un encuentro según las reglas evaluadas por el Job de Admisión.

---

# 4. Bandejas Operativas

## Bandeja de Admisión

Contiene encuentros que presentan al menos una de las siguientes condiciones:

- Documentación administrativa pendiente.
- Sustentos médicos pendientes.
- Laboratorios pendientes.
- Laboratorios no imputados.

---

## Bandeja de Protocolo

Contiene encuentros que:

- Tienen documentación completa.
- Tienen laboratorios completos.
- Tienen laboratorios imputados.
- Se encuentran dentro del período permitido según las reglas del negocio.

---

## Bandeja de Facturación

Contiene encuentros que:

- Tienen documentación completa.
- Tienen laboratorios completos.
- Tienen laboratorios imputados.
- Han superado el período máximo permitido en Protocolo.

---

# 5. Clasificación de Encuentros

## Clasificación

Proceso mediante el cual el Job de Admisión determina la bandeja correcta para un encuentro.

---

## Reclasificación

Proceso mediante el cual el Job vuelve a evaluar un encuentro previamente clasificado.

---

## Fuente de Verdad

Información oficial utilizada para determinar la clasificación de los encuentros.

---

# 6. Job de Admisión

## Definición

Proceso automático encargado de:

- Obtener información desde XHIS.
- Evaluar reglas de negocio.
- Clasificar encuentros.
- Reclasificar encuentros.
- Determinar la bandeja correcta.

---

## Importancia

Es la única entidad autorizada para determinar la bandeja de un encuentro.

---

# 7. Tipos de Encuentro

## Ambulatorio

Encuentro asociado a una atención ambulatoria.

---

## Emergencia

Encuentro asociado a una atención de emergencia.

---

# 8. Oncosalud

## Definición

Clasificación utilizada por las reglas de negocio para determinar tiempos de permanencia en Protocolo y Facturación.

---

# 9. Sustentos

## Sustento Administrativo

Documento requerido para completar el proceso administrativo de un encuentro.

---

### Ejemplos

- Carta de Garantía
- Hoja SITEDS
- Denuncia Policial
- SOAT Tarjeta Física
- Conformidad

---

## Sustento Médico

Documento o información clínica pendiente requerida para continuar el flujo.

Actualmente el principal valor identificado es:

- Laboratorio

---

## Sustento de Proceso

Validación asociada a la imputación de laboratorios.

---

# 10. Laboratorio

## Laboratorio Completo

Todos los resultados requeridos se encuentran disponibles.

---

## Laboratorio Pendiente

Existen resultados aún no disponibles.

---

## Laboratorio Imputado

Resultado registrado correctamente dentro del proceso operativo.

---

## Laboratorio No Imputado

Resultado existente pero aún no procesado dentro del flujo correspondiente.

---

# 11. Estados Operativos

## Estado Operativo

Condición de seguimiento asignada por los usuarios.

No determina la bandeja.

---

## Pendiente

Estado inicial de gestión.

---

## Pago por Adelantado

Estado utilizado para registrar situaciones relacionadas con pagos anticipados.

---

## No Facturable

Estado utilizado para indicar que el encuentro ha sido identificado operativamente como no facturable.

---

## Derivado a Dirección Médica

Estado utilizado para solicitar evaluación de Dirección Médica.

---

## Derivado a Supervisor

Estado utilizado para solicitar revisión por supervisión.

---

## Error de Vinculación

Estado utilizado para registrar inconsistencias de asociación de información.

---

## Pendiente de Revisión

Estado utilizado para indicar que el encuentro requiere evaluación posterior.

---

## Terapia de Proceso

Estado utilizado para seguimiento operativo interno.

---

## En Proceso

Estado utilizado para indicar gestión activa.

---

## Error de Facturación

Estado utilizado para registrar incidencias relacionadas con facturación.

---

## Tramitado

Estado utilizado para indicar que el encuentro ha sido gestionado.

---

# 12. Roles del Sistema

## Superusuario de Admisión

Usuario con acceso completo a la funcionalidad de Admisión.

---

## Gestor de A

Usuario con permisos equivalentes al Superusuario para la funcionalidad documentada.

---

## Ejecutivo de Admisión

Usuario con acceso restringido a encuentros creados por él mismo y pertenecientes a su sede.

---

# 13. Prioridades

## Prioridad 1

Mes de castigo.

---

## Prioridad 2

Mes en curso y dos meses previos.

---

## Prioridad 3

Meses anteriores al castigo.

---

# 14. Exportaciones

## Exportación Inmediata

Generación de archivo que inicia descarga automáticamente.

Disponible para:

- Superusuario
- Gestor de A

---

## Exportación Asíncrona

Generación de archivo en segundo plano.

Disponible para:

- Ejecutivo de Admisión

---

# 15. Notificaciones

## Centro de Notificaciones

Componente utilizado para informar eventos relevantes al usuario.

---

## Reporte Disponible

Notificación generada cuando una exportación asíncrona finaliza correctamente.

---

# 16. Auditoría

## Auditoría

Registro histórico de acciones realizadas por los usuarios.

---

## Trazabilidad

Capacidad de relacionar requerimientos, reglas, pruebas y evidencias.

---

# 17. Seguridad

## Autenticación

Proceso mediante el cual un usuario valida su identidad.

---

## Autorización

Proceso mediante el cual se determinan los permisos del usuario.

---

# 18. Fuente de Verdad

Este documento constituye el glosario oficial del sistema AUNADOS.

Toda la documentación funcional, técnica, operativa y de pruebas deberá utilizar las definiciones aquí establecidas para evitar ambigüedades y garantizar una interpretación uniforme del negocio.
