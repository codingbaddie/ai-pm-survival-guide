# 📄 Google Workspace Pitfalls: Why Can't AI Read Your Docs?

*(This guide compiles real-world "pitfalls" and "standard solutions" to help teams build an AI-Friendly knowledge base.)*

## 🎯 Why This Guide?

In adopting an AI Workflow, I discovered that the "Visual Formatting" humans love is often a reading barrier for AI.

> **"AI cannot 'login to Google' and 'click' buttons like a human. It understands the world through APIs and Plain Text."**

## ✅ Document Preparation Checklist

### Type A: Google Docs

| Item | The Pain Point | The Solution |
| :--- | :--- | :--- |
| **Links** | ❌ **Smart Chips**<br>When you paste a URL and it turns into a grey bubble. The API often loses the URL and only sees the title. | ✅ **Standard Hyperlink**<br>Use blue underlined text (`Cmd+K`) to ensure the `url` attribute is preserved.<br><br>👉 [Example](https://docs.google.com/) (Yes)<br>👉 `[📄 Chip]` (No) |
| **Tabs** | 🚫 **Tabs (Pageless)**<br>The API reads all tabs as one long string of text. AI gets confused about boundaries. | ✅ **H1 Header Roadmaps**<br>Manually add an **H1 Header** at the top of each section content.<br>*(e.g., # Tab 1: Interview Notes)* |

### Type B: Google Sheets

*   **Specify the Sheet**: Explicitly prompt the Sheet Name (e.g., "Analyze the 'Q3 Revenue' tab").
*   **Avoid Merged Cells**: Merged cells mess up column mapping. Keep table structures simple.
*   **Row 1 is Header**: The first row must be clear column names.

### Type C: Meeting Recordings (Meet/Zoom)

*   **Capability**: **Gemini 3 Pro natively supports Video/Audio** (Multimodal). Technically, it can watch `.mp4` files.
*   **Recommendation**: Despite the capability, considering **API Cost (Tokens)** and **Speed**, plus RAG efficiency, it is highly recommended to provide **Transcripts**.
*   **Best Practice**: Use auto-generated transcripts (Meet) or convert to `.txt` for the fastest, cheapest, and most accurate analysis.

---

## 🔐 Access Control

To ensure security and auditability, every PM should request a dedicated Google Cloud Service Account.

### 1. Create Service Account
1. Go to [Google Cloud Console](https://console.cloud.google.com/) > **IAM & Admin** > **Service Accounts**.
2. Create new account (e.g., `pm-rachel-ai-agent`).
3. Download the **JSON Key** and store it safely (This is your AI's digital passport).

### 2. Grant Access
In any Google Doc you want the AI to read, click **Share** and add the Service Account's Email:

> `pm-name-ai@project-id.iam.gserviceaccount.com`

*   Role: **Viewer**
