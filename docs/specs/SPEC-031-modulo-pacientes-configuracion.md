---
description: Configuración de campos de Pacientes por contexto (presente/requerido)
---

# Objetivo
Permitir a la clínica definir qué datos del paciente son visibles y obligatorios según el punto de captura (nuevo paciente, agendamiento, agenda online, check-in).

# Alcance
- Matriz de configuración (campo × contexto) con flags Presente/Requerido.
- Persistencia y auditoría de cambios por usuario/tenant.
- Aplicación inmediata de reglas a formularios multi-canal.

# Contextos
- En sección de nuevo paciente.
- Al crear paciente agendando.
- En sección de agenda online.
- Al enviar check-in.

# Campos (mínimo)
- Identificación: Nombre legal, Nombre social, Apellidos, RUT, Nacionalidad, Migrante, Pueblos originarios.
- Demografía: Sexo, Género, Fecha de nacimiento.
- Contacto/dirección: Email, Teléfono fijo, Teléfono móvil, Dirección, Ciudad, Comuna.
- Clínico/adm.: Convenio, Número interno.
- Laboral: Actividad o profesión, Empleador.
- Representación: Apoderado, Tipo, RUT Apoderado, Referencia.
- Otros: Observaciones.

# Reglas e invariantes
- Requerido ⇒ Presente (no puede haber requerido sin presente).
- Validaciones por país (RUT/ID), email/teléfono con máscara.
- Multicanal: los formularios de cada contexto respetan la matriz.
- Auditoría: quién/qué/cuándo (antes/después) por tenant.

# Historias (Gherkin)
```gherkin
Feature: Configuración de campos de pacientes

Scenario: Hacer RUT obligatorio en Agenda online
  Given la matriz de configuración
  When activo Presente y Requerido para RUT en "Agenda online"
  Then los formularios online bloquean el envío si el RUT falta o es inválido

Scenario: Teléfono móvil requerido al agendar
  Given el contexto "Al crear paciente agendando"
  When marco Requerido para Teléfono móvil
  Then no puedo guardar el paciente si el móvil está vacío
```

# RNF
- UI reactiva (aplica sin refrescar sesión), p95 < 200 ms en lectura de matriz.
- Seguridad: solo roles con permiso de configuración pueden editar.
- Multi-tenant: configuración aislada por clínica.

# Preguntas abiertas
- ¿Existen presets por país/tenant?
- ¿Se requiere versionado/cambios programados en fecha futura?
