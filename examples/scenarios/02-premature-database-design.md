# Scenario: The Premature Database Design

A common pattern where AI agents design elaborate database schemas, migrations, and ORM layers for features that have zero users and unvalidated assumptions.

---

## The Setup

- **Project:** SaaS application for freelancers to manage client invoices
- **Stage:** 0 — working prototype with 3 beta users (friends of the founder)
- **Team:** Solo developer + AI coding agent
- **Goal:** Add a "recurring invoices" feature that clients have mentioned once in passing

---

## The Prompt

> "I want to add recurring invoices. A user should be able to set an invoice to repeat weekly, monthly, or yearly. It should auto-generate the next invoice, handle schedule changes, and support pausing/resuming."

---

## The Bad Response

The AI immediately designs:

**Database schema (5 new tables):**
- `recurring_schedules` — stores cron expressions, timezone, next_run_at, retry policy
- `recurring_schedule_history` — audit log of every generated invoice
- `recurring_schedule_exceptions` — handles holidays, skipped dates, custom overrides
- `recurring_schedule_notifications` — email/SMS alerts for upcoming, generated, and failed invoices
- `schedule_execution_locks` — distributed locking to prevent duplicate generation in multi-instance deployments

**Background job system:**
- Cron-based scheduler with retry logic, dead letter queue, and exponential backoff
- Idempotency keys to prevent duplicate invoices
- Health monitoring endpoint for the scheduler

**API endpoints (8 new routes):**
- CRUD for schedules, pause/resume, force-generate, preview next invoice, bulk operations

**Total estimated effort:** 2-3 weeks.

### Why This Is Wrong
- **3 beta users.** None of them have actually asked for recurring invoices — one mentioned it "in passing."
- **5 new database tables** for a feature with zero validated demand violates the Scope Tripwire (> 3 new tables for a non-existent user segment).
- **Distributed locking** — the app runs on a single server. There is no multi-instance deployment.
- **Dead letter queues and retry logic** — solving infrastructure problems that do not exist at 3 users.

---

## The Good Response

```
[REALITY CHECK / SPARRING]

Trigger:     Scope Tripwire — 5 new database tables for a feature requested
             by 0 of 3 beta users. Complexity Tripwire — estimated > 1 week
             for a Stage 0 project.

Context:     Stage 0. 3 beta users (friends). Zero paying customers.
             One user mentioned recurring invoices in passing — not a
             validated pain point.

The Trap:    Designing a production-grade recurring invoice engine (cron
             scheduling, distributed locks, audit trails, exception handling)
             before confirming any user actually needs this feature.

Phase 1:     Manual Recurrence (2-4 hours)
             - Add a "Duplicate Invoice" button that copies an existing
               invoice with the date incremented.
             - No new database tables. No background jobs. No scheduler.
             - Ask the 3 beta users: "Would you use a button that duplicates
               your last invoice with the next month's date?"
             - If they say yes and use it > 5 times, consider Phase 2.

Phase 2:     Simple Automated Recurrence (when > 20 active users request it)
             - Add 1 column to the existing `invoices` table:
               `recurrence_interval` (enum: weekly, monthly, yearly, null).
             - Single daily cron job checks for invoices due today, duplicates
               them. No retry logic, no distributed locks, no audit tables.

Deferred:    Exception handling, timezone-aware scheduling, pause/resume,
             notification system, distributed execution locks.

Recommendation: Ship the "Duplicate Invoice" button today. It solves 80% of
                the use case in 2 hours, and tells us whether anyone actually
                wants recurrence before we invest 2 weeks in a scheduler.
```

---

## The Lesson

| Principle | How It Applies |
|-----------|---------------|
| **Stage-Awareness** | 3 beta users → no production-grade scheduler is justified |
| **Tripwire: Scope** | 5 new tables for an unvalidated feature → mandatory sparring |
| **Tripwire: Complexity** | > 1 week estimate at Stage 0 → mandatory sparring |
| **Scope Slicing** | Phase 1 is a button, not a cron system |
| **YAGNI** | Distributed locks, dead letter queues, and audit logs solve problems that do not exist at 3 users |
