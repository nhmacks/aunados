# Estrategia de Automatización de Pruebas - Sistema AUNADOS

## 🎯 Objetivo
Priorizar la automatización de escenarios de prueba enfocándose en el máximo valor de negocio y ROI.

## 📋 Sistema de Etiquetado

### Tags de Priorización

| Tag | Prioridad | Descripción | Criterios |
|-----|-----------|-------------|-----------|
| `@autoP0` | **CRÍTICA** | Automatizar PRIMERO | Jobs, Reglas de negocio core, Cálculos financieros, Permisos críticos |
| `@autoP1` | **ALTA** | Automatizar después de P0 | Flujos principales, Asignaciones, Estados, Validaciones importantes |
| `@autoP2` | **MEDIA** | Automatizar con recursos disponibles | UI interactions, Filtros secundarios, Búsquedas, Reportes |
| `@autoP3` | **BAJA** | Automatizar al final o mantener manual | Casos edge, Validaciones visuales complejas, Performance |

---

## 🏆 PRIORIDAD 0 (P0) - CRÍTICA - Automatizar PRIMERO

### 1. **Jobs del Sistema** [@autoP0]
**Archivo**: `/gherkin/job/job-admision.feature`, `/gherkin/job/job-laboratorio.feature`

**Escenarios P0**:
- JOB-01: Clasificación exclusiva del Job
- JOB-05: Evaluación periódica del Job
- JOB-08, JOB-09, JOB-10: Retorno de encuentros desde Facturación
- JOBL-01, JOBL-02, JOBL-03: Lógica de evaluación del Job de Laboratorio
- JOBL-04, JOBL-05: Job funciona independientemente del estado

**Justificación**:
- ✅ Core del negocio - Los Jobs mueven encuentros entre bandejas automáticamente
- ✅ Alta frecuencia de ejecución (periódica)
- ✅ Impacto crítico si falla
- ✅ Reglas de negocio estables
- ✅ ROI alto: detecta regresiones en lógica core

**Total**: ~34 escenarios críticos

---

### 2. **Cálculos y Totales** [@autoP0]
**Archivos**:
- `/gherkin/admision/cuadro-control/calculos.feature`
- `/gherkin/facturacion/cuadro-control-enc-asignados/calculos.feature`
- `/gherkin/facturacion/pxf-ambulatorio/calculos.feature`

**Escenarios P0**:
- CALC-01: Coherencia entre tarjetas y tablas
- CALC-02: Validación de suma de totales
- CALC-03: Total = Lista + Devueltos
- CALC-09: Coherencia entre tablas
- CALC-10: Montos negativos
- CALC-11, CALC-12: Totales con filtros

**Justificación**:
- ✅ Datos financieros críticos
- ✅ Validaciones de integridad
- ✅ Impacto directo en reportes de negocio
- ✅ Alto riesgo si hay errores

**Total**: ~54 escenarios (18 por módulo × 3 módulos)

---

### 3. **Permisos y Seguridad** [@autoP0]
**Archivos**:
- `/gherkin/admision/cuadro-control/permisos.feature`
- `/gherkin/admision/lista-encuentros/detalle-encuentro/estados.feature` (permisos)
- `/gherkin/facturacion/cuadro-control-enc-asignados/permisos.feature`
- Todos los archivos de permisos

**Escenarios P0**:
- PERM-01 a PERM-10: Acceso por rol
- EST-09: Ejecutivo puede cambiar solo estados permitidos
- EST-13: Ejecutivo NO puede cambiar estados de otros
- Validaciones de restricciones por rol

**Justificación**:
- ✅ Seguridad del sistema
- ✅ Compliance y auditoría
- ✅ Alto impacto si falla
- ✅ Prevención de accesos no autorizados

**Total**: ~40 escenarios críticos

---

### 4. **Estados Especiales - Salida de Bandeja** [@autoP0]
**Archivo**: `/gherkin/admision/lista-encuentros/detalle-encuentro/estados.feature`

