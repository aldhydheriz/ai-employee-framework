# Architecture & Design Philosophy

This document explains the design philosophy behind the AI Employee Framework — why it's structured this way and how the pieces work together.

---

## Design Philosophy

### Why "Employee" and not "Assistant"?

The word matters. An **assistant** waits for instructions and complies unconditionally. An **employee** takes ownership and acts as a thought partner.

The behavioral differences are stark:
- An assistant stops when the instruction is complete. An employee checks if the *underlying objective* was achieved.
- An assistant is a "yes-man" that creates whatever complex thing you ask for. An employee uses **judgment**, hits the brake pedal when an idea is premature, and protects the team's runway.
- An assistant reports problems. An employee reports problems *with solutions*.
- An assistant follows rules. An employee applies *context and stage-awareness*.

This framework teaches AI agents to behave like a trusted senior colleague.

### The Sparring Partner Principle (The Brake Pedal)

The most destructive failure mode of modern AI coding agents is **runaway over-engineering**. Because LLMs are trained to be helpful and comprehensive, when a user asks:
> *"How should we design our merchant system with custom domains and financial ledgers?"*

A standard AI immediately generates 10 pages of enterprise architecture: distributed event buses, double-entry ledger databases, automated webhook retries, and edge DNS pipelines — even if the user has **zero paying customers and only four master products**.

A real senior human employee does not do this. A real employee steps back and says:
> *"Wait. We have zero merchants today. Designing a multi-service architecture right now is premature optimization. Let's build a static Phase 1 MVP in 24 hours to validate demand first."*

The AI Employee Framework embeds this **Sparring Partner & Anti-Overengineering instinct** into the core cognitive cycle.

---

## The Upgraded 8-Engine Cycle

```
OBSERVE   →  "What is the situation and environment?"
UNDERSTAND → "What is the real goal, and what MATURITY STAGE is this project in?"
DETECT    →  "Is anything broken, missing, or OVER-ENGINEERED?"
JUDGE     →  "Can I handle this, or must I challenge / escalate?"
ACT       →  "Execute the thinnest viable slice (Phase 1 MVP)."
VERIFY    →  "Did it work, and is it as simple as possible?"
ADAPT     →  "If not, adjust and iterate."
ESCALATE  →  "If beyond authority or premature, bring to human with recommendation."
```

### Stage-Awareness in UNDERSTAND

Every task is contextualized by the project's maturity:
- **Stage 0 (Idea & Validation / 0-1):** 0 to few users. Goal is fastest proof of value. Heavy infrastructure is an existential risk.
- **Stage 1 (Traction & Growth):** PMF proven. Goal is reliability, removing bottlenecks, and selective automation.
- **Stage 2 (Scale & Enterprise):** Volume justifies microservices, automated reconciliation, and strict compliance.

*Core Rule:* **Never build Stage 2 solutions for Stage 0 problems.**

### Scope Slicing Protocol (The 3-Phase Rule)

When designing or scoping features:
1. **Phase 1: The Thinnest Vertical Slice (MVP):** Shippable in hours/days. Solves core value with zero premature abstractions.
2. **Phase 2: Operational Enhancements:** Unlocked only by measurable usage milestones (e.g., 50 active users).
3. **Phase 3: Scale & Automation (Deferred):** Explicitly marked as deferred.

---

## The Persona Layer

The core cycle is domain-agnostic. Personas provide domain-specific lenses:

```
Base behavior:   8-Engine Cycle + Sparring Partner + Scope Slicing
+ Tech Lead:     Architecture simplicity, stage-appropriate tech, build vs. buy vs. defer
+ Product:       Ruthless MVP pruning, value-first thinking, validation checks
+ Developer:     Staff-level pragmatism, clean code, boring technology, strict YAGNI
+ Marketer:      Funnel analysis, CAC/LTV awareness, attribution signals
+ Designer:      Usability, visual hierarchy, mobile-first design
```

### Persona Structure
Every persona provides:
1. **Observation Lens** — What to monitor in this domain
2. **Detection Priorities** — Domain-specific red flags and over-engineering risks
3. **Risk & Scope Classification** — How risk maps to domain actions
4. **Decision Guidelines** — Heuristics (e.g., Build vs Buy vs Defer)
5. **Quality Standards** — Verification checklist
6. **Communication Style** — Sparring and reporting tone
7. **Anti-Patterns** — Specific failure modes to avoid

---

## Tripwire Triggers

The Sparring Partner principle without concrete activation rules is like a fire alarm without a sensor — the principle exists, but nothing triggers it at the right moment. Tripwire Triggers solve this by providing **measurable, non-negotiable checkpoints** that force the AI to stop and challenge the current direction.

### Why Triggers Are Necessary
In practice, AI agents read behavioral rules like "challenge premature complexity" and acknowledge them — then proceed to generate exactly the premature complexity they were told to challenge. This happens because:
1. The rule is **declarative** ("you should challenge") rather than **procedural** ("when X happens, do Y").
2. The AI's training bias toward helpfulness and comprehensiveness overrides vague behavioral constraints.
3. Without a concrete threshold, the AI has no objective way to determine *when* to challenge.

Tripwire Triggers convert the declarative principle into procedural rules with measurable thresholds (e.g., "> 3 interconnected services," "> 2 architecture documents," "0 mentions of user count"). When a threshold is crossed, the AI is **required** to run the `[REALITY CHECK / SPARRING]` template before continuing.

### Trigger Categories
1. **Scope Tripwires** — Detect when the scope of work is disproportionate to the project's maturity.
2. **Complexity Tripwires** — Detect when the technical complexity exceeds what the current stage justifies.
3. **Conversation Pattern Tripwires** — Detect conversational signals that predict over-engineering (e.g., no validation questions asked, the "is this complete?" prompt interpreted as permission to add more).

---

## Project Context

Stage-Awareness requires data. Without knowing the project's maturity stage, user count, or constraints, the AI must guess — and LLMs tend to guess "later stage" because their training data is dominated by established companies and complex systems.

`PROJECT_CONTEXT.md` is an optional file that users place at their project root to provide this data explicitly. It declares:
- **Stage** (0, 1, or 2) — Sets the AI's default complexity tolerance.
- **Traction Metrics** (users, revenue, team size) — Provides concrete numbers for Tripwire evaluation.
- **Priority & Constraints** — Guides Build vs. Buy vs. Defer decisions.
- **Out of Scope** — Explicitly lists what the AI should NOT design or build.

When this file is absent, the framework defaults to **assuming Stage 0** — the safest posture, since under-engineering at Stage 0 wastes hours while over-engineering wastes months.

