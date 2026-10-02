# 🧩 Turning PM Workflows into Skills: From "Using AI" to "Building AI Capability for the Team"

[🇹🇼 繁體中文](./Skills_as_Product_ZH.md) · *Last reviewed: 2026-10*

> Writing prompts is a personal skill. **Turning your team's processes into skills an agent can run repeatedly is a product skill.**
> This is how I turned the PM work my team and I do every day into skills, one by one, and the design principles I learned along the way.

## Why Skills, Not Prompts?

I used to keep a stash of "good prompts" in Notion and paste them when needed. The problems:
*   **Only I used them.** Teammates didn't know they existed or when to use them.
*   **I had to remember to paste.** Forget once and quality drops back to baseline.
*   **Improvements didn't spread.** I'd refine a prompt; everyone else kept the old one.

A **skill** is a folder whose `SKILL.md` says *when* to use it and *how*. The agent **decides on its own** when to load it, based on that description. Put it in a shared team plugin and everyone gets the same version and can improve it together.

> A prompt is a note; a skill is a product. Products have users, trigger contexts, versions, and iterations.

---

## The Skills I Built

My rule: **start with processes that are repetitive, have a standard, and are mentally draining.**

### 1. Both ends of a requirement: BRD Writer × BRD Reviewer
This pair is the one I'm proudest of, because it solves **cross-team communication**, not just my own efficiency.

| | **BRD Writer** (for business / professional-services teams) | **BRD Reviewer** (for PMs) |
|:---|:---|:---|
| **Pain** | Requesters don't know what a PM needs and send "we need a report" | PMs spend ages going back and forth after receiving a BRD |
| **What it does** | **Interviews** the requester to turn a vague pain point into a BRD a PM can decide on; can also self-check for gaps and contradictions | Finds information gaps from the PM's side and produces **a follow-up question list ready to send to the requester**; across multiple BRDs, flags **requirements that collide** |

**Key design choice**: Both skills share **the same definition of a good BRD**. Requesters are guided to answer the questions a PM will ask while they write, and the PM reviews against the same yardstick. It turns "requirement quality" into a contract both sides share.

<!-- TODO(author): add a before/after, e.g. "BRD follow-up rounds / turnaround went from X to Y" -->

### 2. Requirement convergence: from one sentence to one ticket
"I want to request a feature" → the skill asks **one question at a time**, working toward the real underlying problem, and converges on a requirement summary.
**It creates the ticket in our tracker only after the user explicitly confirms.**

### 3. Illustrated user manuals: the agent looks at the product and takes its own screenshots
Using browser automation, it walks through production, captures real screens, maintains one Markdown file as the source of truth, and exports a Word version for whoever needs it. When the PRD changes, I ask it to sync the manual.

### 4. Pull requests for non-engineers
Plenty of teammates can edit docs or config but get stuck on "how do I branch, push, and where does the PR go?" This skill checks permissions, creates the branch, writes the PR description from the repo's template, and **always asks the user to confirm before pushing.**

### 5. Shared team conventions: personal data and data usage
This skill doesn't perform any task. Its job is to **load automatically** whenever anyone handles member data, builds a report, or writes SQL, reminding them which fields can't appear, how to minimize data, and who to contact with questions.
**Make compliance the default instead of hoping everyone remembers.**

---

## 6 Principles for Designing Skills (Learned the Hard Way)

### 1. The `description` is your trigger. Write it the way users talk.
The agent decides whether to use a skill from its description. My first version said "assists in producing business requirement documents," and it never fired when people said "can you check what's missing in this requirement?"
Once I listed **the phrases users actually say** (in both languages, casual, with abbreviations), it started triggering reliably.

### 2. Anything with side effects waits for a human "yes"
Creating tickets, opening PRs, sending messages, pushing: if it affects anyone else, the skill hard-codes "show the user first and wait for confirmation."
That's Tier 1 of the [Tiered Engagement Model](./Boundaries_with_AI_EN.md), built into the process.

### 3. One skill, one user
At first I wanted BRD writing and BRD review in a single skill. Then I realized **different users need a completely different tone and different questions**: requesters need guidance in plain language; PMs need it direct and structured. Splitting them made both much better.

### 4. Extract shared rules into a "conventions skill"
Privacy rules were originally scattered across the reporting, SQL, and publishing skills; one change meant five edits. After extracting them into their own conventions skill, the others just say "read this before touching data." **Same as code: don't copy-paste, extract a shared module.**

### 5. Iterate from failures instead of writing it perfectly up front
Every time a skill underdelivers, I log the case (with `capture-learning` from the [Magic Tunnel](./Magic_Tunnel_Workflow.md)), and after a few I fix them in one pass. **Skill quality grows out of real use.**

### 6. Write for the agent, and for your teammates
`SKILL.md` is the best documentation of the process itself. A new hire reads it and learns what our team's BRD standard is. **When people and AI both use the same document, it doesn't go stale.**

---

## Conclusion: The AI-Native PM's Unit of Work Has Changed

A PM's output used to be **documents**: PRDs, specs, meeting notes.
Now there's another kind of output: **capability**. Turning a process into a skill turns my judgment into something the whole team uses every day, and it gets better the more it's used.

> I don't measure how AI-native I am by how fast *I* use AI, but by **whether the team can keep doing good work with the skills I leave behind after I'm gone.**

*This repo includes two ready-to-use examples: [`capture-learning`](../skills/capture-learning/SKILL.md) and [`process-inbox`](../skills/process-inbox/SKILL.md).*
