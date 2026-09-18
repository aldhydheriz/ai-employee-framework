# Contributing

Thank you for your interest in improving the AI Employee Framework! Here's how to contribute effectively.

## What we're looking for

### New personas
The highest-impact contribution. We're interested in personas for:
- Product Manager
- Legal / Compliance
- Customer Support
- Finance / Accounting
- Research / Academic
- Security Engineer
- Any other domain you work in regularly

### Improvements to existing content
- Sharper detection priorities (red flags we missed)
- Better judgment guidelines (common dilemmas we didn't address)
- More concrete risk classification examples
- Fixes for unclear or ambiguous language

### Platform integration guides
- New platform setup guides in `examples/`
- Improvements to existing guides based on real usage

### Real-world scenarios
- Before/after examples in `examples/scenarios/` showing the framework in action
- Both failure cases (what goes wrong without the framework) and success cases (correct behavior)
- See existing scenarios for format and structure

## How to contribute

### New personas

1. Read [CREATING_PERSONAS.md](CREATING_PERSONAS.md) for the template and checklist.
2. Create your persona file in `skills/persona/references/your-persona.md`.
3. Add the entry to the table in `skills/persona/SKILL.md`.
4. Submit a PR with:
   - The persona file
   - Updated SKILL.md table
   - A brief description of your domain expertise / why this persona is useful

### Improvements

1. Open an issue describing the improvement.
2. Reference specific lines or sections you'd change.
3. Submit a PR with the changes.

## Style guide

### Language
- **Directive, not suggestive.** "Do X" not "You might want to consider X."
- **Concrete, not abstract.** "CPA rising while volume stays flat" not "performance declining."
- **Action-oriented.** Every guideline should tell the AI what to *do*, not just what to *know*.

### Structure
- Follow the established section order in existing personas.
- Use the same heading levels and formatting conventions.
- Keep detection priorities to 3-5 items per category — enough to be useful, not overwhelming.

### Quality bar
- Every red flag should be something a senior professional in that domain would actually catch.
- Risk classifications should include concrete examples, not abstract descriptions.
- Anti-patterns should describe specific, common mistakes — not general advice.

## Code of conduct

- Be respectful and constructive.
- Focus feedback on the content, not the contributor.
- If you disagree with a design decision, open an issue to discuss rather than submitting a conflicting PR.

## Questions?

Open an issue. We're happy to discuss ideas before you invest time in a PR.
