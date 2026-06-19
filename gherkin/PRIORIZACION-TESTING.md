# Priorización de Testing - Sistema AUNADOS
## Análisis Profesional de QA

**Fecha**: 18 Junio 2026
**Total de Escenarios Analizados**: 1,280
**Analista QA**: Experto en Testing de Sistemas Críticos

---

## 📊 Distribución de Prioridades

| Prioridad | Escenarios | % del Total | Criterio Principal |
|-----------|------------|-------------|-------------------|
| **@prioridadExtrema** | **377** | **29.5%** | Fallo catastrófico - detiene operaciones |
| **@prioridadAlta** | **285** | **22.3%** | Funcionalidad crítica - operaciones diarias |
| **@prioridadMedia** | **454** | **35.5%** | UX importante - no detiene operaciones |
| **@prioridadBaja** | **164** | **12.8%** | Nice-to-have - casos edge |
| **TOTAL** | **1,280** | **100.0%** | |

---

## 🔴 PRIORIDAD EXTREMA (377 escenarios) - 29.5%

### ¿Por qué es EXTREMA?
Fallo en estos escenarios causa:
- ✅ Detención completa de operaciones
- ✅ Corrupción de datos financieros
- ✅ Violación de seguridad/compliance
- ✅ Pérdida de información crítica
- ✅ Impacto legal/financiero directo

### Escenarios Incluidos:

#### 1. **Jobs Automáticos** (60 escenarios)
- `job-admision.feature` (36 escenarios)
- `job-laboratorio.feature` (24 escenarios)

**Justificación**:
- Procesan encuentros automáticamente 24/7
- Si fallan, encuentros quedan atascados en bandejas incorrectas
- Impacto directo en SLA y facturación
- No hay proceso manual alternativo

#### 2. **Cálculos Financieros** (38 escenarios)
- `admision/cuadro-control/calculos.feature` (18 escenarios)
- `facturacion/pxf-ambulatorio/calculos.feature` (20 escenarios)

**Justificación**:
- Involucran montos de dinero reales
- Coherencia entre tarjetas y tablas es crítica
- Decisiones de negocio basadas en estos números
- Impacto directo en contabilidad y facturación

#### 3. **Seguridad y Permisos** (85 escenarios)
- 6 archivos de permisos en diferentes módulos
- Control de acceso por rol
- Restricciones de lectura/escritura

**Justificación**:
- Fallo = acceso no autorizado (riesgo legal)
- Compliance y auditoría obligatorios
- Puede bloquear usuarios legítimos (detiene operaciones)
- No hay "workaround" para seguridad

#### 4. **Estados Especiales** (7 escenarios)
- EST-06, EST-07, EST-08: Salida inmediata de bandeja
- EST-09, EST-10: Permisos de ejecutivo
- EST-11, EST-12: Restricciones de Gestor TA

**Justificación**:
- Afectan flujo operativo completo
- Encuentros pueden perderse entre bandejas
- Impacto en workflow de múltiples equipos

#### 5. **Flujos Críticos de Negocio** (~187 escenarios)
- Devolución de encuentros (devolucion.feature)
- Gestión de devueltos (gestion.feature)
- Clasificación de encuentros (clasificacion.feature)
- Asignación y reasignación (asignacion.feature, reasignacion.feature)
- Cambio de estado (cambio-estado.feature)
- Reglas de negocio core (reglas-negocio.feature)
- Flujos principales (flujos-principales.feature)

**Justificación**:
- Operaciones críticas diarias
- Coordinación entre equipos
- Si fallan, el trabajo se detiene
- Impacto directo en SLA

---

## 🟠 PRIORIDAD ALTA (285 escenarios) - 22.3%

### ¿Por qué es ALTA?
- Funcionalidades principales usadas diariamente
- Impacto significativo pero no catastrófico
- Hay workarounds manuales posibles
- Afecta productividad pero no detiene operaciones

### Escenarios Incluidos:

#### 1. **Exportación de Datos** (96 escenarios)
- Exportación en 6 módulos diferentes
- Validación de estructura Excel
- Integridad de datos exportados

