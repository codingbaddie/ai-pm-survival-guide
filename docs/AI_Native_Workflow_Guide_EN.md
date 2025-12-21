# AI-Native Workflow Guide: How to Manage Your "Second Brain" with GitHub + IDE (For Non-Engineers)

*(This guide is written for PMs like me who are used to managing docs in Google Docs/Notion and prototyping in Claude Artifacts, but want to level up to using AI IDEs like Cursor/Windsurf/Gemini Code Assist for product development.)*

## Why Do You Need This Guide?

In the era of AI-assisted coding, I encountered a new challenge: **"Memory Loss."**
Previously, I kept documents in the cloud (Google Drive), and I could resume work from any computer. But now, when we `git clone` a project, the AI often asks: *"Who are you? Where did we leave off?"*

This is because Git only saves "Code," not our "Brain" (Decision process, TODOs). This guide shares an **AI-Native** project management methodology and teaches you how to elegantly handle the headache of **"Sensitive Data Backup."**

## Why Switch from Claude Artifacts to an IDE?

You might think: *"Claude Pro allows uploading CSVs as Knowledge Base, and I can iterate on multiple Artifacts at once!"* True, the web version is powerful. But when you move from "Prototyping" to "Product," the IDE's killer apps are **"Structural Understanding"** and **"Collaboration"**:

### 1. Static Knowledge vs. Live Engineering Index
*   **Web AI (Claude Projects)**: Uses Vector Search. It's like doing a keyword search in a library—good for retrieving text, but bad for understanding logic.
*   **IDE (Antigravity/Cursor)**: Uses **LSP (Language Server Protocol) + Code Graph**. It knows that `UserID` in File A is defined in File B and referenced in File C. It understands the **Structure**, not just the text.

### 2. Snippets vs. Repository
*   **Web AI**: Gives you code snippets. You spend time copy-pasting and fixing imports.
*   **IDE**: Gives you a **Run-ready Repository**. The file structure, dependencies (`package.json`), and environment config are all standardized.

### 3. The "Prototype Illusion"
*   **Web AI**: Creates a perfect UI in a vacuum. It looks great but fails when connected to a real backend.
*   **IDE**: Forces you to confront **Integration Debt** early. You see the bugs immediately as you code.

---

## The Workflow: 3 Steps to AI-Native

### Step 1: Git is Not Just for Code (The `.md` Brain)
Don't let context live in the chat window. Let it live in the Repo.
Create these two files in your root directory:

1.  **`task.md`**: Your Project Status.
    *   Tracks what is done, WIP, and TODO.
    *   *Pro Tip*: AI reads this first to know "where we are."

2.  **`implementation_plan.md`**: Your Technical Decisions.
    *   Records "Why we chose this library" or "How the database is designed."
    *   *Pro Tip*: This saves you from repeating the same requirements to the AI.

### Step 2: The "Digital Safe" for Secrets (`.gitignore`)
As a PM, you deal with sensitive data (Customer CSVs, API Keys). **NEVER commit these to GitHub.**

1.  Create a `.gitignore` file.
2.  Add paths like `data/*.csv`, `secrets.json`, `.env`.
3.  **The trick**: Keep these files in your local folder. When you change computers, just copy them via a secure channel (like Google Drive or USB) to the same folder.
4.  Result: AI in the IDE can read them locally to generate insights, but they never leave your machine's Git history.

### Step 3: Context Sync
When you start a new session (or share work with an engineer):
1.  **Pull** the latest code.
2.  **Read** `task.md` to get up to speed.
3.  **Start** coding/writing.

This turns the AI from a "Chatbot" into a "Colleague" who shares the same context as you.
