# 🚀 AI-Native Workflow Guide: How to Manage Your "Second Brain" with GitHub + IDE (For Non-Engineers)

*(This guide is written for PMs like me who are used to managing docs in Google Docs/Notion and prototyping in Claude Artifacts, but want to level up to using AI IDEs like Cursor/Windsurf/Gemini Code Assist for product development.)*

## Why Do You Need This Guide?

In the era of AI-assisted coding, I encountered a new challenge: **"Memory Loss."**
Previously, I kept documents in the cloud (Google Drive), and I could resume work from any computer. But now, when we `git clone` a project, the AI often asks: *"Who are you? Where did we leave off?"*

This is because Git only saves "Code," not our "Brain" (Decision process, TODOs). This guide shares an **AI-Native** project management methodology and teaches you how to elegantly handle the headache of **"Sensitive Data Backup."**

## 🤔 Why Switch from Claude Artifacts to an IDE?

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

## 💡 Core Concept: Treat the IDE as Your "Second Brain"

Don't just see the IDE (and its AI Chat window) as a place to write code; it is your Project Management Center.
To allow AI to instantly understand the context at any time, we need to create **"Context Files"** in the project root.

### 1. Essential File Structure
I organize my projects like this, so AI understands it in one second:

```text
my-awesome-project/
├── 📂 docs/                  # 💡 Puts PRDs, Interview Transcripts, Specs (AI reads this to know WHAT to build)
├── 📂 data/                  # 📊 Puts Data files (I'll teach you how to handle sensitive data below)
├── 📂 scripts/               # 🛠️ Puts Utility scripts for AI (e.g., data processing scripts)
├── 📝 task.md                # ✅ [IMPORTANT] Project Status Tracker (Our Shared Brain)
└── 📝 implementation_plan.md # 🏗️ [IMPORTANT] Technical Plan (The Construction Blueprint)
```

*   **`task.md`**: Like your Jira/Trello, but written directly in Markdown here. Before asking AI to work, ask it to read this file first, so it knows exactly where the progress is.
*   **`docs/`**: Download Google Docs as `.md` or `.txt` and put them here. AI reads local files much faster and accurately than reading networked Google Docs.

---

## 🔒 Advanced Value: "Invisibility Cloak" for Sensitive Data (.gitignore)

This is where beginners step on mines the most!
Some data (like Client Lists, API Keys) **MUST NEVER** be uploaded to public GitHub.

### Real-world Scenario
Suppose my project has a VIP Client List `data/VIP_Clients_Q1.csv` and a secret key file `secrets.json`.

**Step 1: Tell Git to "Ignore" Them**
Find or create a `.gitignore` file in your project root, and add the following content:

```gitignore
# Ignore all files in the sensitive data folder
data/VIP_Clients_Q1.csv
secrets.json

# Also ignore environment variable files
.env
```

**Step 2: Manual Backup**
Since these files aren't on GitHub, what if you change computers?
👉 **Back to the primitive method: Cloud Drive**
1. Upload `VIP_Clients_Q1.csv` to your private Google Drive folder.
2. After `git clone`-ing the project on a new computer.
3. Download the file from Google Drive and **manually place it back** into the `data/` folder.

This guarantees security while allowing smooth switching between computers!

---

## 🔄 The Complete Workflow: Switching from Computer A to B

Scenario: You worked halfway at the office (Computer A) and want to continue at home on your laptop (Computer B).

### At Computer A (Before Leaving)
1. Call AI: "Update `task.md`, check off what we've finished."
2. Run Git commands (or ask AI to do it):
   ```bash
   git add .
   git commit -m "update: Finished homepage design and task update"
   git push
   ```
3. Confirm sensitive data (like CSV) is backed up in Google Drive.

### At Computer B (At Home)
1. Open Terminal:
   ```bash
   git clone https://github.com/your-name/project.git
   ```
2. **[Critical Step]** Download the sensitive file (`VIP_Clients_Q1.csv`) from Google Drive and put it back in `data/` folder.
3. Open IDE, tell AI: "Please read `task.md` and tell me what to do next?"
4. 🚀 Seamless handoff, continue developing!

---

## Conclusion

As a PM or developer collaborating with AI, **learning to manage Context is more important than learning to write code.**
When you build this structure, you are no longer just "asking AI questions"; you are "running a product with AI."

*If you find this guide helpful, please Fork or Star my Repository!*
