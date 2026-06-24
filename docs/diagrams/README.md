# Guía de diagramas (C4 y otros)

Estructura recomendada:
- src/: fuentes editables (Mermaid, PlantUML, Draw.io)
- out/: exportaciones (PNG/SVG/PDF)

Modelo C4 sugerido:
- C1 Contexto: actores y sistema
- C2 Contenedores: frontend, backend, DB, gateways, integraciones
- C3 Componentes: módulos principales (ej. agenda, pagos, CRM)
- C4 Código (opcional): clases/paquetes críticos

Buenas prácticas:
- Versionar siempre la fuente editable en src/
- Nombrar con prefijos: c1-, c2-, c3-, seq-, er-, dep-
- Referenciar diagramas desde specs y ADRs

Ejemplos de nombres:
- src/c2-containers-plataforma.mmd (Mermaid)
- src/seq-agendamiento.puml (PlantUML)
- src/er-datos-clinicos.drawio (Draw.io)
