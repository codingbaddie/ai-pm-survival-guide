# 🚀 非工程師也能懂的 AI 協作指南：把 Git Repo 變成你和 Agent 的「共享大腦」(2026 改版)

[🇺🇸 English](./AI_Native_Workflow_Guide_EN.md) · *Last reviewed: 2026-10*

*(寫給習慣用 Google Docs / Notion 管文件、用 Claude Artifacts 做 Prototype，現在想讓 AI Agent 真正參與產品開發的 PM 與領域專家。)*

> 📝 **改版說明**：第一版的主軸是「從網頁版轉戰 IDE」。現在 Coding Agent 已經同時存在於 Terminal、桌面 App、網頁和 IDE，**介面不是重點了**。真正的分水嶺是：**AI 是在「讀你貼給它的東西」，還是在「一個真實的 Repo 裡自己動手」。**

## 為什麼需要這篇指南？

我遇過最痛的問題叫 **「記憶斷層」**：
換一台電腦、開一個新對話，AI 就問：「你是誰？我們上次做到哪？」

原因很簡單：對話會消失，**檔案不會**。
所以 AI Native 的第一課不是 Prompt，而是：**把決策、規格、進度都寫成檔案，放進 Repo。** 這樣任何一個 Agent、任何一台電腦、任何一個新同事，都能在幾分鐘內接上。

---

## 🤔 「聊天 + 上傳檔案」 vs. 「Agent 在 Repo 裡工作」

Claude Projects、ChatGPT 上傳檔案都很好用，做探索、寫文件、做一次性的 Prototype 都夠了。但當你從「做 Prototype」走到「做 Product」，差別會變得很明顯：

| | **聊天 + 上傳檔案** | **Agent 在 Repo 裡** (Claude Code、Cursor、Codex…) |
|:---|:---|:---|
| **看到的東西** | 你上傳的那一版快照 | 現在這一刻的完整專案 |
| **怎麼找資料** | 從你給的檔案裡檢索 | 自己搜尋、開檔、追著引用一路讀下去 |
| **能不能驗證** | 只能「看起來對」 | 能跑程式、跑測試、看到錯誤再修 |
| **產出** | 一段 Code / 一個 Artifact | 一組改動 (diff)，可以 review、可以 revert |

> ⚠️ 第一版我寫說 IDE 是靠「LSP + Code Graph」理解程式碼。這不精確。現在的 Coding Agent 主要是**像工程師一樣自己去搜尋和閱讀檔案**（有些工具會再加上索引），重點在於它能**自己去看、自己去驗證**，而不是某種神奇的結構分析。

### 為什麼這對 PM 很重要？
1.  **避開「原型完成度幻覺」**：在真空環境做的 Prototype 不知道你們的 DB Schema、Design System、既有 API。在真實 Repo 裡做，Agent 一開始就會撞到這些現實。（延伸閱讀：[從 Prototype 到 Production](./From_Prototype_to_Production.md)）
2.  **交付的是能動的系統**：工程師拿到的是一個 branch 或 PR，不是一段要自己找地方貼的 Code。
3.  **你可以自己驗證**：「幫我把這個跑起來，截圖給我看」——PM 不用等工程師，也能確認東西真的會動。

---

## 💡 核心觀念：Context Files 就是你的第二大腦

### 1. 我現在的專案結構

```text
my-awesome-project/
├── 📝 AGENTS.md            # 🧭 給 Agent 的家規：專案是什麼、怎麼跑、哪些地方要先問我
├── 📝 CLAUDE.md            # (用 Claude Code 的話) 裡面一行 @AGENTS.md 就好
├── 📂 docs/
│   ├── prd/               # 💡 PRD、訪談紀錄、規格（AI 讀這裡才知道要做什麼）
│   └── decisions/         # ⚖️ 重要決策紀錄：為什麼選 A 不選 B
├── 📂 data/
│   └── sample/            # 📊 去識別化的範例資料（真實資料不進 Repo）
├── 📝 .env.example         # 🔑 環境變數「長怎樣」，但沒有真的值
└── 📝 .gitignore
```

