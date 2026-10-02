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
