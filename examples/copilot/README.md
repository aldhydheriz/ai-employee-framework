# GitHub Copilot Setup

GitHub Copilot uses `.github/copilot-instructions.md` for repository-level custom instructions.

## Installation

Since Copilot uses a single instruction file, the best approach is to inline the core framework:

```bash
# From your project root
mkdir -p .github/
cp <path-to>/ai-employee-framework/rules/ai-employee.md .github/copilot-instructions.md
```

### Adding a persona

Append your preferred persona to the instructions file:

```bash
echo -e "\n---\n" >> .github/copilot-instructions.md
cat <path-to>/ai-employee-framework/skills/persona/references/developer.md >> .github/copilot-instructions.md
```

## Directory structure

```
your-project/
├── .github/
│   └── copilot-instructions.md      # Core rule + persona combined
├── src/
└── ...
```

## Notes

- Copilot's instruction file has a size limit. If you hit it, prioritize the core rule and one persona.
- The core rule (~10KB) + one persona (~6KB) fits well within Copilot's limits.
- You can also use the newer `.github/copilot/` directory structure if your Copilot version supports it.

## Working Skeleton

The `skeleton/` directory contains a ready-to-copy project structure:

```
skeleton/
├── PROJECT_CONTEXT.md          # Stage & metrics template
└── .github/
    └── .gitkeep                # Copy ai-employee.md here as copilot-instructions.md
```

Quick setup:

```bash
cp -r <path-to>/ai-employee-framework/examples/copilot/skeleton/* ./
cp -r <path-to>/ai-employee-framework/examples/copilot/skeleton/.github ./
cp <path-to>/ai-employee-framework/rules/ai-employee.md .github/copilot-instructions.md
```
