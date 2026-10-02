# ⚡️ The "Magic Tunnel" Workflow v2: Let the Agent Save Its Own Lessons with Skills (2026 Edition)

> "I don't want to copy-paste chat logs. I just want to teleport my learnings."

[🇹🇼 繁體中文](./Magic_Tunnel_Workflow_ZH.md) · *Last reviewed: 2026-10*

> 📝 **Revision note**: v1 was a shell alias, `mark`: ask the AI for a summary → copy it → switch to the terminal and type `mark` → the clipboard gets appended to the inbox. It worked, but a human was still doing the carrying. v2 hands the whole job to the agent: **you just say "mark this."** (The v1 script remains in git history.)

## The Problem
When you work across several projects, capturing what you learn is painful:
- **Oldest way**: Copy chat → switch windows → open the other project → find the file → paste → format.
- **v1 (`mark`)**: No window switching, but still three steps: ask for a summary → copy → run a command.
- **Result**: Any friction at all, and the lesson doesn't get written down.

## v2: Two Skills

A **skill** is a folder with a `SKILL.md` describing when to use it and how. The agent loads it on its own at the right moment. It works in Claude Code and other tools that support the Agent Skills format.

This repo ships two:

| Skill | You say | The agent |
|:---|:---|:---|
| [`capture-learning`](../skills/capture-learning/SKILL.md) | "mark this" / 「記下來」 | Distills the session into one learning note (problem → what worked → next time → evidence), **strips confidential details**, and appends it to `drafts/learning_inbox.md` |
| [`process-inbox`](../skills/process-inbox/SKILL.md) | "process my inbox" | Triages each note (update an article / new article / hold / drop), **waits for my confirmation**, then writes both language versions |

### Why it beats v1
1.  **No carrying**: Same in every project and every session, without touching the clipboard.
2.  **Consistent quality**: The note format lives in the skill, so there's no prompt template to paste each time.
3.  **Built-in privacy**: Step one removes customer data, internal names, and unreleased numbers. v1 pasted whatever was on the clipboard.
4.  **The human keeps the call**: `process-inbox` always shows me the triage first. Which ideas get published is the author's judgment, not the AI's.

## Setup

1.  **Clone this repo**:
    ```bash
    git clone https://github.com/codingbaddie/ai-pm-survival-guide.git ~/Documents/ai-pm-survival-guide
    ```
2.  **Install the skills** (Claude Code example, at user level so every project can use them):
    ```bash
    cp -r ~/Documents/ai-pm-survival-guide/skills/* ~/.claude/skills/
    ```
3.  If the repo lives somewhere else, edit the inbox path in `capture-learning/SKILL.md`.

From then on, just say "mark this" in any project.

---
*This workflow proves that tooling should follow behavior. The best tool saves you from even having to use it.*
