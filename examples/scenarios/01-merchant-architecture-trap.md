# Scenario: The Merchant Architecture Trap

A real-world example of how AI agents fail to apply stage-awareness and scope discipline, leading to weeks of wasted engineering on a product with zero users.

---

## The Setup

- **Project:** E-commerce toolkit with 4 digital master products
- **Stage:** 0 (Idea & Validation) — zero merchants, zero external sellers, zero paying customers
- **Team:** Solo founder + AI coding agent
- **Goal:** Founder wants to allow other creators to sell through the platform

---

## The Prompt

> "I want to build a merchant system where external sellers can sign up, create their own storefronts with custom domains, manage their products, and receive automated payouts. How should we architect this?"

---

## The Bad Response (What Actually Happened)

The AI generated **7 massive architecture documents** over multiple sessions:

1. **Merchant Registration & Onboarding System** — Multi-step wizard with email verification, business validation, tax ID collection, and KYC pipeline.
2. **Custom Domain Engine** — CNAME verification, automated SSL certificate provisioning via Cloudflare Workers, edge DNS routing, and subdomain management.
3. **Product Management System** — Full CRUD with variant management, bulk import/export, image optimization pipeline via Bunny CDN, and inventory tracking.
4. **Financial Ledger & Payout System** — Double-entry bookkeeping database, automated commission calculation, escrow accounts, multi-currency support, and scheduled payout disbursement via Stripe Connect.
5. **Storefront Renderer** — Dynamic SSR with per-merchant theme customization, SEO optimization per store, and A/B testing framework.
6. **Analytics Dashboard** — Per-merchant sales reports, conversion funnels, real-time traffic monitoring, and cohort analysis.
7. **Notification & Communication System** — Webhook infrastructure, email templates, in-app messaging, and Slack integration.

**Total estimated effort:** 3-4 months of full-time development.

### Why This Was Catastrophic
- **Zero validation:** Not a single merchant had expressed interest. The entire system was built on the assumption that merchants would appear.
- **Massive opportunity cost:** 3-4 months of building merchant infrastructure = 3-4 months NOT creating products, testing ads, or acquiring customers.
- **The founder had to manually invent the MVP:** The founder eventually realized the overengineering and created a `PHASE_01_STOREFRONT` spec themselves — work the AI should have done from the start.
- **No tripwire fired:** The AI never once stopped to ask: "Wait — how many merchants do we have today? Zero? Then why are we designing a multi-service distributed platform?"

---

## The Good Response (What Should Have Happened)

```
[REALITY CHECK / SPARRING]

Trigger:     Scope Tripwire — designing > 3 interconnected services for a product
             with 0 merchants and 0 external sellers.

Context:     Stage 0. 4 master products, 0 merchants, 0 paying customers.
             Solo founder. No validated demand for a merchant platform.

The Trap:    Building a full merchant infrastructure (custom domains, financial
             ledgers, automated payouts, KYC) for a market that does not yet
             exist. This is 3-4 months of engineering with zero guarantee that
             a single merchant will ever sign up.

Phase 1:     Manual Merchant MVP (24-48 hours)
             - Create 2-3 static storefront pages for "friendly testers"
               (creators you already know).
             - Use a simple shared spreadsheet or Notion table to track
               "merchant" products and sales.
             - Process payouts manually via bank transfer after each sale.
             - Measure: Do these creators actually drive traffic and sales?

Deferred:    Custom domains, automated payouts, KYC, financial ledgers,
             multi-tenant architecture, analytics dashboards.
             → Revisit ONLY after 10+ merchants generate at least 1 sale each.

Recommendation: Let's build a static storefront for 1 friendly creator this
                week. If their audience buys, we have validated demand and can
                justify Phase 2 automation. If they don't buy, we just saved
                3 months of wasted engineering.
```

---

## The Lesson

| Principle | How It Applies |
|-----------|---------------|
| **Stage-Awareness** | Stage 0 with 0 merchants → no multi-service architecture is justified |
| **Tripwire: Scope** | > 3 interconnected services designed → mandatory sparring activation |
| **Tripwire: Conversation Pattern** | Zero mention of user count or validation → should have asked immediately |
| **Scope Slicing** | Phase 1 should be static/manual, not automated infrastructure |
| **The Brake Pedal** | AI should have challenged the premise, not designed a spaceship |
