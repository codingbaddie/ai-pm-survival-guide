# 🧩 Turning PM Workflows into Skills: From "Using AI" to Building AI Capability for the Team

[🇹🇼 繁體中文](./Skills_as_Product_ZH.md) · *Last reviewed: 2026-10*

> Writing prompts is a personal skill. Turning a process into a skill that an agent runs repeatedly, and that other people can install, is a product skill.

I built my first skill in February 2026. I now have four in daily use, and one of them is in my company's plugin marketplace, where business teams actually use it to write requirements. This is how I build and iterate them, and what went wrong along the way.

## Why skills, not prompts

I used to keep good prompts in Notion and paste them when needed. The problems were obvious:

- Only I used them. Teammates didn't know they existed or when to use them.
- Forget to paste once and quality drops back to baseline.
- I'd improve a prompt; everyone else kept the old one.

A skill is a folder whose `SKILL.md` says *when* to use it and *how*. The agent reads the description and decides on its own whether to load it. Put it in a team plugin and everyone gets the same version.

To me, a prompt is a note and a skill is a product. Products have users, usage contexts, versions, and iterations.

## The skills I built

| Skill | Who uses it | What it does |
|:---|:---|:---|
| **PM consultant** | Me | Makes Claude work like a senior PM: trade-offs with every recommendation, align before acting, challenge me proactively |
| **manual-writer** | Me | Walks through production in a browser, captures real screens, maintains one Markdown source of truth, exports Word for whoever needs it |
| **brd-writer** | Business / professional-services teams | Interviews the requester and turns "we need a report" into a BRD a PM can make decisions on |
| **brd-reviewer** | PMs | Finds gaps in a received BRD and produces a follow-up question list ready to send; across multiple BRDs, flags where they collide |

The brd-writer / brd-reviewer pair matters most, because it cuts cross-team communication cost, not just my own time.

## Two ends of one requirement: why it's two skills

At first there was only brd-writer. After a while I realized I had stuffed "how a PM reviews a BRD" into it too. But the users are completely different:

- Requesters need guidance, plain language, and to know which question to answer next.
- PMs need it direct and structured, with the gaps visible at a glance.

So I split it. And I deliberately **did not give them a shared checklist**:

- brd-writer's checklist is **technique-oriented**: how to ask so you actually get an answer.
- brd-reviewer's checklist is **symptom-oriented**: what a finished document looks like when something wasn't asked.

Same subject, different vantage point, different things to check. Forcing them into one list would make both worse.

brd-reviewer also has two deliberate design choices:

1. **It never asks the requester to rewrite the original BRD.** Answers go in the question list. Asking a requester to edit the original means asking them to reconcile across sections, which is the PM's job when writing the PRD and shouldn't happen twice. Leaving the original untouched also has value: it records how the requester originally saw the problem.
2. **It separates "what the requester must supply" from "what the PM must decide."** Development cost, technical feasibility, phasing, and how to merge overlapping requests are PM calls. They never get packaged as questions for the requester.

## How I iterate a skill

brd-writer has gone through 7 rounds since it launched in August. Every round follows the same loop:

1. **Only real evidence triggers a round.** A BRD a requester actually wrote with the skill, my own PM comments on it in Google Docs, or my dissatisfaction with the previous fix. "It could be better" doesn't count.
2. **Check against the skill's own rules first.** Was a rule missing, or was it there and the agent didn't follow it?
3. **Classify each gap before designing a fix.** Was it something the requester should have supplied but wasn't asked? Add an elicitation technique. Was it actually a PM judgment call? Then it shouldn't become a question for the requester at all; change the design instead.
4. **Make the fix concrete.** Not "please pay attention to X," but a named technique with steps.

Some real examples:

- **Self-review must rely on evidence, not memory.** I assumed an AI checking its own output in the same conversation was useless: ask "did I cover X?" and it always says yes. It turned out the problem wasn't context isolation but how the question was phrased. A check like "list every verb in section 1 and see whether each is followed by a concrete action" can't be fooled. So every item on the review checklist became "check action → what failure looks like → how to fix it."
- **A new conversation is a free third-party review.** Requesters use the web app, so there's no subagent. Instead, right when they get the result and are happiest with it, the skill prints a ready-to-paste prompt for a fresh conversation, so a clean Claude does the review.
- **A wrong filter is worse than none.** The multi-party meeting agenda originally filtered for "issues no single party can answer." But the PM's own decisions (system design, prioritization) match that too, so they landed on the agenda. Now it routes three ways: one party can answer → question list; needs both sides → meeting agenda; it's the PM's call → nowhere.
- **Separate "who detects" from "who acts."** The rules table had a single "responsible role" column, which read as if nutritionists had to notice who'd been absent for 20 days. But human detection is exactly the pain the requirement exists to remove.
- **Don't ask users to do what their environment can't.** The skill said "save as a Markdown file in the working directory." The web app can't do that, and requesters got stuck.
- **Tag every number with its source.** [measured], [estimated], [to verify]. A PM seeing an estimate knows what to check before deciding on it.

Also: the version in the company plugin goes through a PR reviewed by an engineer for every release. The plugin was renamed on that review's advice, from a name tied to one skill to one scoped by audience, so future skills for business teams can live alongside it.

Claude and I worked out this loop over the first few rounds. Then I told it to "learn this iteration process" and save it to memory, and now every other skill gets iterated the same way.

## What I learned building skills

**A skill is not a resident persona.** My PM consultant skill started out in the skills folder, and I assumed Claude Code applied it to every conversation. It doesn't: a skill loads only when triggered. I moved the always-on core rules into the project's `CLAUDE.md` and left the detailed modes in the skill, to be read when needed. **Always-on rules go in CLAUDE.md; on-demand procedures go in a skill.**

**The description is the trigger, so write it the way users talk.** The agent decides from the description. I listed what requesters actually say: "can you look at this BRD," "what's missing here," "review BRD," "these two requests overlap."

**Don't build infrastructure for a problem that hasn't happened yet.** I wanted brd-reviewer to maintain a "requirements registry" recording which people and systems each BRD touches, so new ones could be checked automatically. I decided not to build it yet: with two or three BRDs, reading them is enough. The design and the trigger condition are written in the README. I'll build it when I catch myself thinking "this one seems related to an earlier one, but I'd have to go dig."

**Know what environment your users are in.** I wanted requesters to get an independent review after writing a BRD. My instinct was a subagent, but requesters use Claude Chat, not Claude Code, so there's no subagent. Instead the skill guides them to open a fresh conversation for the review.

**Define the scope of permission up front.** Once, when I asked Claude to add brd-writer, it also modified my existing PM skill and pushed it. Since then I state before starting: what may be added this time and what must not be touched. An agent that can push and open PRs needs a confirmation point at every step.

## Conclusion

A PM's output used to be documents: PRDs, specs, meeting notes. Now there's another kind of output: **capability**. Turning a process into a skill turns my judgment into something the team uses every day and that gets better the more it's used.

I don't measure how AI-native I am by how fast I use AI, but by whether the team can keep doing good work with the skills I leave behind when I'm not there.

All four skills in this article are public and installable at [codingbaddie/agent-skills](https://github.com/codingbaddie/agent-skills). This repo also includes two examples: [`capture-learning`](../skills/capture-learning/SKILL.md) and [`process-inbox`](../skills/process-inbox/SKILL.md).
