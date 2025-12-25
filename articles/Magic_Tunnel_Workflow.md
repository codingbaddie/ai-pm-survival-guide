# ⚡️ The "Magic Tunnel" Workflow: Zero-Friction Knowledge Capture

> "I don't want to copy-paste chat logs. I just want to teleport my learnings."

[🇹🇼 繁體中文 (Traditional Chinese)](./Magic_Tunnel_Workflow_ZH.md)

## The Problem
As a PM working across multiple projects, switching contexts to document learnings is painful.
- **Old Way**: Copy chat from Project A -> Switch Window -> Open Project B -> Find File -> Paste -> Format.
- **Friction**: High. Result: Learnings get lost.

## The Solution: `mark`
We built a "Magic Tunnel" using a simple CLI command.

### How it works
1.  **Anywhere**: In any project (VS Code, Terminal, Browser), copy the text you want to save.
2.  **Teleport**: Open your terminal and type:
    ```bash
    mark
    ```
3.  **Done**: The text is instantly appended to the `drafts/learning_inbox.md` in this repository.

### The "AI-to-AI Handover"
Since we can't paste 100 lines of chat, we use an **AI Relay**:
1.  Ask Project A's AI: *"Summarize this conversation into a Insight Note."*
    - *Tip: Use the [Prompt Template](../prompts/summarize_lesson.txt).*
2.  Copy the Summary into Clipboard.
3.  Run `mark`.
4.  Ask Project B's AI (me): *"Process my inbox."*

## Setup (New Computer / Re-setup)

If you switch computers, the `mark` command needs to find this repository on your new disk.

1.  **Download**: `git clone https://github.com/your-username/ai-collaboration-guide.git`
2.  **Enter**: `cd ai-collaboration-guide`
3.  **Link**: Run the setup script:

```bash
./scripts/setup_mark.sh && source ~/.zshrc
```

This script dynamically finds the current location of this repo and updates your shell configuration.

---
*This workflow proves that "Tooling" should follow "Behavior", not the other way around.*
