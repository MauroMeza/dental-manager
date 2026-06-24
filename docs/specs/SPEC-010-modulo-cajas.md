---
description: Especificación del Módulo de Cajas (apertura, cierre, mi caja, listados y reportes)
---

# Objetivo
Gestionar la operación de caja: apertura, registro de movimientos (abonos/gastos), cierre, consulta del historial y reportería operativa.

# Alcance
- Apertura y cierre de caja.
- Mi caja (estado actual + historial y transacciones).
- Listados: Cajas abiertas y Cajas cerradas con filtros.
- Detalle de transacciones.
- Reporterías operativas (período, por profesional, últimos 10 días, exportación).
- Configuración de “medios de pago considerados” en reportes de caja.

# Datos y modelo (alto nivel)
- Caja: id, tenant_id, sucursal_id, usuario_apertura_id, fecha_apertura, fecha_cierre?, saldo_inicial, total_abonos, total_gastos, saldo_cierre?, estado[abierta|cerrada], creado_en.
- MovimientoCaja: id, caja_id, tipo[abono|gasto|ajuste], monto, medio_pago, convenio?, referencia?, boleta?, paciente_id?, vencimiento?, creado_por, creado_en.
- Invariantes:
  - saldo_cierre = saldo_inicial + total_abonos − total_gastos.
  - No se permiten movimientos sobre una caja cerrada.
  - Reglas de reportería pueden excluir “descuentos por planilla”.

# UI / Flujos
- Cajas abiertas/cerradas
  - Filtros: Usuario, Fecha apertura (desde), Fecha cierre (hasta).
  - Columnas: Usuario, Apertura, Cierre, Detalle, Total abonos, Total gastos, Saldo cierre.
  - Acciones: Filtrar, Quitar filtros, Ver detalle (abre transacciones), Imprimir/Exportar.
- Mi caja
  - Muestra estado actual y movimientos (Paciente, Medio de pago, Convenio, Vencimiento, # referencia, # Boleta).
  - Permite cierre cuando cuadran totales.
- Reportes
  - Recaudación últimos 10 días, Resumen de cajas, Pagos por período, Pagos por período por profesional, Resumen Excel entre fechas.

# Historias y criterios (Gherkin)
```gherkin
Feature: Operación de caja

Scenario: Apertura de caja
  Given no tengo una caja abierta
  When ingreso saldo inicial y confirmo apertura
  Then la caja queda en estado "abierta" con usuario, sucursal y hora de apertura

Scenario: Cierre de caja
  Given tengo una caja abierta con movimientos
  When solicito cierre
  Then el sistema calcula saldo_cierre = saldo_inicial + total_abonos - total_gastos y registra el cierre auditable

Scenario: Listado de cajas cerradas por período
  Given estoy en "Cajas cerradas"
  When filtro por usuario y rango de fechas
  Then veo Usuario, Apertura, Cierre, Total abonos, Total gastos y Saldo cierre

Scenario: Ver detalle de caja
  Given una fila en "Cajas cerradas"
  When presiono "ver detalle"
  Then se muestra el desglose de transacciones asociadas a esa caja
```

# RNF
- Auditoría completa de operaciones de caja y cambios de estado.
- Desempeño: p95 < 300 ms en consultas de listados y detalle con filtros típicos.
- Seguridad y permisos por rol (cajero, administrador), visibilidad por sucursal/tenant.
- Multi-tenant: aislamiento lógico por tenant (SaaS) y modo single-tenant (Standalone).

# Preguntas abiertas
- ¿La unicidad de caja abierta es por usuario, por sucursal o por ambas?
- ¿Qué reportes excluyen “descuentos por planilla” y cómo se visualiza esa exclusión?
- ¿Formatos de exportación requeridos (CSV/XLSX/PDF) y alcance por reporte?
