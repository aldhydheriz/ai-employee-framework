# AI Employee Framework

**Stop writing instructions. Start hiring an employee.**

A behavioral framework that transforms AI coding agents from passive instruction-followers into autonomous, judgment-driven workers. Works with any AI coding tool — [Gemini CLI](https://github.com/google-gemini/gemini-cli), [Claude Code](https://github.com/anthropics/claude-code), Cursor, GitHub Copilot, Windsurf, and more.

---

## The Problem

Most AI agent configurations are instruction lists: "do this, don't do that, format like this." They produce compliant but brittle behavior — the agent follows rules but can't think.

**AI Employee Framework** takes a different approach. Instead of telling the AI *what to do*, it teaches the AI *how to think* — using the same cognitive patterns a great employee uses:

- Observe the situation before acting
- Detect risks and anomalies proactively
- Use judgment to classify decisions by risk level
- Escalate when something is beyond its authority
- Adapt when things go wrong

## Architecture

The framework has two layers:

```
┌─────────────────────────────────────────────────────┐
│                   PERSONA LAYER                      │
│            (domain-specific behavior)                │
│                                                      │
│   ┌───────────┐ ┌──────────┐ ┌────────────────────┐ │
│   │ Developer │ │ Marketer │ │ Content Writer ... │ │
│   └───────────┘ └──────────┘ └────────────────────┘ │
├─────────────────────────────────────────────────────┤
│                    CORE LAYER                        │
│           (8-Engine Behavioral Cycle)                │
│                                                      │
│   OBSERVE → UNDERSTAND → DETECT → JUDGE             │
│       → ACT → VERIFY → ADAPT → ESCALATE             │
└─────────────────────────────────────────────────────┘
```

**Core Layer** — Always active. Defines *how* the AI thinks: an 8-engine cognitive cycle that runs on every task. Not a rigid checklist, but a natural thinking process with adaptive strictness based on risk level.

**Persona Layer** — On-demand. Defines *what* the AI pays attention to in a specific domain. A Developer persona watches for code smells and architecture issues. A Marketer persona watches for funnel leaks and budget waste. Personas are additive — they sharpen the core engines, never override them.

## Quick Start

### 1. Copy the framework into your project

```bash
# Clone the repo
git clone https://github.com/aldhydheriz/ai-employee-framework.git

# Copy into your project's agent config directory
cp -r ai-employee-framework/rules/ your-project/.agents/rules/
cp -r ai-employee-framework/skills/ your-project/.agents/skills/
```

### 2. Point your AI tool at it

See [Platform Setup](#platform-setup) for tool-specific instructions. Most tools auto-discover files in `.agents/`, `.cursor/`, or similar directories.

### 3. Start working

The framework activates automatically. Your AI agent will now:
- **Observe** context before jumping to code
- **Detect** risks you didn't ask about
- **Judge** whether to act autonomously or ask you first
- **Escalate** with context + recommendation, never raw problems

## Available Personas

| Persona | Domain | What it adds |
|---------|--------|-------------|
| **[Developer](skills/persona/references/developer.md)** | Software engineering | Code quality signals, architecture red flags, debugging methodology, refactoring judgment |
| **[Content Writer](skills/persona/references/content-writer.md)** | Content creation | Brand voice matching, SEO awareness, audience-appropriate language, structural clarity |
| **[Marketer](skills/persona/references/marketer.md)** | Marketing & growth | Funnel analysis, budget judgment, attribution awareness, performance signal detection |
| **[Data Analyst](skills/persona/references/data-analyst.md)** | Data & reporting | Statistical rigor, data quality detection, methodology transparency, actionable insights |
| **[Designer](skills/persona/references/designer.md)** | UI/UX design | Usability signals, accessibility checks, visual consistency, mobile-first thinking |

> **Creating your own persona?** See the [Creating Personas](docs/CREATING_PERSONAS.md) guide.

## Platform Setup

<details>
<summary><strong>Gemini CLI / Google Antigravity IDE</strong></summary>

Copy directly to your project's `.agents/` directory:

```bash
cp -r rules/ your-project/.agents/rules/
cp -r skills/ your-project/.agents/skills/
```

The `.agents/` directory is automatically discovered. No additional configuration needed.

See [examples/antigravity/](examples/antigravity/) for details.
</details>

<details>
<summary><strong>Claude Code</strong></summary>

Claude Code uses a `CLAUDE.md` file. You can reference the framework files or inline them:

```bash
# Option 1: Copy to project root and reference
cp -r rules/ your-project/rules/
cp -r skills/ your-project/skills/

# Add to CLAUDE.md
echo "Read and follow the behavioral framework in rules/ai-employee.md" >> your-project/CLAUDE.md
```

See [examples/generic/](examples/generic/) for details.
</details>

<details>
<summary><strong>Cursor</strong></summary>

Cursor uses `.cursor/rules/` for project-level rules:

```bash
mkdir -p your-project/.cursor/rules/
cp rules/ai-employee.md your-project/.cursor/rules/
cp -r skills/ your-project/.cursor/skills/
```

See [examples/cursor/](examples/cursor/) for details.
</details>

<details>
<summary><strong>GitHub Copilot</strong></summary>

Copilot uses `.github/copilot-instructions.md`:

```bash
mkdir -p your-project/.github/
# Combine the core rule into copilot-instructions.md
cat rules/ai-employee.md > your-project/.github/copilot-instructions.md
```

See [examples/copilot/](examples/copilot/) for details.
</details>

<details>
<summary><strong>Other tools</strong></summary>

The framework is plain Markdown — it works with any AI tool that accepts system instructions or context files. See the [Generic Setup Guide](examples/generic/) for manual integration.
</details>

## How It's Different

| Traditional AI Instructions | AI Employee Framework |
|----------------------------|----------------------|
| "Always use TypeScript" | OBSERVE existing patterns, DETECT inconsistencies, JUDGE whether to flag or fix |
| "Ask before deleting files" | Risk classification: Low/Medium/High with clear examples per domain |
| "Write tests for new code" | Developer persona: when to add tests, when not to, judgment guidelines |
| Long list of do's and don'ts | 8-engine cognitive cycle that adapts to context |
| Static rules | Adaptive strictness: relaxed for trivial tasks, strict for critical ones |

## Project Structure

```
ai-employee-framework/
├── rules/
│   └── ai-employee.md              # Core 8-Engine Behavioral Cycle
├── skills/
│   └── persona/
│       ├── SKILL.md                 # Persona system orchestrator
│       └── references/
│           ├── developer.md         # Software engineering persona
│           ├── content-writer.md    # Content creation persona
│           ├── marketer.md          # Marketing & growth persona
│           ├── data-analyst.md      # Data analysis persona
│           └── designer.md          # UI/UX design persona
├── examples/                        # Platform-specific setup guides
│   ├── antigravity/
│   ├── cursor/
│   ├── copilot/
│   └── generic/
└── docs/
    ├── ARCHITECTURE.md              # Design philosophy
    ├── CREATING_PERSONAS.md         # Guide to writing custom personas
    └── CONTRIBUTING.md              # Contribution guidelines
```

## Contributing

We welcome new personas, improvements to existing ones, and better documentation. See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

## License

MIT — see [LICENSE](LICENSE).

---

Built by [@aldhydheriz](https://github.com/aldhydheriz). If this framework changes how you work with AI agents, give it a ⭐.
