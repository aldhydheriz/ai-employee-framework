# Gemini CLI / Google Antigravity IDE Setup

The AI Employee Framework works natively with Gemini CLI and Antigravity IDE through the `.agents/` directory convention.

## Installation

```bash
# From your project root
cp -r <path-to>/ai-employee-framework/rules/ .agents/rules/
cp -r <path-to>/ai-employee-framework/skills/ .agents/skills/
```

## How it works

- **Rules** in `.agents/rules/` are automatically loaded as always-on behavioral guidelines.
- **Skills** in `.agents/skills/` are loaded on-demand when the AI determines they're relevant (based on the `description` field in the SKILL.md frontmatter).

## Directory structure

After installation, your project should look like:

```
your-project/
├── .agents/
│   ├── rules/
│   │   └── ai-employee.md          # Always active
│   └── skills/
│       └── persona/
│           ├── SKILL.md             # Loaded when domain context is needed
│           └── references/
│               ├── developer.md
│               ├── content-writer.md
│               ├── marketer.md
│               ├── data-analyst.md
│               └── designer.md
├── src/
└── ...
```

## Verification

After copying, start a conversation with your AI agent and ask it to describe its behavioral framework. It should reference the 8-Engine Cycle and be able to explain how it classifies risk.
