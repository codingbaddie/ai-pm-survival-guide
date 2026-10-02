# AI PM Survival Guide 🧠
> **Reclaiming Human Sovereignty in the Age of AI Agents.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/codingbaddie/ai-pm-survival-guide/pulls)
![Last reviewed](https://img.shields.io/badge/last%20reviewed-2026--10-blue)

[中文版 (Chinese Version)](./README_ZH.md)

---

## Manifesto
We are in an era where **code is cheap, but judgment is expensive**.

AI agents now read whole codebases, run commands, and open pull requests on their own. The PM's role has shifted from "managing execution" to **"managing intelligence,"** and now to **designing the system agents work inside**: the context they read, the boundaries they respect, and the skills they run.

This repository is not a prompt collection. It is a set of **mental models, mechanisms, and reusable skills** for people who want to lead AI, not be replaced by it.

> 🔁 This repo was first written in 2025 and fully revised in October 2026. Instead of quietly rewriting history, I documented what I got wrong: **[What I Got Wrong 9 Months Ago](./articles/What_I_Got_Wrong_EN.md)**.

## 📖 The Protocol Library

| Article | Key Idea | Languages |
|:--- |:--- |:--- |
| 🆕 **What I Got Wrong 9 Months Ago** | A self code review: which ideas survived, which tool advice expired, and why. | [English](./articles/What_I_Got_Wrong_EN.md) / [中文](./articles/What_I_Got_Wrong_ZH.md) |
| 🆕 **Turning PM Workflows into Skills** | From "using AI" to building team capability: a BRD writer/reviewer pair, an evidence-driven iteration loop, and lessons from 7 rounds of real use. | [English](./articles/Skills_as_Product_EN.md) / [中文](./articles/Skills_as_Product_ZH.md) |
| **Reclaiming Sovereignty** | The Tiered Engagement Model, implemented with mechanisms (`AGENTS.md`, Plan Mode, permissions, hooks), not just prompts. | [English](./articles/Boundaries_with_AI_EN.md) / [中文](./articles/Boundaries_with_AI_ZH.md) |
| **AI-Native Workflow Guide** | Turn a Git repo into the shared brain for you and your agents: context files, decision records, and keeping sensitive data out of agent context. | [English](./articles/AI_Native_Workflow_Guide_EN.md) / [中文](./articles/AI_Native_Workflow_Guide.md) |
| **From Prototype to Production** | Why the Prototype Illusion survives smarter AI, and why the bottleneck moved from writing code to reviewing it. | [English](./articles/From_Prototype_to_Production_EN.md) / [中文](./articles/From_Prototype_to_Production.md) |
| **Google Workspace × AI** | Making Docs, Sheets, and meetings agent-readable, and connecting through OAuth connectors instead of downloaded keys. | [English](./articles/Google_Workspace_Guide_EN.md) / [中文](./articles/Google_Workspace_Guide.md) |
| **The "Magic Tunnel" Workflow v2** | Zero-friction knowledge capture: say "mark this" and a skill files the lesson for you. | [English](./articles/Magic_Tunnel_Workflow.md) / [中文](./articles/Magic_Tunnel_Workflow_ZH.md) |

## 🛠 Use It Directly

| Path | What it is |
|:---|:---|
| [`templates/AGENTS.md`](./templates/AGENTS.md) | A project rules file with Tier 1 / Tier 2 zones. Copy it to your repo root. |
| [`skills/capture-learning`](./skills/capture-learning/SKILL.md) | Skill: distill the current session into a learning note and file it in the inbox. |
| [`skills/process-inbox`](./skills/process-inbox/SKILL.md) | Skill: triage inbox notes into article updates, with human confirmation before writing. |

Install the skills for Claude Code:

```bash
cp -r skills/* ~/.claude/skills/
```

## 📜 Changelog

- **2026-10** — Full revision. Replaced `.cursorrules` with `AGENTS.md` + Plan Mode + permissions; replaced the `mark` shell alias with two skills; removed the Service Account JSON-key advice; corrected the "LSP + Code Graph" claim; updated the Prototype-to-Production argument for agents. Added *What I Got Wrong* and *Turning PM Workflows into Skills*, plus `templates/` and `skills/`.
- **2025-12** — First edition: Boundaries with AI, AI-Native Workflow, Google Workspace, Prototype to Production, and the Magic Tunnel workflow.

## 🤝 Contribution
If you have found a better way to "tame the beast," please open a PR. Especially welcome:
- New mental models
- Battle-tested `AGENTS.md` rules or skills
- Failure stories (post-mortems of AI-led disasters)

---
*Created by [Coding Baddie](https://github.com/codingbaddie)*