*   **`AGENTS.md`**：最重要的一個檔。寫專案目的、怎麼跑、怎麼測試、哪些是 Tier 1 地雷區。範本在 [`templates/AGENTS.md`](../templates/AGENTS.md)，背後的邏輯在 [奪回思考主權](./Boundaries_with_AI_ZH.md)。
*   **`docs/decisions/`**：這是我覺得最被低估的檔案。Code 會告訴 Agent「現在長怎樣」，但只有決策紀錄能告訴它「為什麼長這樣」，避免它好心把你刻意的設計「修正」掉。
*   **進度追蹤**：第一版我手寫 `task.md`。現在我讓 Agent 在做完一段工作時**自己更新**進度檔，或直接透過 MCP 連到團隊的任務系統（ClickUp、Linear、Jira）去讀票、更新票。原則不變：**進度要存在 AI 讀得到的地方。**

### 2. 讓 Context 保持精簡
規則檔不是越長越好。每一行都會在每次任務中佔用 Agent 的注意力。
我的原則：**只寫 Agent 自己從 Code 看不出來的事**（商業脈絡、地雷區、團隊慣例），而且是被事故教訓過才加。

---

## 🔒 機敏資料：比「別上傳 GitHub」多想一步

### 第一層：別讓它進 Repo（`.gitignore`）

```gitignore
# 真實資料與金鑰
data/raw/
*.csv
.env
secrets.json
```

並提供 `.env.example`，讓新電腦、新同事、新 Agent 知道需要哪些變數，但看不到真的值。

### 第二層：別讓它進 Agent 的 Context
這是 2025 年我沒想到的：**Agent 會自己去開檔案。** 就算檔案沒上 GitHub，只要它在你的資料夾裡，Agent 就有可能讀到，並把內容送進模型。

*   **用去識別化的範例資料開發**：`data/sample/` 放假資料或遮罩過的資料，真實客戶名單不放在專案資料夾裡。
*   **在 `AGENTS.md` 寫清楚**：「不要讀取 `data/raw/`；需要資料結構時看 `data/sample/`。」
*   **用權限設定擋住**：大部分 Agent 工具都可以設定哪些路徑禁止讀取。

### 第三層：金鑰放對地方
API Key 放進密碼管理器或公司的 Secrets Manager，**不要貼進對話框**，也不要用雲端硬碟傳來傳去。

---

## 🔄 完整工作流：從 A 電腦切換到 B 電腦

### 在電腦 A（收工前）
1.  跟 Agent 說：「把今天的進度和還沒解決的問題更新到進度檔，然後幫我 commit 並 push。」
2.  看一眼它的 commit 內容，確認沒有機敏資料。

### 在電腦 B（開工時）
1.  `git clone`（或 `git pull`）專案。
2.  照 `.env.example` 從密碼管理器補上金鑰。
3.  跟 Agent 說：「讀一下 `AGENTS.md` 和進度檔，告訴我現在的狀態和下一步建議。」
4.  🚀 接上了。

> 💡 很多 Agent 工具現在也支援雲端執行的 Session，可以在手機上看進度、在另一台電腦接手。但**Repo 裡的檔案永遠是最可靠的交接方式**，因為它不綁任何一個工具。

---

## 結語

身為 PM，**學會管理 Context 比學會寫 Code 更重要**。
工具每半年就換一輪，但「把思考寫成檔案、讓任何 Agent 都能接手」這件事不會過時。
當你建立了這套結構，你就不再是在「問 AI 問題」，而是在「帶一個 AI 團隊經營產品」。

*如果這篇有幫助，歡迎 Star 或 Fork [這個 Repo](https://github.com/codingbaddie/ai-pm-survival-guide)！*
