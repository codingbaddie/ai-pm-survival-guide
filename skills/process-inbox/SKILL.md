---
name: process-inbox
description: Turn notes in the AI PM Survival Guide learning inbox into article drafts or updates to existing articles. Use when the user says "process my inbox", "整理我的收件夾", "整理 inbox", or asks which captured lessons are worth writing up.
---

# Process Inbox

Work inside the `ai-pm-survival-guide` repo. Inbox: `drafts/learning_inbox.md`. Articles: `articles/` (bilingual: Chinese and English versions of each).

## 1. Triage

Read every note under `# Incoming Notes`. For each, decide one of:
- **Update**: it sharpens, corrects, or adds evidence to an existing article. Name the article and section.
- **New**: it's a distinct idea, and there are at least two notes on it or one note with strong evidence.
- **Hold**: interesting but thin. Leave it in the inbox.
- **Drop**: obsolete or too project-specific.

Show the triage as a table and **wait for the user to confirm** before writing anything. Which ideas get published is the author's call.

## 2. Write

For confirmed items:
- Match the existing voice: first person, concrete stories, a clear "what I do now," short sections with emoji headings.
- Write the Chinese (Traditional, Taiwan usage) and English versions together. Keep them saying the same thing, not translated word for word.
- Update `Last reviewed` on any article you touch.
- New articles: add a row to both `README.md` and `README_ZH.md`, and a line to the Changelog.

## 3. Clean up

Remove processed notes (Update / New / Drop) from the inbox. Keep Hold notes. Never delete the inbox header.

## 4. Report

List the files changed and the notes still held. Don't commit; the user reviews first.
