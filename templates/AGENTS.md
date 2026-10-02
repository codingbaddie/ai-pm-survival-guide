# AGENTS.md

<!--
Template from AI PM Survival Guide — "Reclaiming Sovereignty".
Copy to your repo root. Most agent tools read AGENTS.md.
For Claude Code, create CLAUDE.md containing a single line: @AGENTS.md
Keep it short. Every line here costs context on every task. Add rules when an incident teaches you one.
-->

## Project context
- What this product does, for whom, in 2–3 sentences.
- Where specs live: `docs/` (PRDs, interview notes, decisions).
- How to run and test: `npm install && npm test` (replace with the real commands).

## Tiered engagement

### Tier 1 — stop, plan, and wait for approval
Touching any of these requires a written plan with trade-offs and my explicit "go":
- Database schema / migrations
- Pricing, billing, payments
- Auth, permissions, anything handling personal data
- Core user flows: <name them>
- Adding a new dependency or external service

When unsure whether something is Tier 1, treat it as Tier 1.

### Tier 2 — just do it
Bug fixes, copy changes, styling, refactors with tests, prototypes in `sandbox/`:
- Follow existing patterns in the codebase rather than inventing new ones.
- Run the tests before reporting done.
- Report: what changed, where, and anything you were unsure about.

## Never
- Commit secrets, `.env` files, or real customer data.
- Push, merge, or send messages outside this repo without asking.
- Mark a task done if tests fail; say they fail.

## Decisions log
Record Tier 1 decisions in `docs/decisions/` (one short file each: context, options, decision, why).
