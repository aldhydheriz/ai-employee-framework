# Generic Setup

The AI Employee Framework is plain Markdown. It works with any AI tool that accepts system prompts, context files, or custom instructions.

## General Approach

1. **Copy the core rule** (`rules/ai-employee.md`) into whatever location your AI tool reads custom instructions from.
2. **Append a persona** (from `skills/persona/references/`) if your project has a clear domain focus.
3. **Reference the persona system** (`skills/persona/SKILL.md`) if your tool supports multi-file context.

## Common patterns

### Single-file tools
For tools that use one instruction file (e.g., `.cursorrules`, `copilot-instructions.md`, `CLAUDE.md`):

```bash
# Combine core + persona into one file
cat rules/ai-employee.md > my-instructions.md
echo -e "\n---\n" >> my-instructions.md
cat skills/persona/references/developer.md >> my-instructions.md
```

### Multi-file tools
For tools that can read a directory of instructions (e.g., Gemini CLI `.agents/`, Cursor `.cursor/rules/`):

```bash
# Copy the entire framework
cp -r rules/ your-project/<tool-config-dir>/rules/
cp -r skills/ your-project/<tool-config-dir>/skills/
```

### API / system prompt
For direct API usage, read the files and include them in your system prompt:

```python
with open("rules/ai-employee.md") as f:
    system_prompt = f.read()

with open("skills/persona/references/developer.md") as f:
    system_prompt += "\n---\n" + f.read()
```

## Supported tools

This framework has been tested or is expected to work with:

| Tool | Config Location | Notes |
|------|----------------|-------|
| Gemini CLI / Antigravity | `.agents/rules/` + `.agents/skills/` | Native support |
| Claude Code | `CLAUDE.md` | Single-file or reference |
| Cursor | `.cursor/rules/` or `.cursorrules` | Directory or single-file |
| GitHub Copilot | `.github/copilot-instructions.md` | Single-file |
| Windsurf | `.windsurfrules` | Single-file |
| Cline | `.clinerules` | Single-file |
| Aider | `.aider.conf.yml` conventions | Via read directives |
| Any LLM API | System prompt | Inline the markdown |

## Tips

- **Start with the core rule only.** Add personas once you confirm the core behavior works with your tool.
- **If your tool has a small context window,** the core rule (~10KB) is the highest-value piece. Personas are supplementary.
- **The framework is designed to be read by AI, not executed.** It contains no code, only behavioral instructions in natural language.
