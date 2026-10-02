# 📄 Google Workspace × AI: Making Your Docs Readable by Agents (2026 Edition)

[🇹🇼 繁體中文](./Google_Workspace_Guide.md) · *Last reviewed: 2026-10*

*(Pitfalls I hit in practice and the standard fixes, to help teams build an AI-friendly knowledge base.)*

> 📝 **Revision note**: Version one told every PM to create a Service Account and download a JSON key. By today's standards that's a **security anti-pattern**, so it's gone. The Google Docs API can also read Tabs now, and that section has been updated.

## 🎯 Core Idea

> **AI doesn't *look* at your document. It *reads* it through an API or exported text.**

Visual formatting that humans rely on (colors, chip links, merged cells) often loses information when converted to text.
A doc that's friendly to AI is **always friendlier to a new teammate too**: clear structure, explicit links, meaningful headings.

---

## 🔐 Step 1: Connect AI to Workspace the Right Way

### ✅ Recommended: Official connectors / MCP, authorized as *you*
Mainstream AI tools now connect to Google Drive / Docs / Sheets directly:
*   **Claude**: Enable the Google Drive (and related) connectors in settings and authorize via OAuth.
*   **Gemini in Workspace**: Built into Docs, Sheets, and Gmail.
*   **Coding agents** (Claude Code, Cursor, etc.): Connect a Google Workspace MCP server.

The benefit: **the AI only sees files you can already see.** Access follows your account and is revoked automatically when you change roles or leave. There's no key file to look after.

### ⚠️ Use a Service Account only for automation
Scheduled jobs and server-side bots do need a Service Account. If you go that route:
*   **Don't download a JSON key.** A leaked key file is a leaked account. Google itself advises avoiding them, and many organizations block key creation by default.
*   Prefer Workload Identity Federation, or an identity attached directly to a Google Cloud resource.
*   Grant the minimum: share only the folders needed, as **Viewer**.

> In version one I recommended "each PM creates a Service Account and downloads a JSON key as the AI's digital ID." That's convenient for a small team, but keys end up scattered across laptops, unauditable and hard to revoke. **For personal use, always go through an OAuth connector.**

---

## ✅ Document Readiness Checklist

### Type A: Google Docs

| Check | Problem | Recommendation |
| :--- | :--- | :--- |
| **Links** | ❌ **Smart Chips** (grey pills)<br>Depending on the tool, conversion to text may **keep the title but drop the URL**. | ✅ Use **standard hyperlinks** (`Cmd+K`) for important references, or paste the URL alongside. |
| **Tabs** | ⚠️ The Docs API reads tabs now, but not every connector or export format preserves tab boundaries. | ✅ Put an **H1 heading** with the tab name at the top of each tab. Cheap, and every tool understands it. |
| **Heading levels** | ❌ Faking headings with bold, enlarged text. | ✅ Use real Heading 1/2/3. AI relies on headings to understand structure. |
| **Info inside images** | ❌ Key numbers exist only in a screenshot. | ✅ Write the key points or numbers as text next to the image. |

### Type B: Google Sheets
*   **One sheet, one purpose.** Name the sheet explicitly in your prompt (e.g., "Analyze the 'Q3 Revenue' sheet").
*   **No merged cells.** Row 1 is a clean header row.
*   **Separate data from reports**: raw data on one sheet, pivots and charts on another. AI is most accurate on raw data.
*   **Don't hand sheets with personal data straight to AI**: make a de-identified or aggregated copy first.

### Type C: Meeting Recordings (Meet / Zoom)
*   **Capability**: Mainstream multimodal models can watch video and listen to audio directly.
*   **Practical advice**: Still prefer **transcripts / AI meeting notes**. Text is cheaper, faster, and easiest to search and cite. Send video only when the visuals matter (demo recordings, usability tests).
*   **Best practice**: Turn on Meet transcripts or AI notes, save them to a fixed folder with consistent naming (e.g., `2026-10-02_Product-Weekly`), and AI can search them directly through a connector.

---

## 🧭 Team-Level Recommendations

1.  **A fixed "AI reading area"**: One Drive folder for PRDs, decision records, and meeting notes, with naming rules. AI and new hires both know where to look.
2.  **Retire stale docs**: AI can't tell which version is old. Mark outdated docs "Deprecated" or move them to an archive, or it will confidently cite the wrong one.
3.  **Important things eventually belong in the repo**: Specs an agent will use repeatedly should be exported to Markdown in the project's `docs/` (see the [AI-Native Workflow Guide](./AI_Native_Workflow_Guide_EN.md)).
