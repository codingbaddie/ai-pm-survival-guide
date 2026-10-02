# 🚀 The AI-Native Workflow for Non-Engineers: Turn a Git Repo into the Shared Brain for You and Your Agents (2026 Edition)

[🇹🇼 繁體中文](./AI_Native_Workflow_Guide.md) · *Last reviewed: 2026-10*

*(For PMs and domain experts who manage docs in Google Docs / Notion, prototype in Claude Artifacts, and now want AI agents to take real part in product development.)*

> 📝 **Revision note**: Version one was about "moving from the web chat to an IDE." Coding agents now live in the terminal, desktop apps, the web, and IDEs, so **the interface no longer matters**. The real dividing line is whether the AI is **reading what you pasted** or **working inside a real repo with its own hands.**

## Why This Guide?

The most painful problem I hit was **"memory loss"**:
switch computers or open a new chat, and the AI asks, "Who are you? Where did we leave off?"

The reason is simple: conversations disappear. **Files don't.**
So the first lesson of being AI-native isn't prompting. It's **writing decisions, specs, and progress as files in the repo.** Then any agent, any machine, or any new teammate can pick up the work in minutes.

---

## 🤔 "Chat + Uploaded Files" vs. "Agent Working in a Repo"

Claude Projects and ChatGPT file uploads are great for exploration, writing, and one-off prototypes. But once you move from *prototype* to *product*, the gap is obvious:

| | **Chat + uploaded files** | **Agent in a repo** (Claude Code, Cursor, Codex…) |
|:---|:---|:---|
| **What it sees** | The snapshot you uploaded | The whole project, as it is right now |
| **How it finds things** | Retrieval over files you gave it | Searches, opens files, follows references itself |
| **Can it verify?** | Only "looks right" | Runs the code and tests, sees errors, fixes them |
| **Output** | A snippet / an Artifact | A diff you can review and revert |

> ⚠️ In version one I claimed IDEs understand code through "LSP + Code Graph." That was imprecise. Today's coding agents mostly **search and read files the way an engineer would** (some tools add an index on top). The point is that they can **go look and check for themselves**, not some magical structural analysis.

### Why this matters for PMs
1.  **Avoid the Prototype Illusion**: A prototype built in a vacuum doesn't know your DB schema, design system, or existing APIs. Built inside the real repo, the agent hits those realities on day one. (See [From Prototype to Production](./From_Prototype_to_Production_EN.md).)
2.  **You hand over a working system**: Engineers get a branch or a PR, not a snippet they have to find a home for.
3.  **You can verify it yourself**: "Run this and show me a screenshot." A PM doesn't need to wait for an engineer to confirm something actually works.

---

## 💡 Core Idea: Context Files Are Your Second Brain

### 1. My project structure today

```text
my-awesome-project/
├── 📝 AGENTS.md            # 🧭 House rules for agents: what this is, how to run it, where to ask first
├── 📝 CLAUDE.md            # (if using Claude Code) a single line: @AGENTS.md
├── 📂 docs/
│   ├── prd/               # 💡 PRDs, interview notes, specs (how the AI knows what to build)
│   └── decisions/         # ⚖️ Decision records: why A and not B
├── 📂 data/
│   └── sample/            # 📊 De-identified sample data (real data never enters the repo)
├── 📝 .env.example         # 🔑 Which env vars exist, without the real values
└── 📝 .gitignore
```

*   **`AGENTS.md`**: The single most important file. Purpose, how to run, how to test, and the Tier 1 minefields. Template at [`templates/AGENTS.md`](../templates/AGENTS.md); the reasoning is in [Reclaiming Sovereignty](./Boundaries_with_AI_EN.md).
*   **`docs/decisions/`**: The most underrated file. Code tells an agent *what* things look like; only decision records tell it *why*, so it doesn't helpfully "fix" a deliberate design choice.
*   **Progress tracking**: In version one I hand-wrote `task.md`. Now the agent **updates the progress file itself** at the end of a chunk of work, or reads and updates tickets in the team's tracker (ClickUp, Linear, Jira) directly via MCP. The principle stays the same: **progress lives where the AI can read it.**

### 2. Keep context lean
A longer rules file isn't a better one. Every line competes for the agent's attention on every task.
My rule: **only write what the agent can't infer from the code** (business context, minefields, team conventions), and only add a line after an incident teaches you to.

---

## 🧱 In Practice: Making a Repo Hard to Misread

The above is the principle. Below is what I actually ran into and changed in 2026.

