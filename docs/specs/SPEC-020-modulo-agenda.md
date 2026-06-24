---
description: Especificación del Módulo de Agenda (diaria, semanal, confirmaciones y flujo clínico)
---

# Objetivo
Gestionar la programación y ejecución de citas con confirmaciones multicanal, control de sala de espera y visibilidad de situación financiera asociada.

# Alcance
- Vistas: Diaria, Semanal, Diaria global, Reprogramación.
- Búsqueda por paciente/ID; filtros por profesional y estados.
- Estados de cita y confirmaciones (teléfono, email, WhatsApp, online).
- Flujo: sala de espera → atendiendo → atendido | no asiste | anulada | reagendada.
- Impresión/exportación operativa.

# Datos y modelo (alto nivel)
- Cita: id, paciente_id, profesional_id, box_id, inicio, fin, estado, etiquetas["Diagnóstico", …], canales_confirmacion[], motivo_anulacion?, reprogramada_desde_id?, creado_en.
- Atributos derivados: situacion_saldo [hay_saldo|no_hay_saldo].
- Invariantes:
  - No solapar citas en el mismo box para el mismo profesional (según política).
  - Reprogramación crea nueva cita y mantiene enlace a la original (trazabilidad).

# UI / Flujos
- Filtros por profesional y por estados (notificado/confirmado por canal, no confirmado, en sala de espera, atendido, no asiste, reagendado) y motivos de anulación.
- Búsqueda por paciente/ID; botón “Imprimir”.
- Auto–refresh tras 40 s sin interrumpir edición activa.
- Tarjeta de cita: Hora, Paciente (acceso a datos personales), Doctor, Estado, Situación de saldo, Etiquetas ("Diagnóstico"), Box.
- Reprogramación con arrastrar/soltar o selector de nueva franja.

# Historias y criterios (Gherkin)
```gherkin
Feature: Gestión de agenda

Scenario: Confirmar cita por WhatsApp
  Given una cita creada para hoy
  When marco "Confirmado por WhatsApp"
  Then la cita muestra estado Confirmado con canal "WhatsApp" y se registra auditoría

Scenario: Mover a sala de espera
  Given el paciente ha llegado
  When marco "En sala de espera"
  Then la cita cambia de estado y registra hora de llegada

Scenario: Finalizar como atendido
  Given una cita "Atendiendo"
  When marco "Atendido"
  Then se registra la finalización con marcas de tiempo y trazabilidad

Scenario: Filtrar "No asiste"
  Given la vista diaria
  When aplico el filtro "No asiste"
  Then veo solo las citas con ese estado
```

# RNF
- Concurrencia: actualizaciones en tiempo real (o polling 40 s) sin conflictos.
- Rendimiento: p95 < 300 ms al filtrar por profesional/fecha.
- Auditoría completa de cambios de estado y reprogramaciones.
- Accesibilidad e internacionalización.

# Preguntas abiertas
- ¿Reglas de sobre-reserva por box/profesional?
- ¿Estados intermedios (ej. “Atendiendo”) obligatorios para marcar “Atendido”?
- ¿Impresión/exportación: CSV/PDF por día/profesional?