**Escenarios P0**:
- EST-06: Estado "No Facturable" provoca salida inmediata (RN-LE-013)
- EST-07: Estado "Error de Facturación" provoca salida inmediata (RN-LE-013)
- EST-08: Llegada a Facturación depende del Job (RN-LE-014, RN-LE-015)
- JOB-13, JOB-14: Estados especiales (excepciones a la regla)

**Justificación**:
- ✅ Excepciones a reglas de negocio normales
- ✅ Comportamiento crítico del sistema
- ✅ Alto riesgo de regresión

**Total**: ~8 escenarios críticos

---

## 🔥 PRIORIDAD 1 (P1) - ALTA - Automatizar después de P0

### 5. **Asignación Masiva de Encuentros** [@autoP1]
**Archivo**: `/gherkin/facturacion/asignaciones-masivas/*.feature`

**Escenarios P1**:
- Selección de múltiples encuentros
- Asignación a ejecutivos
- Validaciones de capacidad
- Confirmación y reversión

**Justificación**:
- ✅ Flujo operativo principal
- ✅ Alta frecuencia de uso
- ✅ Impacto en productividad

**Total**: ~30 escenarios estimados

---

### 6. **Devolución de Encuentros** [@autoP1]
**Archivos**:
- `/gherkin/facturacion/pendientes-por-facturar/devolucion.feature`
- `/gherkin/admision/encuentros-devueltos/gestion.feature`

**Escenarios P1**:
- DEV-01 a DEV-05: Flujo de devolución
- DEV-13 a DEV-16: Registro de comentarios
- GEST-01 a GEST-04: Resolver encuentros devueltos

**Justificación**:
- ✅ Flujo crítico de corrección
- ✅ Coordinación entre equipos
- ✅ Impacto en SLA

**Total**: ~35 escenarios

---

### 7. **Clasificación de Encuentros** [@autoP1]
**Archivo**: `/gherkin/facturacion/lista-encuentros-por-asignar/clasificacion.feature`

**Escenarios P1**:
- CLAS-01 a CLAS-10: Clasificación por Responsable
- Cambios de estado
- Validaciones de clasificación

**Justificación**:
- ✅ Flujo principal de facturación
- ✅ Reglas de negocio importantes
- ✅ Uso frecuente

**Total**: ~25 escenarios estimados

---

### 8. **Filtros Principales** [@autoP1]
**Archivos**:
- `/gherkin/admision/cuadro-control/filtros.feature`
- `/gherkin/facturacion/cuadro-control-enc-asignados/filtros.feature`
- `/gherkin/facturacion/pxf-ambulatorio/filtros.feature`

**Escenarios P1**:
- FIL-01 a FIL-05: Filtros individuales
- FIL-07, FIL-08: Filtros combinados
- FIL-10, FIL-11: Toggle "Solo positivos"

**Justificación**:
- ✅ Funcionalidad muy usada
- ✅ Impacto en análisis de datos
- ✅ Validación de lógica de filtrado

**Total**: ~54 escenarios (18 por módulo × 3)

---

### 9. **Exportación de Datos** [@autoP1]
**Archivos**:
- `/gherkin/admision/lista-encuentros/exportacion.feature`
- `/gherkin/facturacion/cuadro-control-enc-asignados/exportacion.feature`

**Escenarios P1**:
- Exportación a Excel
- Validación de estructura
- Validación de datos exportados
- Exportación con filtros

**Justificación**:
- ✅ Generación de reportes
- ✅ Uso frecuente por gerencia
- ✅ Validación de integridad de datos

**Total**: ~30 escenarios

---

## 🎯 PRIORIDAD 2 (P2) - MEDIA - Automatizar con recursos disponibles

