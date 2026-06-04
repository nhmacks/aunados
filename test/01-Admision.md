# 01-Admision.md

# Módulo de Admisión

## 1. Objetivo

La bandeja de Admisión permite gestionar encuentros que aún presentan pendientes administrativos, médicos o de proceso y que requieren revisión antes de avanzar a Protocolo o Facturación.

---

## 2. Definición de Encuentro en Admisión

Un encuentro permanecerá en Admisión cuando presente al menos una de las siguientes condiciones:

- Documentación administrativa pendiente.
- Exámenes de laboratorio pendientes.
- Exámenes de laboratorio no imputados.

La clasificación es realizada exclusivamente por el Job de Admisión.

---

## 3. Roles con Acceso

### Superusuario de Admisión

Puede visualizar todos los encuentros clasificados para Admisión.

### Gestor de A

Posee los mismos permisos que el Superusuario de Admisión.

### Ejecutivo de Admisión

Visualiza únicamente:

- Encuentros creados por él mismo.
- Encuentros de su sede.
- Encuentros clasificados para Admisión.

---

## 4. Lista de Encuentros

### Carga Inicial

- 50 registros.
- Más recientes primero.
- Scroll infinito de 50 en 50.

### Búsqueda General

Permite buscar por:

- Nombre.
- Apellido.
- Número de Encuentro.

### Restablecer Vista

Elimina todos los filtros y búsquedas.

---

## 5. Columnas Superusuario y Gestor

- Sede
- Encuentro
- Estado
- NHC
- Apellidos
- Nombres
- Fecha de Apertura
- Prioridad
- Usuario
- Garante
- Tipo de Encuentro
- Sustentos Administrativos
- Sustentos Médicos
- Sustentos de Proceso
- Monto

---

## 6. Columnas Ejecutivo

- Encuentro
- Estado
- NHC
- Apellidos
- Nombres
- Fecha de Apertura
- Prioridad
- Garante
- Tipo de Encuentro

---

## 7. Detalle del Encuentro

### Información General

- Encuentro
- Estado
- Datos del Paciente
- Datos del Seguro
- Sustentos Pendientes

### Agrupadores

#### Datos del Encuentro

- Número de Encuentro
- Fecha Apertura
- Tipo de Encuentro
- Prestación

#### Datos del Seguro

- Garante
- Producto
- Plan Copago
- Beneficio
- Código de Autorización

---

## 8. Cambio de Estado

### Ejecutivo de Admisión

Estados:

- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- Tramitado

### Superusuario y Gestor

Estados:

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

## 9. Reglas Importantes

Los estados operativos no determinan la bandeja.

La bandeja siempre será determinada por el Job de Admisión.

Los estados No Facturable y Error de Facturación retiran temporalmente el encuentro de Admisión hasta la siguiente evaluación del Job.

---

## 10. Exportación

### Superusuario y Gestor

Descarga directa de resultados visibles.

### Ejecutivo

Generación asíncrona.

- Se solicita el reporte.
- Se genera en segundo plano.
- Se notifica mediante campana.
- Vigencia de descarga: 1 hora.
