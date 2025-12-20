# PM x AI 協作指南 (AI Collaboration Guide)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

這份指南旨在協助 **產品經理 (PM)** 與 **工程師** 了解如何標準化 Google Workspace 文件（Docs, Sheets, Slides），以便 AI 助手能準確讀取並協助分析。

> **🛠️ 實作背景 (Implementation Context)**
> 
> 本專案實作於 **Google Antigravity** IDE 環境，並由 **Gemini 3 Pro** 模型核心驅動。
> 指南中的所有案例與檢查點，皆來自於真實的 Agent 開發過程，經過反覆測試與驗證，只分享那些讓 AI「已讀不回」的真實踩坑經驗。

## 🎯 為什麼需要這份指南？

在導入 AI Workflow 的過程中，我發現人類習慣的「視覺化排版」，對 AI 來說往往是閱讀障礙。

> **"AI 無法像人類一樣「登入 Google 帳號」並「點擊」按鈕。它是透過 API 與純文字來理解世界的。"**

本指南整理了實戰中遇到的「坑」與「標準化解法」，幫助團隊建立 AI 友善 (AI-Friendly) 的知識庫。

---

## 📖 核心原則 (Key Principles)

1.  **權限先行**：AI 需要專屬的「數位通行證 (Service Account)」才能進入文件。
2.  **文字為王**：越接近純文字的結構，AI 讀取越精準。
3.  **結構清晰**：使用明確的 Markdown 標題層級 (H1, H2)，取代顏色或字體大小的視覺暗示。

---

## ✅ 文件準備 Checklist

### Type A: Google Docs (文件)

| 檢核項目 | 問題 (Pain Point) | 標準解法 (Solution) |
| :--- | :--- | :--- |
| **連結處理** | ❌ **Smart Chips**<br>貼上網址後變成灰色的膠囊狀，API 讀取時往往會**遺失網址**，只剩標題。 | ✅ **標準超連結 (Hyperlink)**<br>使用藍色底線文字 (`Cmd+K`)，確保 `url` 屬性被保留。<br><br>👉 [範例連結](https://docs.google.com/) (O)<br>👉 `[📄 範例文件]` (X) |
| **分頁標示** | 🚫 **Tabs**<br>API 讀取會將所有分頁接成一串長文，AI 分不清邊界。 | ✅ **H1 標題路標**<br>在每個分頁內容的最頂端，手動加上 **H1 大標題** 寫下分頁名稱。<br>*(例：# Tab 1: 訪談紀錄)* |

### Type B: Google Sheets (試算表)

*   **指定工作表**：Prompt 時請明確指定工作表名稱（例：「請分析 'Q3 營收' 工作表」）。
*   **避免合併儲存格**：Merged Cells 會導致欄位對應錯亂，請盡量保持單純的表格結構。
*   **首列即標頭**：第一列 (Row 1) 必須是清晰的欄位名稱 (Header)。

### Type C: 會議錄影 (Meet/Zoom)

*   **能力現狀**：**Gemini Pro 3 原生支援讀取影片與音訊** (Multimodal)，技術上是可以直接分析 `.mp4` 檔案的。
*   **實務建議**：儘管模型讀得懂，但考慮到 **API 成本 (Token 消耗)** 與 **處理速度**，加上搜尋引擊 (RAG) 對純文字索引的支援度最好，仍建議提供 **逐字稿 (Transcript)**。
*   **最佳解法**：使用 Google Meet 自動產生的逐字稿，或用工具轉成 `.txt`，讓 AI 能以最低成本、最快速度進行精準分析。

---

## 🔐 如何授權 (Access Control)

為了確保資安與追蹤性，建議每位 PM 申請獨立的 Google Cloud Service Account。

### 1. 建立 Service Account
1. 前往 [Google Cloud Console](https://console.cloud.google.com/) > **IAM & Admin** > **Service Accounts**。
2. 建立新帳號 (例如：`pm-rachel-ai-agent`)。
3. 下載 **JSON Key** 並妥善保管（這就是你的 AI 數位身分證）。

### 2. 開放權限
在任何想讓 AI 讀取的 Google 文件中，點擊 **Share**，將 Service Account 的 Email 加入：

> `pm-name-ai@project-id.iam.gserviceaccount.com`

*   權限設定：**Viewer (檢視者)**

---

## 🤝 如何貢獻 (Contributing)

這是一個開源的知識庫，歡迎所有踩過 AI 坑的 PM 與工程師一起貢獻！
如果你發現了新的「AI 讀不到」的案例，歡迎提交 **Pull Request** 或建立 **Issue**。

## 📄 License

MIT © [Rachel Weng]