### 10. **Ordenamiento de 3 Estados** [@autoP2]
**Archivos**:
- `/gherkin/admision/cuadro-control/ordenamiento.feature`
- `/gherkin/facturacion/cuadro-control-enc-asignados/ordenamiento.feature`
- Todos los archivos de ordenamiento

**Escenarios P2**:
- ORD-01, ORD-02, ORD-03: 3 estados (ASC → DESC → None)
- ORD-04 a ORD-11: Validación de orden correcto
- ORD-12 a ORD-15: Ordenamiento con filtros

**Justificación**:
- ⚠️ UI interaction - más complejo de automatizar
- ⚠️ No es crítico para el negocio
- ✅ Mejora experiencia de usuario
- ✅ Puede validarse parcialmente (API)

**Total**: ~100+ escenarios (múltiples módulos)

---

### 11. **Reordenamiento de Columnas (Drag & Drop)** [@autoP2 o @autoP3]
**Archivos**:
- `/gherkin/admision/cuadro-control/reordenamiento-columnas.feature`
- `/gherkin/facturacion/cuadro-control-enc-asignados/reordenamiento-columnas.feature`
- Todos los archivos de reordenamiento

**Escenarios P2/P3**:
- REORD-01 a REORD-04: Movimiento de columnas
- REORD-05 a REORD-06: Validación visual durante arrastre
- REORD-08: Integridad de datos

**Justificación**:
- ❌ UI compleja (drag & drop difícil de automatizar)
- ⚠️ No crítico para el negocio
- ⚠️ Bajo ROI de automatización
- ✅ Puede ser prueba manual

**Total**: ~85+ escenarios
**Recomendación**: Automatizar solo REORD-08 (integridad de datos), el resto manual

---

### 12. **Búsquedas** [@autoP2]
**Archivos**:
- `/gherkin/admision/lista-encuentros/busqueda.feature`
- Búsquedas en otros módulos

**Escenarios P2**:
- Búsqueda por nombre, apellido, NHC
- Búsqueda con filtros
- Validación de resultados

**Justificación**:
- ✅ Funcionalidad frecuente
- ✅ Validación de lógica de búsqueda
- ⚠️ Medio impacto en negocio

**Total**: ~25 escenarios

---

### 13. **Visualización de Datos** [@autoP2]
**Archivos**:
- `/gherkin/admision/cuadro-control/visualizacion.feature`
- `/gherkin/facturacion/pxf-ambulatorio/visualizacion.feature`

**Escenarios P2**:
- Visualización de tarjetas de métricas
- Estructura de tablas
- Validación de formatos

**Justificación**:
- ⚠️ Validaciones visuales (mejor con visual regression testing)
- ⚠️ Medio impacto
- ✅ Puede validarse estructura básica

**Total**: ~66 escenarios (22 por módulo × 3)
**Recomendación**: Automatizar validación de datos, no de layout

---

## 📉 PRIORIDAD 3 (P3) - BAJA - Automatizar al final o mantener manual

### 14. **Analytics y Reportes** [@autoP3]
**Archivo**: `/gherkin/admision/lista-encuentros/analytics.feature`

**Justificación**:
- ⚠️ Funcionalidad secundaria
- ⚠️ Bajo uso
- ⚠️ Bajo impacto si falla

---

### 15. **Casos Edge y Validaciones Visuales Complejas** [@autoP3]
**Todos los módulos**: Escenarios tipo DV-28, DV-29, validaciones de NULL, etc.

**Justificación**:
- ⚠️ Casos poco frecuentes
- ⚠️ Bajo ROI
- ✅ Mejor para pruebas exploratorias manuales

---

## 📊 Resumen de Priorización

| Prioridad | Tag | Total Escenarios | % del Total | Tiempo Estimado |
|-----------|-----|------------------|-------------|-----------------|
| **P0 - CRÍTICA** | `@autoP0` | **~170** | 15% | 3-4 sprints |
| **P1 - ALTA** | `@autoP1` | **~209** | 18% | 4-5 sprints |
| **P2 - MEDIA** | `@autoP2` | **~276** | 24% | 6-8 sprints |
| **P3 - BAJA** | `@autoP3` | **~500** | 43% | Continuo/Manual |
| **TOTAL** | | **~1155** | 100% | |

