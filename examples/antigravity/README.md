# Google Antigravity IDE & Gemini CLI Setup

The AI Employee Framework works natively with Google Antigravity IDE and Gemini CLI.

## Recommended Installation

Antigravity IDE discovers rules hierarchically by walking up from the active file to the repository root. Placing `AGENTS.md` at the root guarantees that the behavioral rules are **unconditionally injected into `<user_rules>` on every session**.

```bash
# From your project root:
# 1. Place the core behavioral framework as AGENTS.md (Always-on rule)
cp <path-to>/ai-employee-framework/rules/ai-employee.md ./AGENTS.md

# 2. Copy the persona skills
mkdir -p .agents/rules .agents/skills
cp <path-to>/ai-employee-framework/rules/ai-employee.md .agents/rules/
cp -r <path-to>/ai-employee-framework/skills/persona .agents/skills/
```

## How It Works in Antigravity

- **Core Behavioral Rule (`AGENTS.md`):** Loaded unconditionally into `<user_rules>` for all files in the project. The agent will always apply Stage-Awareness, the Sparring Partner instinct (brake pedal), and the Scope Slicing Protocol.
- **Persona Skill (`.agents/skills/persona/`):** Loaded on-demand when the agent needs domain-specific lenses (Tech Lead, Product Partner, Developer, Marketer, Designer, etc.).

## Directory Structure

```
your-project/
├── AGENTS.md                   # Always-on rule (unconditionally loaded)
├── .agents/
│   ├── rules/
│   │   └── ai-employee.md      # Rule archive
│   └── skills/
│       └── persona/
│           ├── SKILL.md         # Persona orchestrator
│           └── references/
│               ├── tech-lead.md
│               ├── product-partner.md
│               ├── developer.md
│               ├── marketer.md
│               ├── content-writer.md
│               ├── data-analyst.md
│               └── designer.md
├── src/
└── ...
```

## Verification

Start a conversation with your agent in Antigravity IDE and test with a prompt like:
> *"I have an idea: let's build a distributed multi-tenant merchant portal with custom domains and double-entry financial ledgers for my 4 digital products."*

The agent should **not** blindly agree or design 10 pages of architecture. It should trigger the **Sparring Partner / Reality Check**, note that building this for 4 products is premature over-engineering, and propose a **Phase 1 MVP slice** instead.

## Working Skeleton

The `skeleton/` directory contains a ready-to-copy project structure:

```
skeleton/
├── AGENTS.md                   # Pre-configured entry point
├── PROJECT_CONTEXT.md          # Stage & metrics template (fill in your values)
└── .agents/
    ├── rules/
    │   └── .gitkeep            # Copy ai-employee.md here
    └── skills/
        └── .gitkeep            # Copy persona/ directory here
```

Quick setup from the skeleton:

```bash
# From your project root:
cp -r <path-to>/ai-employee-framework/examples/antigravity/skeleton/* ./
cp -r <path-to>/ai-employee-framework/examples/antigravity/skeleton/.agents ./
cp <path-to>/ai-employee-framework/rules/ai-employee.md .agents/rules/
cp -r <path-to>/ai-employee-framework/skills/persona .agents/skills/
```
