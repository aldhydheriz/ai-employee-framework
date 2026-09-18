# Cursor Setup

Cursor uses `.cursor/rules/` for project-level agent rules and supports `.cursorrules` as a legacy single-file option.

## Installation

### Option A: Rules directory (recommended)

```bash
# From your project root
mkdir -p .cursor/rules/
cp <path-to>/ai-employee-framework/rules/ai-employee.md .cursor/rules/

# Copy personas alongside (Cursor will pick up referenced files)
cp -r <path-to>/ai-employee-framework/skills/ .cursor/skills/
```

Then add a reference in `.cursor/rules/ai-employee.md` or create a `.cursorrules` that points to the persona files:

```
For domain-specific behavior, also read the relevant persona from skills/persona/references/.
```

### Option B: Single .cursorrules file

If you prefer a single file, concatenate the core rule and your preferred persona:

```bash
cat <path-to>/ai-employee-framework/rules/ai-employee.md > .cursorrules
echo -e "\n---\n" >> .cursorrules
cat <path-to>/ai-employee-framework/skills/persona/references/developer.md >> .cursorrules
```

## Directory structure

```
your-project/
├── .cursor/
│   └── rules/
│       └── ai-employee.md
├── skills/
│   └── persona/
│       ├── SKILL.md
│       └── references/
│           └── ...
├── src/
└── ...
```

## Notes

- Cursor loads all files in `.cursor/rules/` automatically.
- The persona files can live anywhere as long as they're referenced from the main rule.
- If Cursor's context window is limited, start with just the core rule and add personas as needed.

## Working Skeleton

The `skeleton/` directory contains a ready-to-copy project structure:

```
skeleton/
├── PROJECT_CONTEXT.md          # Stage & metrics template
├── .cursor/
│   └── rules/
│       └── .gitkeep            # Copy ai-employee.md here
└── skills/
    └── .gitkeep                # Copy persona/ directory here
```

Quick setup:

```bash
cp -r <path-to>/ai-employee-framework/examples/cursor/skeleton/* ./
cp -r <path-to>/ai-employee-framework/examples/cursor/skeleton/.cursor ./
cp <path-to>/ai-employee-framework/rules/ai-employee.md .cursor/rules/
cp -r <path-to>/ai-employee-framework/skills/persona skills/
```
