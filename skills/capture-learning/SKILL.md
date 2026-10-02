---
name: capture-learning
description: Save a lesson from the current session into the AI PM Survival Guide learning inbox. Use when the user says "mark this", "記下來", "存到 inbox", "capture this lesson", or asks to save what was learned in this conversation for later writing.
---

# Capture Learning

Turn the useful part of the current session into one short learning note and append it to the inbox. The user should never have to copy, paste, or switch windows.

## Inbox location

`~/Documents/ai-pm-survival-guide/drafts/learning_inbox.md`

(If the repo lives elsewhere, edit this path once after installing the skill.)

If the file doesn't exist, stop and tell the user the path you expected. Don't create the repo.

## Write the note

Distill the session. Don't transcribe it. One note per call, under ~15 lines.

```markdown
## <Topic, as a short noun phrase>
*Captured: <YYYY-MM-DD> · Source: <project or context, one phrase>*

- **Problem**: what was actually wrong or unclear (not the first symptom)
- **What worked**: the technique or mental model that solved it
- **Next time**: what to do differently, phrased as a rule
- **Evidence**: one concrete detail (a command, a number, a quote) that makes it real
```

Rules:
- Strip anything confidential: customer data, internal names, credentials, unreleased numbers. When unsure, generalize ("a B2B client", "an internal dashboard").
- If the session had no real lesson, say so and don't append anything.
- Append to the end of the file. Never rewrite or delete existing notes.

## Confirm

Show the user the note you appended, in one block, plus the file path. No other commentary.
