# Reclaiming Sovereignty: Turning "Tiered Engagement" from a Prompt into a Mechanism (2026 Edition)

> **This is not a prompt engineering tutorial. This is a redesign of the power structure between humans and agents.**

[🇹🇼 繁體中文](./Boundaries_with_AI_ZH.md) · *Last reviewed: 2026-10*

> 📝 **Revision note**: The first version of this article (2025) solved the problem with a prompt in `.cursorrules` that "forced" the AI into critical mode. The concept still holds; the implementation is outdated. For what I got wrong, read [What I Got Wrong 9 Months Ago](./What_I_Got_Wrong_EN.md).

## 1. The Problem Changed: From "AI Is Too Agreeable" to "Agents Are Too Capable"

In early 2025 my biggest pain was that the AI was a **Pleaser**: pitch a bad idea and it would implement that bad idea with maximum efficiency.

Today's models push back. They ask "are you sure?" The problem didn't disappear. It **changed shape**:

*   **Then**: The AI wrote a snippet. Nothing happened until you pasted it. You were the gate by default.
*   **Now**: An agent reads the whole repo, runs commands, edits a dozen files, and opens a PR. You hand over a requirement and get back a finished package.

**The danger is no longer "the AI doesn't think." It's "the AI thinks so fast you never get a chance to intervene."**
When execution cost approaches zero, the human's remaining leverage is deciding **when to stop and think.**

## 2. The Tiered Engagement Model Still Holds

I learned this from an argument with an AI. I told it to "challenge everything I say, never blindly obey." It replied: *"Debating philosophy while you fix a simple bug is analysis paralysis."*

Real collaboration isn't total takeover. It's **tiered governance**:

| | **Tier 1: Critical Mode (Strategy)** | **Tier 2: Execution Mode (Tactics)** |
|:---|:---|:---|
| **Applies to** | Core architecture, UX flows, business logic, data models | Bug fixes, UI tweaks, refactors, prototypes |
| **Signal** | One-way door, wide impact, ambiguous goal | Two-way door, low risk, clear goal |
| **AI behavior** | Ask why, lay out trade-offs, **wait for a human decision** | Do it to industry standard, report when done |
| **Human role** | Decision maker | Reviewer |

Three dimensions to decide the tier:
1.  **Reversibility**: If it's wrong, is `git revert` enough?
2.  **Impact radius**: Is the failure "mildly annoying" or "users lose trust"?
3.  **Ambiguity**: Is the goal clear, or have I not figured it out myself yet?

## 3. The 2026 Upgrade: Stop *Asking* the AI to Behave. Build the Rules into the System.

Version one asked the AI to classify the tier itself via a prompt. The problem: **a prompt is a suggestion, not a constraint.** In a long session or a rushed task, it gets diluted.

Modern agent tools (Claude Code, Cursor, Codex, etc.) provide real gates. I now implement the model in three layers:

### Layer 1: Project rules file — the house rules
`.cursorrules` is deprecated. The cross-tool convention is an **`AGENTS.md`** at the repo root (read by most agent tools). Claude Code reads `CLAUDE.md`, which can import the same file with a single `@AGENTS.md` line.

Don't write a persona ("You are a senior PM"). Write **where this project's Tier 1 minefields are**:

```markdown
## Tier 1 zones — stop and ask before changing
- Database schema / migrations
- Pricing, billing, anything touching money
- Auth & permissions
- Anything that changes what the user sees in the core checkout flow

For these: write a plan, list trade-offs, and wait for my explicit approval.
Everything else is Tier 2: just do it, run the tests, report back.
```

A full template lives at [`templates/AGENTS.md`](../templates/AGENTS.md).

### Layer 2: Plan Mode — "think before doing" for Tier 1
Most agent tools now have a **Plan Mode**: the agent can read but not edit, and must present a plan you approve before it starts.

That is Tier 1, mechanized. My habit:
*   **Tier 1 tasks** always start in Plan Mode. I review the plan, not the code.
*   **Tier 2 tasks** go straight through, often with auto-accepted edits.

### Layer 3: Permissions & Hooks — physically block one-way doors
Some things can't rely on "it will remember to ask."
*   **Permissions**: `git push`, file deletion, and outbound messages always require my approval.
*   **Hooks**: Automatic checks before certain actions (e.g., touching `migrations/` forces a stop).

> **Prompts are culture, Plan Mode is process, permissions and hooks are access control.** Mature organizations need all three, and so does working with AI.

## 4. How I Actually Work Now

1.  When I hand over a task, **I decide the tier**, not the AI. It takes 5 seconds and shapes the next 5 hours.
2.  Tier 1 → Plan Mode. I deliberately ask: "Where is this plan most likely wrong? Is there a simpler way?"
3.  Tier 2 → let it run; I read the test results and the diff summary.
4.  Every time the agent does something I later think "you should have asked me first," I add it to the Tier 1 list in `AGENTS.md`. **Rules files grow out of incidents.**

## 5. Conclusion: Restrictions Liberate

With boundaries in place, I delegate *more* to agents, not less.
Because when an agent starts making sweeping changes, I know it's because **I've already thought through the strategy.**

AI is your exoskeleton, maybe even a whole engineering team. But the brain stays in your own head.
Reclaim your thinking by setting boundaries, and in 2026, set them with mechanisms, not with polite requests.
