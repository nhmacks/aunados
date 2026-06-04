# 14-Diccionario-Datos.md

# Diccionario de Datos del Sistema AUNADOS

## 1. Objetivo

Este documento define formalmente las entidades, atributos, columnas y conceptos de datos utilizados en el sistema AUNADOS.

Su objetivo es garantizar una interpretación única de la información entre:

- Negocio
- Desarrollo
- QA
- UAT
- Soporte
- Auditoría

---

# 2. Entidad: Encuentro

## Definición

Unidad principal de gestión dentro del sistema.

Representa una atención médica que debe ser evaluada, validada y clasificada dentro de las bandejas operativas.

---

## Atributos Principales

| Campo | Tipo | Obligatorio |
|---------|---------|---------|
| encuentro | Numérico | Sí |
| estado | Texto | Sí |
| nhc | Numérico | Sí |
| fecha_apertura | Fecha | Sí |
| tipo_encuentro | Texto | Sí |
| garante | Texto | Sí |

---

# 3. Campo: Encuentro

## Descripción

Identificador único del encuentro.

---

## Tipo

Numérico.

---

## Formato

8 dígitos.

---

## Ejemplo

12345678

---

# 4. Campo: Estado

## Descripción

Representa el estado operativo actual del encuentro.

---

## Valores Posibles

- Pendiente
- Pago por Adelantado
- No Facturable
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- En Proceso
- Error de Facturación
- Tramitado

---

# 5. Campo: NHC

## Nombre Completo

Número de Historia Clínica.

---

## Descripción

Identificador único asociado al paciente.

---

## Tipo

Numérico.

---

## Ejemplo

987654321

---

# 6. Campo: Apellidos

## Descripción

Apellidos completos del paciente.

---

## Tipo

Texto.

---

## Ejemplo

Pérez Gómez

---

# 7. Campo: Nombres

## Descripción

Nombres completos del paciente.

---

## Tipo

Texto.

---

## Ejemplo

Juan Carlos

---

# 8. Campo: Fecha de Apertura

## Descripción

Fecha de creación del encuentro.

---

## Tipo

Fecha.

---

## Formatos Utilizados

Pantalla:

DD/MM/YYYY

Exportación:

AAAA-MM-DD

---

## Ejemplo

2026-06-03

---

# 9. Campo: Prioridad

## Descripción

Clasificación operativa utilizada para priorizar la gestión.

---

## Valores

### Prioridad 1

Mes de castigo.

### Prioridad 2

Mes en curso y dos meses previos.

### Prioridad 3

Meses anteriores al castigo.

---

# 10. Campo: Usuario

## Descripción

Usuario responsable o asociado al encuentro.

---

## Tipo

Texto.

---

## Ejemplo

María López Ramírez

---

# 11. Campo: Sede

## Descripción

Centro asistencial asociado al encuentro.

---

## Tipo

Texto.

---

## Ejemplos

- Auna Guardia Civil
- Delgado
- Las Flores
- Centro de Bienestar
- Servimédicos

---

# 12. Campo: Garante

## Descripción

Entidad responsable de la cobertura económica del encuentro.

---

## Tipo

Texto.

---

## Ejemplos

- Oncosalud
- Pacífico EPS
- MAPFRE EPS
- La Positiva

---

# 13. Campo: Tipo de Encuentro

## Descripción

Clasificación operativa del encuentro.

---

## Valores Permitidos

- Ambulatorio
- Emergencia

---

# 14. Campo: Prestación

## Descripción

Código asociado al servicio prestado.

---

## Tipo

Texto.

---

## Ejemplo

ADM00050

---

# 15. Campo: Producto

## Descripción

Producto asociado al garante.

---

## Tipo

Texto.

---

## Ejemplo

Salud EPS Pacífico

---

# 16. Campo: Plan Copago

## Descripción

Plan asociado a la cobertura del paciente.

---

## Tipo

Texto.

---

# 17. Campo: Beneficio

## Descripción

Beneficio autorizado para la atención.

---

## Tipo

Texto.

---

## Ejemplo

Consulta Ambulatoria

---

# 18. Campo: Código de Autorización

## Descripción

Código de autorización emitido por el garante.

---

## Tipo

Texto.

---

## Ejemplo

AUT-987654

---

# 19. Sustentos Administrativos

## Descripción

Documentación administrativa pendiente requerida para continuar el flujo operativo.

---

## Valores Referenciales

- Carta de Garantía
- Hoja SITEDS
- Denuncia Policial
- SOAT Tarjeta Física
- Accidentes Personales
- Accidentes Estudiantiles
- Conformidad
- Operación 1OCG
- Ampliación 1CG
- Ampliación 2CG
- Ampliación 3CG
- Ampliación 7CG

---

# 20. Sustentos Médicos

## Descripción

Pendientes médicos asociados al encuentro.

---

## Valores

### Laboratorio

Existen pendientes médicos.

### -

No existen pendientes.

---

# 21. Sustentos de Proceso

## Descripción

Representan validaciones relacionadas con la imputación de laboratorios.

---

## Valores

### Laboratorio

Existen laboratorios no imputados.

### -

Todos los laboratorios están imputados.

---

# 22. Campo: Monto

## Descripción

Importe económico asociado al encuentro.

---

## Tipo

Decimal.

---

## Ejemplo

1250.50

---

# 23. Entidad: Paciente

## Descripción

Persona atendida dentro del encuentro.

---

## Campos Asociados

- NHC
- Nombres
- Apellidos

---

# 24. Entidad: Seguro

## Descripción

Información de cobertura asociada al encuentro.

---

## Campos Asociados

- Garante
- Producto
- Plan Copago
- Beneficio
- Código de Autorización

---

# 25. Entidad: Bandeja

## Descripción

Clasificación operativa asignada por el Job de Admisión.

---

## Valores

- Admisión
- Protocolo
- Facturación

---

# 26. Entidad: Estado Operativo

## Descripción

Situación operativa utilizada para seguimiento.

---

## Consideración

No determina la bandeja.

---

# 27. Fuente de Verdad

Las definiciones establecidas en este documento deberán utilizarse como referencia oficial para el diseño funcional, pruebas, integraciones, reportes y documentación del sistema AUNADOS.
