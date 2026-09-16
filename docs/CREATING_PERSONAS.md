# Creating Custom Personas

This guide walks you through creating a new domain-specific persona for the AI Employee Framework.

## When to create a persona

Create a new persona when you have a domain where:
- The AI needs to watch for **different signals** than a generic agent would
- **Risk levels** map differently than the defaults (e.g., "delete a social media post" is medium-risk in content but low-risk in development)
- The AI needs domain-specific **judgment heuristics** (e.g., "when to optimize for SEO vs. readability")
- **Quality standards** are domain-specific (e.g., legal accuracy, brand compliance)

## Persona template

Every persona should follow this structure. Copy this template and fill in the domain-specific content:

```markdown
# [Domain] Persona

Domain-specific behavioral layer for [domain] work. Apply these directives
alongside the core 8-Engine Cycle when [list of activities this persona covers].

---

## Observation Lens

When **OBSERVE**-ing in a [domain] context, pay attention to:

- **[Signal category]:** [What to look for]
- **[Signal category]:** [What to look for]
- ...

## Detection Priorities

When **DETECT**-ing, these are the domain-specific red flags:

### [Category] Signals
- [Red flag — what it looks like and why it matters]
- ...

### [Category] Signals
- [Red flag — what it looks like and why it matters]
- ...

## Risk Classification (Domain-Specific)

| Risk | [Domain] Context | Action |
|------|-----------------|--------|
| **Low** | [Examples] | Autonomous |
| **Medium** | [Examples] | Execute with stated reasoning. [Domain-specific verification]. |
| **High** | [Examples] | Escalate. [Domain-specific escalation guidance]. |

## Judgment Guidelines

### [Decision type]
- **[Do this]** when: [conditions]
- **[Do that]** when: [conditions]
- **Ask** when: [conditions]

## Quality Standards

When **VERIFY**-ing [domain] output, check:

- [ ] **[Standard]** — [What it means concretely]
- [ ] **[Standard]** — [What it means concretely]
- ...

## Communication Style

When working on [domain]:

- **[Directive]:** [Explanation]
- ...

## Anti-Patterns (Things to Avoid)

- **[Anti-pattern name]:** [What it is and why to avoid it]
- ...
```

## Checklist

Before submitting a new persona, verify:

- [ ] **Follows the template structure** — All 7 sections are present
- [ ] **Observation Lens has 5-6 signals** — Enough to be useful, not overwhelming
- [ ] **Detection Priorities have 2-4 categories** — Each with 3-5 concrete red flags
- [ ] **Risk classification has real examples** — Not abstract descriptions, but concrete actions
- [ ] **Judgment guidelines address common dilemmas** — The "should I or shouldn't I?" moments in this domain
- [ ] **Quality standards are checkable** — Each item is a yes/no verification, not a vague aspiration
- [ ] **Anti-patterns are actionable** — Each describes a specific mistake, not a general principle
- [ ] **No overlap with core rule** — Persona adds domain specifics, doesn't repeat "verify your work"
- [ ] **Language is directive** — "Do X" not "You might want to consider X"

## Example: DevOps Engineer persona

Here's how you'd approach creating a DevOps Engineer persona:

### Observation Lens
Think: *What does a DevOps engineer look at that others don't?*
- Infrastructure state (running services, resource utilization, health checks)
- Deployment pipeline status (build times, failure rates, rollback frequency)
- Configuration drift (differences between environments)
- Monitoring and alerting gaps
- Security posture (exposed ports, outdated dependencies, certificate expiry)

### Detection Priorities
Think: *What red flags would a senior DevOps engineer catch?*
- **Reliability signals:** Single points of failure, missing health checks, no auto-scaling
- **Security signals:** Hardcoded secrets in configs, overly permissive IAM roles, unpatched CVEs
- **Operational signals:** No runbooks for incidents, missing alerts for critical paths, manual processes that should be automated

### Risk Classification
Think: *What's trivial vs. what could cause an outage?*
- **Low:** Updating docs, adding monitoring labels, reviewing logs
- **Medium:** Modifying CI/CD pipeline, adding new monitoring, changing resource limits
- **High:** Modifying production infrastructure, changing DNS, database failover, modifying secrets management

### Tips for this persona
- DevOps has high overlap with Developer — reference that persona and add infrastructure-specific extensions
- Emphasize the "blast radius" concept in risk classification
- Include judgment guidelines for "when to automate vs. manual fix"

## File placement

Save your persona as:
```
skills/persona/references/your-persona-name.md
```

Then add a row to the table in `skills/persona/SKILL.md`:
```markdown
| [Your domain] | [Your Persona] | [your-persona-name.md](./references/your-persona-name.md) |
```
