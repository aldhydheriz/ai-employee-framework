# Architecture

This document explains the design philosophy behind the AI Employee Framework — why it's structured this way and how the pieces work together.

## Design Philosophy

### Why "Employee" and not "Assistant"?

The word matters. An **assistant** waits for instructions. An **employee** takes ownership.

The difference in behavior is significant:
- An assistant stops when the instruction is complete. An employee checks if the *objective* was achieved.
- An assistant reports problems. An employee reports problems *with solutions*.
- An assistant follows rules. An employee uses *judgment*.

This framework teaches AI agents to behave like the latter.

### Why a cognitive cycle, not a rule list?

Most AI agent configurations are instruction lists: "do X, don't do Y, always Z." This approach has fundamental limitations:

1. **Rule lists are brittle.** They can't cover every situation. When the AI encounters something not in the list, it either halts or guesses.
2. **Rule lists conflict.** "Always write tests" + "move fast" = confusion about which rule wins.
3. **Rule lists don't compose.** Adding more rules doesn't make the AI smarter — it makes it slower and more confused.

A cognitive cycle solves these problems by teaching the AI *how to think*, not *what to think*. The 8 engines are a thinking process that can be applied to any situation, including ones not covered by explicit rules.

## The 8-Engine Cycle

### Why 8?

The cycle was designed around the natural decision-making process of a competent professional:

```
OBSERVE  →  "What is the situation?"
UNDERSTAND → "What is actually being asked?"
DETECT   →  "Is anything wrong or risky?"
JUDGE    →  "Can I handle this, or should I ask?"
ACT      →  "Do the work."
VERIFY   →  "Did it actually work?"
ADAPT    →  "If not, try something else."
ESCALATE →  "If I can't solve it, bring it to a human — with context."
```

Each engine addresses a specific failure mode common in AI agents:

| Engine | Prevents |
|--------|----------|
| OBSERVE | Jumping to action without reading context |
| UNDERSTAND | Solving the literal request instead of the real need |
| DETECT | Missing risks, inconsistencies, and opportunities |
| JUDGE | Either asking about everything (slow) or deciding everything (dangerous) |
| ACT | Stopping at the first error instead of trying alternatives |
| VERIFY | Assuming success without checking |
| ADAPT | Repeating failed strategies |
| ESCALATE | Dumping raw problems without context or recommendations |

### Adaptive Strictness

The cycle isn't meant to be explicitly narrated every time. The framework defines three levels:

- **Low-risk tasks:** The cycle runs implicitly — the AI just "thinks like this" naturally.
- **Medium-risk tasks:** Key engines (DETECT, JUDGE, VERIFY) are applied more deliberately.
- **High-risk tasks:** The full cycle is explicit, with documented reasoning and mandatory escalation.

This prevents the framework from being annoying on simple tasks while remaining rigorous when it matters.

## The Persona Layer

### Why separate from the core?

The core cycle is **domain-agnostic** — it works for any type of work. But the *signals* that matter differ by domain:

- A developer watches for code smells. A marketer watches for funnel leaks.
- A developer's "high risk" is a database migration. A marketer's "high risk" is a budget increase.
- A developer verifies with tests. A content writer verifies with brand voice checks.

Personas provide this domain-specific context without duplicating the core thinking process.

### How personas compose

Personas are **additive layers**, not replacements:

```
Base behavior:   8-Engine Cycle
+ Developer:     Code-specific observation, detection, and quality standards
= Developer AI:  Full cycle with software engineering domain expertise

Base behavior:   8-Engine Cycle
+ Marketer:      Campaign-specific observation, detection, and quality standards
= Marketer AI:   Full cycle with marketing domain expertise
```

When a task crosses domains (e.g., adding analytics tracking in code), personas can be **blended** — applying relevant signals from multiple domains simultaneously.

### Persona structure

Every persona follows the same structure to ensure consistency:

1. **Observation Lens** — What to pay attention to in this domain
2. **Detection Priorities** — Domain-specific red flags and warning signs
3. **Risk Classification** — How Low/Medium/High risk maps to this domain
4. **Judgment Guidelines** — Domain-specific decision-making heuristics
5. **Quality Standards** — Verification checklist for this domain
6. **Communication Style** — How to present work in this domain
7. **Anti-Patterns** — Common mistakes to avoid

This structure ensures every persona provides the same *types* of guidance while covering different *domains*.

## Design Decisions

### No code, only prose

The framework is pure Markdown with no executable code. This is intentional:

- **Portability:** Works with any AI tool that reads text.
- **Transparency:** Anyone can read and understand what the AI is being told.
- **Flexibility:** AI agents interpret natural language — rigid code structures would limit adaptability.

### No model-specific instructions

The framework never references specific AI model behaviors, token limits, or API quirks. It describes *human-like thinking patterns* that any sufficiently capable language model can follow.

### Risk classification over permission lists

Instead of listing every action that needs approval, the framework teaches a **risk classification skill**:

- The AI learns to evaluate risk level (Low/Medium/High)
- Each level has a clear behavioral expectation
- "When unsure, treat as one level higher" provides a safe default

This scales better than explicit permission lists because it handles novel situations the framework author didn't anticipate.
