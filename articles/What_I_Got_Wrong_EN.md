# 🔁 What I Got Wrong 9 Months Ago: An AI PM's Self Code Review

[🇹🇼 繁體中文](./What_I_Got_Wrong_ZH.md) · *Written: 2026-10*

> The first version of this repo was written in 2025. Rereading it in October 2026, I found that **most of the core ideas still hold, but almost every tool-level recommendation is out of date.**
> Rather than quietly editing them away, I'm putting the mistakes on the table. In AI, knowing that your knowledge has a shelf life is a skill in itself.

## Summary

| Topic | What I said in 2025 | What I say in 2026 | Why it changed |
|:---|:---|:---|:---|
| **Main AI risk** | AI is a pleaser that will build your bad idea | Agents are so capable they move faster than you can intervene | Models push back now, but agents edit files and run commands themselves; the risk moved from "says the wrong thing" to "does too much" |
| **Setting boundaries** | A prompt in `.cursorrules` asking the AI to pick its own tier | `AGENTS.md` listing minefields + Plan Mode + permissions / hooks | A prompt is a suggestion, not a constraint; `.cursorrules` is deprecated anyway |
| **Web vs. IDE** | "Move" from Claude's web app to an IDE | The interface doesn't matter; what matters is whether the AI works in a real repo | Coding agents now live in the terminal, desktop, web, and IDEs |
| **Why IDEs understand code** | Structural understanding via LSP + Code Graph | Agents search, read files, and verify by running tests | **I got this wrong.** It sounded expert and I never checked it |
| **Progress tracking** | Hand-written `task.md` | The agent updates the progress file, or reads and writes the team tracker via MCP | Anything humans maintain by hand eventually goes stale |
| **Sensitive data** | `.gitignore` + copy files by hand via Google Drive | Keep it out of the repo *and* out of the agent's context; secrets in a password manager | Agents open files in your folder on their own |
| **Google Workspace access** | Every PM creates a Service Account and downloads a JSON key | OAuth connectors / MCP for personal use; Service Accounts only for automation, without downloaded keys | Scattered key files can't be audited or revoked |
| **Docs tabs** | The API can't read tabs, so add headings by hand | The API supports them; an H1 is just insurance | I mistook one tool's limitation for the platform's |
| **Prototype → Production** | AI does 0→60, engineers do 60→100 | Agents reach 80; the last 20 is judgment, accountability, and review capacity | The bottleneck moved from writing code to reviewing it |
| **Knowledge capture** | A `mark` shell alias + the clipboard | Two skills: just say "mark this" | With a better abstraction available, a human shouldn't be the courier |

## Three Lessons That Matter More Than Any Single Rule

### 1. I mistook tool limitations for the nature of AI
Many v1 recommendations were really workarounds for a specific tool at a specific moment: tabs that couldn't be read, a web app that couldn't run code. I wrote them up as principles about how AI works.
**Now, before writing any advice, I ask: is this a principle or a workaround?** Workarounds get a date.

### 2. Sounding expert ≠ being right
"LSP + Code Graph" was something I read somewhere, found convincing, and put in an article. I never verified how agents actually work.
Ironically, that's exactly what I warned about in [Reclaiming Sovereignty](./Boundaries_with_AI_EN.md): **stop thinking and AI accelerates your mistakes.** This time the mistake it accelerated was mine.

### 3. What lasts is the ability to turn judgment into mechanisms
Looking back, the parts that survived are **frameworks**: tiered engagement, integration debt, context as files, humans keep the decision. The parts that died are **specific configurations**.
So in this revision, every framework is paired with a mechanism: Plan Mode implements Tier 1, skills implement knowledge capture, `AGENTS.md` implements the house rules. The frameworks are mine; the mechanisms can change with the tools.

## How I'll Maintain This Repo
*   Every article carries a `Last reviewed` date.
*   The README has a [Changelog](../README.md#-changelog) recording what changed and why.
*   I reread everything every six months. **If six months from now I still think every line is right, I haven't been learning.**
