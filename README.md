# AI Employee Framework

**Stop writing instructions. Start hiring a senior thought partner.**

A behavioral framework that transforms AI coding agents from passive instruction-followers into autonomous, judgment-driven workers. Works with any AI coding tool — [Google Antigravity IDE](https://antigravity.google), [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Claude Code](https://github.com/anthropics/claude-code), Cursor, GitHub Copilot, Windsurf, and more.

---

## The Problem

Most AI agents are **compliant yes-men**:
- When you ask how to build a feature, they design a massive distributed spaceship when you only need a bicycle.
- They never hit the "brake pedal" to question whether an architecture makes sense for your current stage.
- They force *you* to realize weeks later that you've over-engineered an MVP for a product with zero users.

**AI Employee Framework** solves this. Instead of acting like a passive ticket-taker, it teaches the AI agent to think like a **pragmatic senior employee and sparring partner**:
- **Stage-Awareness:** Evaluates whether you're at Day 0 (validation) or Scale, preventing premature complexity.
- **Sparring Partner Instinct (Brake Pedal):** Challenges premature abstractions and pushes back with simpler alternatives.
- **Scope Slicing Protocol:** Mandates breaking every initiative into **Phase 1 (MVP in 24-48h)** vs Phase 2 vs Phase 3 (Deferred).
- **Autonomous Ownership:** Uses judgment to classify decisions by risk and executes safe steps without hand-holding.

---

## Architecture

The framework operates in two cooperating layers:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                             PERSONA LAYER                               │
│                      (domain-specific judgment)                         │
│                                                                         │
│   ┌───────────┐ ┌─────────────────┐ ┌───────────┐ ┌──────────┐ ┌──────┐ │
│   │ Tech Lead │ │ Product Partner │ │ Developer │ │ Marketer │ │  ... │ │
│   └───────────┘ └─────────────────┘ └───────────┘ └──────────┘ └──────┘ │
├─────────────────────────────────────────────────────────────────────────┤
│                              CORE LAYER                                 │
│        (8-Engine Cycle + Sparring Partner + Scope Slicing)              │
│                                                                         │
│   OBSERVE → UNDERSTAND (Stage-Awareness) → DETECT (Over-Engineering)    │
│       → JUDGE → ACT (Scope Sliced) → VERIFY → ADAPT → ESCALATE/CHALLENGE │
└─────────────────────────────────────────────────────────────────────────┘
```

**Core Layer** — Always active. Defines *how* the AI thinks: an 8-engine cognitive cycle with Stage-Awareness and the Scope Slicing Protocol.

**Persona Layer** — On-demand. Sharpened lenses for specific domains (e.g., Tech Lead for stage-appropriate architecture, Product Partner for ruthless MVP validation, Developer for pragmatic code).

---

## Quick Start

### 1. Copy into your project

```bash
# Clone the repository
git clone https://github.com/aldhydheriz/ai-employee-framework.git

# Set up project entry point and personas
cp ai-employee-framework/rules/ai-employee.md your-project/AGENTS.md
mkdir -p your-project/.agents/rules your-project/.agents/skills
cp ai-employee-framework/rules/ai-employee.md your-project/.agents/rules/
cp -r ai-employee-framework/skills/persona your-project/.agents/skills/
```

### 2. Point your AI tool at it

Placing `AGENTS.md` at your repository root guarantees that modern AI coding tools (Google Antigravity IDE, Cursor, Gemini CLI, Claude Code) unconditionally inject the framework rules into the system prompt on every session.

See [Platform Setup](#platform-setup) for platform-specific details.

---

## Available Personas

| Persona | Domain | What it adds |
|---------|--------|-------------|
| **[Tech Lead](skills/persona/references/tech-lead.md)** | Architecture & Tech Strategy | Pragmatic architecture, Stage Gate checks, Boring Technology, Build vs Buy vs Defer |
| **[Product Partner](skills/persona/references/product-partner.md)** | Product & Founder Sparring | Ruthless MVP pruning, value-first thinking, Day 0 sanity checks, CAC/LTV awareness |
| **[Developer](skills/persona/references/developer.md)** | Software Engineering | Staff-level pragmatism, strict YAGNI, clean code, boundary tests, eliminating bloat |
| **[Marketer](skills/persona/references/marketer.md)** | Marketing & Growth | Funnel analysis, budget judgment, attribution awareness, performance signal detection |
| **[Content Writer](skills/persona/references/content-writer.md)** | Content Creation | Brand voice matching, SEO awareness, audience-appropriate language, structural clarity |
| **[Data Analyst](skills/persona/references/data-analyst.md)** | Data & Reporting | Statistical rigor, data quality detection, methodology transparency, actionable insights |
| **[Designer](skills/persona/references/designer.md)** | UI/UX Design | Usability signals, accessibility checks, visual consistency, mobile-first thinking |

> **Creating your own persona?** See the [Creating Personas](docs/CREATING_PERSONAS.md) guide.

---

## Platform Setup

<details>
<summary><strong>Google Antigravity IDE / Gemini CLI</strong></summary>

Place `AGENTS.md` directly at your project root:

```bash
cp rules/ai-employee.md your-project/AGENTS.md
cp -r skills/ your-project/.agents/skills/
```

Antigravity IDE walks up to your repository root and loads `AGENTS.md` into the system prompt `<user_rules>` unconditionally. Skills inside `.agents/skills/` are loaded on-demand.

See [examples/antigravity/](examples/antigravity/) for details.
</details>

<details>
<summary><strong>Claude Code</strong></summary>

Claude Code uses `CLAUDE.md`:

```bash
cp rules/ai-employee.md your-project/CLAUDE.md
cp -r skills/ your-project/skills/
```
</details>

<details>
<summary><strong>Cursor</strong></summary>

Cursor uses `.cursorrules` or `.cursor/rules/`:

```bash
mkdir -p your-project/.cursor/rules/
cp rules/ai-employee.md your-project/.cursor/rules/ai-employee.md
cp rules/ai-employee.md your-project/.cursorrules
cp -r skills/ your-project/.cursor/skills/
```
</details>

<details>
<summary><strong>GitHub Copilot</strong></summary>

```bash
mkdir -p your-project/.github/
cp rules/ai-employee.md your-project/.github/copilot-instructions.md
```
</details>

---

## How It's Different

| Traditional AI Assistants | AI Employee Framework |
|---------------------------|----------------------|
| **Yes-Man Execution:** Blindly designs 10-page enterprise architectures for Day 0 ideas | **Sparring Partner (Brake Pedal):** Questions premature complexity and proposes a 24-hour Phase 1 MVP |
| **Monolithic Specs:** Dumps all future edge cases and scale mechanisms into one document | **Scope Slicing Protocol:** Strictly separates Phase 1 (MVP) from Phase 2 (Growth) and Phase 3 (Deferred) |
| "Always use TypeScript / Write tests" | Stage-Awareness: Balances engineering rigor with business runway and current traction |
| Stops at the first error or asks about trivial details | Autonomous ownership: Classifies risk (Low/Medium/High/Scope) and drives outcomes |

---

## Project Structure

```
ai-employee-framework/
├── rules/
│   └── ai-employee.md              # Core 8-Engine Cycle + Sparring + Scope Slicing
├── skills/
│   └── persona/
│       ├── SKILL.md                 # Persona system orchestrator
│       └── references/
│           ├── tech-lead.md         # Systems architecture & tech strategy
│           ├── product-partner.md   # Product & founder sparring
│           ├── developer.md         # Software engineering (Staff-level pragmatism)
│           ├── marketer.md          # Growth & performance marketing
│           ├── content-writer.md    # Content creation & brand voice
│           ├── data-analyst.md      # Data analysis & metrics
│           └── designer.md          # UI/UX & visual hierarchy
├── examples/                        # Platform-specific setup guides
│   ├── antigravity/
│   ├── cursor/
│   ├── copilot/
│   └── generic/
└── docs/
    ├── ARCHITECTURE.md              # Design philosophy & cognitive cycle
    ├── CREATING_PERSONAS.md         # Guide to writing custom personas
    └── CONTRIBUTING.md              # Contribution guidelines
```

## License

MIT — see [LICENSE](LICENSE).

---

Built by [@aldhydheriz](https://github.com/aldhydheriz).
