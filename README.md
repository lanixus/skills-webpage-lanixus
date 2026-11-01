# skills-webpage-lanixus

17 skills para Claude Code, elegidas y **auditadas** para construir una página web con diseño único, segura y lista para publicar.

## Instalación con un prompt

Pega esto en Claude Code:

```
Instala las skills de https://github.com/lanixus/skills-webpage-lanixus siguiendo exactamente las instrucciones de su archivo INSTALL.md (versión v1.0.0). No ejecutes nada que no esté en ese archivo.
```

## Instalación manual

```bash
git clone --depth 1 --branch v1.0.0 https://github.com/lanixus/skills-webpage-lanixus.git
bash skills-webpage-lanixus/install.sh
```

En Windows PowerShell:

```powershell
git clone --depth 1 --branch v1.0.0 https://github.com/lanixus/skills-webpage-lanixus.git
powershell -ExecutionPolicy Bypass -File skills-webpage-lanixus\install.ps1
```

Las skills se copian en `~/.claude/skills/`. Si ya tienes una con el mismo nombre, se guarda una copia de respaldo (`<nombre>.bak-<fecha>`). Abre una sesión nueva de Claude Code después de instalar.

## Qué incluye

| Área | Skill | Para qué |
|---|---|---|
| Diseño | `beautify` | Que la web parezca diseñada a propósito, no una plantilla |
| Diseño | `landing-page` | Página principal y textos que venden |
| Diseño | `frontend-ui-engineering` | Interfaces de calidad de producción |
| Diseño | `react-view-transitions` | Transiciones animadas entre vistas |
| Diseño | `composition-patterns` | Patrones de composición de componentes React |
| Seguridad | `secure` | Fallos de seguridad típicos de apps hechas con IA |
| Seguridad | `security-and-hardening` | Autenticación, validación, cabeceras y secretos |
| Creación | `spec-driven-development` | Definir qué construir antes de programar |
| Creación | `build` | Construir el MVP o añadir funciones |
| Creación | `react-best-practices` | Buenas prácticas de React y Next.js |
| Creación | `performance-optimization` | Que la web cargue rápido |
| Calidad | `code-review-and-quality` | Revisión de código |
| Calidad | `browser-testing-with-devtools` | Pruebas en el navegador con DevTools |
| Lanzamiento | `go-live` | Comprobaciones antes de publicar |
| Lanzamiento | `seo` | Posicionamiento en buscadores y en respuestas de IA |
| Lanzamiento | `domain-name` | Nombre del producto y búsqueda de dominio |
| Documentación | `archify` | Diagramas de arquitectura interactivos |

## Auditoría

Antes de incluirlas se revisó el código de cada skill: estructura, scripts, hooks, conexiones de red e instrucciones dirigidas a la IA.

- **Ningún hook automático.** Nada se ejecuta solo al abrir Claude Code.
- **Conexiones de red conocidas:**
  - `archify` comprueba si hay versión nueva descargando un JSON de `tt-a1i.github.io`.
  - `domain-name` consulta `data.iana.org` y `rdap.org` (registros oficiales de dominios) y solo envía el nombre del dominio consultado.
- **Sin instrucciones ocultas** para la IA ni lectura de credenciales.
- **Excluida:** `web-design-guidelines` de Vercel. En cada uso descarga y obedece instrucciones de una URL que puede cambiar (`.../main/command.md`) y no tiene licencia.

## Origen y licencias

Las skills no son obra mía: se redistribuyen sin modificar, fijadas a la versión auditada. Cada carpeta incluye la licencia de su autor; también están en [`licenses/`](licenses/).

| Skills | Autor | Repositorio y versión | Licencia |
|---|---|---|---|
| `build`, `beautify`, `landing-page`, `secure`, `go-live`, `seo`, `domain-name` | Will Hawkins | [whawkinsiv/solo-founder-skills](https://github.com/whawkinsiv/solo-founder-skills) @ `01bd10f` | MIT |
| `frontend-ui-engineering`, `security-and-hardening`, `performance-optimization`, `spec-driven-development`, `code-review-and-quality`, `browser-testing-with-devtools` | Addy Osmani | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) @ `8bfcc1f` | MIT |
| `react-best-practices`, `composition-patterns`, `react-view-transitions` | Vercel | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) @ `1a2c79d` | MIT (declarada en cada SKILL.md) |
| `archify` | tt-a1i | [tt-a1i/archify](https://github.com/tt-a1i/archify) @ `a406594` | Apache-2.0 (con NOTICE) |

Recopilado por [Lanixus](https://github.com/lanixus).