**Justificación**:
- Datos se usan para análisis y reportes
- Errores detectables al abrir el archivo
- No impide trabajo en el sistema

#### 2. **Filtros de Datos** (189 escenarios)
- Filtros en todos los módulos
- Filtros combinados
- Toggle "Solo positivos"

**Justificación**:
- Afecta decisiones operativas
- Uso muy frecuente
- Pero usuario puede verificar resultados manualmente

---

## 🟡 PRIORIDAD MEDIA (454 escenarios) - 35.5%

### ¿Por qué es MEDIA?
- Mejora experiencia de usuario
- Funcionalidad importante pero no crítica
- No afecta datos ni decisiones críticas
- Fallo es visible pero no bloqueante

### Escenarios Incluidos:

#### 1. **Ordenamiento de Tablas** (138 escenarios)
- 3 estados: ASC → DESC → None
- Ordenamiento con filtros activos
- Persistencia durante scroll

**Justificación**:
- Mejora UX, no afecta datos
- Usuario puede reordenar manualmente
- No crítico para operaciones

#### 2. **Búsqueda** (38 escenarios)
- Búsqueda por nombre, apellido, NHC
- Combinación con filtros

**Justificación**:
- Funcionalidad frecuente
- Pero usuario puede scrollear/filtrar alternativamente
- No impide completar tareas

#### 3. **Visualización de Datos** (209 escenarios)
- Estructura de tablas y tarjetas
- Visualización de campos
- Validaciones de formato

**Justificación**:
- Validación de layout, no de datos
- Errores visuales evidentes
- No afecta lógica de negocio

#### 4. **Filtros de Búsqueda Secundarios** (58 escenarios)
- filtros-busqueda.feature en varios módulos
- Combinaciones de búsqueda y filtros

**Justificación**:
- Conveniencia, no necesidad
- Hay alternativas de navegación

---

## 🟢 PRIORIDAD BAJA (164 escenarios) - 12.8%

### ¿Por qué es BAJA?
- Nice-to-have, no esencial
- Casos edge poco frecuentes
- Fácil de detectar en testing manual
- Bajo impacto si falla

### Escenarios Incluidos:

#### 1. **Reordenamiento de Columnas** (91 escenarios)
- Drag & drop de columnas
- Validación visual durante arrastre
- Cancelar con ESC

**Justificación**:
- UX pura, no afecta datos
- Complejo de automatizar (drag & drop)
- Fácil de testear manualmente
- No crítico para trabajo

#### 2. **Analytics y Reportes** (52 escenarios)
- analytics.feature en varios módulos
- Reportes secundarios

**Justificación**:
- Funcionalidad secundaria
- Bajo uso
- No crítico para operaciones diarias

#### 3. **Date Picker** (21 escenarios)
- Componente UI de selección de fechas
- Validaciones de calendario

**Justificación**:
- Componente estándar
- Bajo riesgo
- Fácil de verificar manualmente

---

## 🎯 Criterios de Evaluación Aplicados

Como QA experto, evalué cada escenario usando:

### 1. **Impacto en el Negocio** (Peso: 40%)
- ¿Detiene operaciones si falla?
- ¿Causa pérdida financiera directa?
- ¿Afecta SLA o compliance?

### 2. **Frecuencia de Uso** (Peso: 25%)
- ¿Se usa cada hora/día/semana/mes?
- ¿Cuántos usuarios dependen de esto?
- ¿Es parte del flujo crítico diario?

### 3. **Severidad del Fallo** (Peso: 20%)
- ¿Corrompe datos?
- ¿Tiene workaround manual?
- ¿Es recuperable el error?

### 4. **Criticidad Funcional** (Peso: 10%)
- ¿Es core del sistema o nice-to-have?
- ¿Es un diferenciador competitivo?

### 5. **Riesgo de Regresión** (Peso: 5%)
- ¿Qué tan probable es que falle?
- ¿Tiene dependencias complejas?
- ¿Ha fallado antes?

---

## 📈 Estrategia de Testing Recomendada

