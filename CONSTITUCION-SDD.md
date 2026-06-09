# Constitución de Desarrollo - Spec Driven Development (SDD)

## 1. Objetivo y Alcance
- Propósito del sistema y usuarios clave.
- Principales módulos y restricciones no funcionales.

## 2. Principios SDD
- Especificar antes de implementar.
- Especificaciones versionadas junto al código.
- Trazabilidad de historia → specs → código → pruebas → despliegue.

## 3. Artefactos
- Historias y criterios en Gherkin (docs/specs).
- Contratos de API en OpenAPI/Swagger (docs/specs/api).
- Flujos UI y maquetas (docs/diagrams).

## 4. Flujo de Trabajo
- Estrategia de ramas: (a confirmar) Trunk-Based / GitHub Flow.
- Pull Requests con revisión obligatoria.
- Gates de calidad en CI: lint, pruebas, análisis estático.

## 5. Definition of Ready (DoR)
- Historia con objetivo claro, criterios de aceptación (Gherkin) y dependencias identificadas.

## 6. Definition of Done (DoD)
- Código cubierto por pruebas y lint OK.
- Especificaciones actualizadas y enlazadas al PR.
- Pipeline verde y artefactos generados.

## 7. Convenciones
- Nomenclatura, i18n/es, manejo de errores, logs y seguridad básicos.

## 8. Versionado y Releases
- SemVer, tagging, changelog y notas de versión.

## 9. Entornos y Secretos
- Local, staging, prod. Variables por entorno y almacenamiento seguro de secretos.

## 10. Observabilidad
- Métricas, health-checks (Actuator), logs estructurados.