---

## 🚀 Plan de Implementación Recomendado

### **Fase 1: Fundación (Sprints 1-4)** - @autoP0
1. Jobs (Admisión y Laboratorio)
2. Cálculos y Totales
3. Permisos críticos
4. Estados especiales

**Resultado**: 170 escenarios automatizados - Core del sistema protegido

---

### **Fase 2: Flujos Principales (Sprints 5-9)** - @autoP1
1. Asignación masiva
2. Devoluciones
3. Clasificación
4. Filtros principales
5. Exportaciones

**Resultado**: 379 escenarios automatizados (P0 + P1) - Flujos críticos cubiertos

---

### **Fase 3: Mejoras UX (Sprints 10-17)** - @autoP2
1. Ordenamiento (solo validaciones de datos)
2. Búsquedas
3. Visualización (estructura, no layout)
4. Reordenamiento (solo integridad de datos)

**Resultado**: 655 escenarios automatizados - Cobertura completa de lógica de negocio

---

### **Fase 4: Cobertura Extendida (Continuo)** - @autoP3
- Casos edge según surjan bugs
- Analytics y reportes secundarios
- Mantenimiento y actualización

**Resultado**: Cobertura incremental basada en riesgos reales

---

## 🎯 Criterios de Selección Aplicados

### ✅ **Alto Valor para Automatización (P0/P1)**:
1. **Criticidad de negocio**: Jobs, cálculos financieros, permisos
2. **Frecuencia de ejecución**: Operaciones diarias del sistema
3. **Reglas de negocio estables**: Lógica madura que no cambia frecuentemente
4. **Detección temprana de regresiones**: Funcionalidades core
5. **ROI alto**: Ahorro significativo de tiempo vs esfuerzo de automatización

### ⚠️ **Medio Valor (P2)**:
1. Funcionalidades de UI con lógica validable
2. Operaciones frecuentes pero no críticas
3. Validaciones que pueden hacerse parcialmente

### ❌ **Bajo Valor (P3)**:
1. Interacciones UI complejas (drag & drop)
2. Validaciones visuales detalladas
3. Casos edge poco frecuentes
4. Funcionalidades secundarias
5. Mejor mantener como pruebas manuales o exploratorias

---

## 📝 Notas de Implementación

### **Estrategia de Etiquetado en Archivos**:
```gherkin
@autoP0 @jobAdmision @happyPath
Escenario: JOB-01 - Clasificación exclusiva del Job
  ...

@autoP1 @asignacionMasiva @happyPath
Escenario: ASIG-01 - Asignar encuentros a ejecutivo
  ...

@autoP2 @ordenamiento @happyPath
Escenario: ORD-01 - Primer clic ordena ascendente
  ...

@autoP3 @visualizacion @edgeCase
Escenario: VIS-28 - Validar NULL nunca se muestra
  ...
```

### **Herramientas Recomendadas**:
- **P0/P1**: Selenium/Playwright + API tests
- **P2**: Combinación de API + UI selectiva
- **P3**: Pruebas manuales + exploratorias

---

## 📈 Métricas de Éxito

### **KPIs de Automatización**:
- ✅ **Cobertura P0**: 100% en 4 sprints
- ✅ **Cobertura P0+P1**: 100% en 9 sprints
- ✅ **Tiempo de regresión**: < 2 horas (vs 40+ horas manual)
- ✅ **Detección de bugs**: En cada commit/PR
- ✅ **Confianza en deploys**: Alta (con suite P0+P1 ejecutándose)

---

**Fecha de Creación**: 17 Junio 2026
**Versión**: 1.0
**Autor**: Análisis de Sistema AUNADOS