### 1. Engineers' agents won't dig through your branches
I used to open one branch per feature and edit the PRD there until I was happy, merging later. Then I realized engineers also have their Claude Code read the repo, and it looks at main by default. With too many branches, the spec effectively didn't exist.

So I reorganized:
- **main holds only current specs**, the version engineers should build from.
- **Proposals go in `proposals/`**, marked "for reference only, not decided" at the top.
- **One `decision_log` per domain**, with pending requests explicitly marked pending so they aren't read as decided.
- **CSVs containing customer data are removed from version control**, even in a private repo.

My test: if an agent that took no part in any discussion opens this repo, will it misread something? If yes, the structure is wrong.

### 2. The PRD states conclusions; the reasons go in the decision log
AI loves writing rationale: why A and not B, what the previous version was, what's out of scope. Very thorough, and engineers don't need it.

My rule now is simple: **the PRD says what dev builds and what QA verifies.** Rationale, iteration history, and rejected options all go in the `decision_log`. Explaining why is the PM's job; when I forget, I look it up there.

When I cut AI-written paragraphs, I ask one question: **if this is deleted, can dev still implement it correctly?** If yes, it goes.

Two more AI habits I keep catching:
- **Absolute words.** When I see "regardless," "always," or "never," I try one or two counterexamples. If one breaks it, the word was lazy.
- **Partial fixes.** QA flags one case and the AI patches only that line without revisiting the other branches. I ask directly: is this fixing a symptom or the principle?

### 3. Align first, then open tickets
A nutritionist once reported that the system said a client was missing their starting weight when it wasn't. The AI quickly opened a frontend and a backend ticket. After QA and frontend each commented, things got murkier; the three parties weren't even talking about the same problem.

What I did instead was go back to the original problem:
1. Delete the tickets.
2. Have the AI write a **consensus document**: what the current behavior gets wrong, what correct behavior looks like, every scenario listed. Written as "what the user expects to see," not in technical terms, with each product's behavior described separately.
3. Share it with frontend, backend, and QA together; open tickets only once we agree.
4. When the backend later changed approach, I had the AI update every spec that referenced it.

**Tickets are for dividing work, not for aligning understanding.** Open them before people agree and everyone builds their own interpretation.

One small trap: a ticket linked to a repo document that hadn't been pushed to the linked branch yet. A private repo doesn't say "file not found"; it just returns 404. I asked in the group chat and heard nothing for a whole day before realizing the link was broken, not that people were too busy. Now I confirm a file is on the remote before linking it.

---

## 🔒 Sensitive Data: One Step Beyond "Don't Push It to GitHub"

### Layer 1: Keep it out of the repo (`.gitignore`)

```gitignore
# Real data and secrets
data/raw/
*.csv
.env
secrets.json
```

Ship a `.env.example` so a new machine, teammate, or agent knows which variables are needed without seeing the values.

### Layer 2: Keep it out of the agent's context
What I didn't anticipate in 2025: **agents open files on their own.** Even if a file never reaches GitHub, if it's in your project folder, an agent may read it and send its contents to the model.

*   **Develop with de-identified samples**: Put fake or masked data in `data/sample/`; keep real customer lists outside the project folder.
*   **Say so in `AGENTS.md`**: "Don't read `data/raw/`; use `data/sample/` for the schema."
*   **Enforce with permissions**: Most agent tools let you deny reads on specific paths.

### Layer 3: Put secrets in the right place
API keys belong in a password manager or your company's secrets manager. **Don't paste them into a chat**, and don't shuttle them around via cloud drives.

---

## 🔄 Full Workflow: Switching from Computer A to Computer B

### On Computer A (end of day)
1.  Tell the agent: "Update the progress file with today's work and open questions, then commit and push."
2.  Glance at the commit to confirm nothing sensitive went in.

### On Computer B (start of day)
1.  `git clone` (or `git pull`) the project.
2.  Fill in secrets from your password manager, following `.env.example`.
3.  Tell the agent: "Read `AGENTS.md` and the progress file. Tell me where we are and what you'd do next."
4.  🚀 You're back in.

> 💡 Many agent tools also support cloud sessions you can check from your phone or pick up on another machine. But **files in the repo remain the most reliable handoff**, because they aren't tied to any one tool.

---

## Conclusion

As a PM, **managing context matters more than writing code**.
Tools turn over every six months, but "write your thinking down as files so any agent can pick up the work" doesn't go out of date.
With this structure in place, you're no longer asking an AI questions. You're running a product with a team of agents.

*If this helped, feel free to Star or Fork [this repo](https://github.com/codingbaddie/ai-pm-survival-guide)!*
