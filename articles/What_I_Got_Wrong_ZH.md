# 🔁 我 9 個月前錯在哪：一個 AI PM 的自我 Code Review

[🇺🇸 English](./What_I_Got_Wrong_EN.md) · *Written: 2026-10*

> 這個 Repo 的第一版寫於 2025 年。2026 年 10 月我回頭重讀，發現**核心觀念大多還站得住，但工具層的建議幾乎全部過時**。
> 我沒有選擇默默改掉，而是把錯誤攤開來。在 AI 這個領域，「知道自己的知識有保鮮期」本身就是一種能力。

## 總表

| 主題 | 2025 年我說 | 2026 年我改成 | 為什麼改 |
|:---|:---|:---|:---|
| **AI 的主要風險** | AI 是討好者，會幫你實現爛點子 | Agent 太能幹，快到你來不及介入 | 模型變得會反駁；但 Agent 開始自己改檔案、跑指令，風險從「說錯」變成「做太多」 |
| **怎麼設邊界** | 在 `.cursorrules` 寫一段 Prompt 請 AI 自己判斷 Tier | `AGENTS.md` 寫地雷區 + Plan Mode + 權限 / Hooks | Prompt 是建議不是約束；`.cursorrules` 也已經被淘汰 |
| **網頁版 vs. IDE** | 要從 Claude 網頁版「轉戰」IDE | 介面不重要，重點是 AI 有沒有在真實 Repo 裡工作 | Coding Agent 已經同時存在於 Terminal、桌面、網頁、IDE |
| **IDE 為什麼比較懂 Code** | 靠 LSP + Code Graph 的結構化理解 | 靠 Agent 自己搜尋、讀檔、跑測試驗證 | **我當時寫錯了。** 這是聽起來很專業、但我沒有查證的說法 |
| **進度管理** | 手寫 `task.md` | 讓 Agent 自己更新進度檔，或用 MCP 直接讀寫團隊任務系統 | 人類手動維護的東西，最後都會過期 |
| **機敏資料** | `.gitignore` + 用 Google Drive 手動搬檔案 | 不只不進 Repo，也不進 Agent 的 Context；金鑰放密碼管理器 | Agent 會自己去開資料夾裡的檔案 |
| **Google Workspace 授權** | 每位 PM 開 Service Account、下載 JSON Key | 個人用 OAuth Connector / MCP；自動化才用 Service Account，而且不下載金鑰 | 散落的金鑰檔無法稽核、無法收回 |
| **Docs 分頁** | API 讀不到 Tabs，要手動加標題 | API 已支援；加 H1 只是保險 | 我把某個工具的限制當成平台的限制 |
| **Prototype → Production** | AI 做 0→60 分，工程師做 60→100 分 | Agent 能做到 80 分；最後 20 分是判斷、責任與 Review 能量 | 瓶頸從「寫 Code」變成「審 Code」 |
| **知識捕捉** | shell alias `mark` + 剪貼簿 | 兩個 Skill：說「記下來」就好 | 有更好的抽象層，就不該讓人類當搬運工 |

## 三個比「哪條規則錯了」更重要的教訓

### 1. 我把「工具的限制」誤當成「AI 的本質」
第一版很多建議其實是在繞過某個工具某個時期的缺陷，例如 Tabs 讀不到、網頁版不能跑程式。我卻把它們寫成「AI 就是這樣」的原則。
**現在我寫任何建議前會先問：這是原則，還是 workaround？** Workaround 要標日期。

### 2. 聽起來專業 ≠ 正確
「LSP + Code Graph」是我從某處讀到、覺得很有說服力就寫進文章的。我沒有實際查證 Agent 是怎麼運作的。
諷刺的是，這正是我在[《奪回思考主權》](./Boundaries_with_AI_ZH.md)裡警告大家的事：**停止思考，AI 就會加速你的錯誤**。這次被加速的是我自己。

### 3. 真正保值的，是「把判斷寫成機制」的能力
回頭看，留下來的都是**框架**：分級介入、整合債、Context 要存成檔案、人類保留決策權。被淘汰的都是**具體設定**。
所以這次改版，我把每個框架都配上了「機制」：用 Plan Mode 實現 Tier 1、用 Skill 實現知識捕捉、用 `AGENTS.md` 實現家規。框架是我的，機制可以隨工具更換。

## 我之後怎麼維護這個 Repo
*   每篇文章標上 `Last reviewed` 日期。
*   README 有 [Changelog](../README_ZH.md#-changelog)，記錄每次改了什麼、為什麼改。
*   每半年重讀一次。**如果半年後我還覺得每一條都對，那代表我沒在進步。**