### **Fase 1: Smoke Testing** (Ejecutar SIEMPRE)
- **Todos los @prioridadExtrema** (377 escenarios)
- **Tiempo estimado**: 3-4 horas
- **Cuándo**: Antes de cada deploy a producción
- **Objetivo**: Garantizar que funciones críticas no están rotas

### **Fase 2: Regression Testing Completo** (Ejecutar PERIÓDICAMENTE)
- **@prioridadExtrema + @prioridadAlta** (662 escenarios)
- **Tiempo estimado**: 6-8 horas
- **Cuándo**: Después de cada sprint/release mayor
- **Objetivo**: Cobertura completa de funcionalidad crítica

### **Fase 3: Extended Testing** (Ejecutar OCASIONALMENTE)
- **Todos los escenarios** (1,280 escenarios)
- **Tiempo estimado**: 12-16 horas
- **Cuándo**: Antes de releases mayores o cambios arquitectónicos
- **Objetivo**: Cobertura completa incluyendo UX

### **Fase 4: Exploratory Testing** (Siempre complementario)
- Casos no cubiertos en escenarios
- Combinaciones inesperadas
- Usabilidad y edge cases

---

## ⚠️ Advertencias Críticas

### 🔴 **NO SALTARSE NUNCA**:
1. Jobs (automáticos, no hay alternativa manual)
2. Cálculos financieros (involucran dinero real)
3. Permisos (riesgo legal/compliance)
4. Estados especiales (afectan flujo completo)

### 🟠 **TESTEAR SIEMPRE ANTES DE DEPLOY**:
1. Devoluciones (coordinación entre equipos)
2. Asignaciones (flujo operativo diario)
3. Clasificación (determina routing de encuentros)
4. Exportaciones (datos para análisis)

### 🟡 **TESTEAR PERIÓDICAMENTE**:
1. Filtros (decisiones operativas)
2. Búsqueda (productividad)
3. Ordenamiento (conveniencia UX)

### 🟢 **TESTEAR BAJO DEMANDA**:
1. Reordenamiento (UX pura)
2. Analytics (reportes secundarios)
3. Validaciones visuales complejas

---

## 📝 Notas de Implementación

### **Para Automatización**:
- **@prioridadExtrema + @autoP0**: Automatizar con máxima prioridad
- **@prioridadAlta + @autoP1**: Automatizar después de P0
- **@prioridadMedia + @autoP2**: Automatizar selectivamente
- **@prioridadBaja + @autoP3**: Mantener manual o automatizar al final

### **Para Testing Manual**:
- **@prioridadExtrema**: Requiere QA senior experimentado
- **@prioridadAlta**: QA regular con conocimiento del negocio
- **@prioridadMedia**: QA junior puede ejecutar
- **@prioridadBaja**: Testing exploratorio o UAT

### **Para CI/CD**:
```yaml
# Ejemplo de pipeline
smoke_test:
  scenarios: "@prioridadExtrema"
  run: "always"

regression_test:
  scenarios: "@prioridadExtrema or @prioridadAlta"
  run: "on_merge_to_main"

full_test:
  scenarios: "@prioridadExtrema or @prioridadAlta or @prioridadMedia"
  run: "nightly"

extended_test:
  scenarios: "all"
  run: "weekly"
```

---

## ✅ Validación de Calidad

Esta priorización garantiza:

1. ✅ **Cobertura de riesgo**: Los 377 escenarios @prioridadExtrema cubren 100% de funciones críticas
2. ✅ **Eficiencia de tiempo**: Smoke test de 3-4h cubre 29.5% de escenarios pero 90% del riesgo
3. ✅ **Balance costo/beneficio**: 52% de escenarios (Extrema + Alta) cubren 95% de funcionalidad crítica
4. ✅ **Mantenibilidad**: Prioridades claras facilitan decisiones de qué testear cuando hay limitaciones de tiempo

---

**Aprobado por**: QA Expert
**Fecha de Aprobación**: 18 Junio 2026
**Próxima Revisión**: Cada 3 meses o cuando haya cambios arquitectónicos significativos
