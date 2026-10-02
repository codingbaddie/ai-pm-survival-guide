# 奪回思考主權：把「分級介入」從 Prompt 變成機制 (2026 改版)

> **這不是一篇教你寫 Prompt 的教學，這是一篇關於「人與 Agent 協作權力結構」的重新設計。**

[🇺🇸 English](./Boundaries_with_AI_EN.md) · *Last reviewed: 2026-10*

> 📝 **改版說明**：這篇的第一版寫於 2025 年，當時的解法是在 `.cursorrules` 裡用一段 Prompt「逼」AI 進入批判模式。概念到現在都還成立，但做法已經過時了。想看我當初錯在哪，請讀 [《我 9 個月前錯在哪》](./What_I_Got_Wrong_ZH.md)。

## 1. 問題變了：從「AI 太順從」到「Agent 太能幹」

2025 年初，我最大的痛點是 AI 是個 **Pleaser（討好者）**：你丟一個爛點子，它會用最高效率幫你實現那個爛點子。

到了現在，模型已經會反駁你、會問你「確定嗎？」。問題沒有消失，而是**換了形狀**：

*   **以前**：AI 只能寫一段 Code，你貼上去才會生效。你天生就是那道關卡。
*   **現在**：Agent 可以自己讀整個 Repo、跑指令、改十幾個檔案、開 PR。一個需求丟出去，回來就是一包完成品。

**危險的不再是「AI 不會思考」，而是「AI 思考得太快，快到你來不及介入」。**
當執行成本趨近於零，人類唯一剩下的槓桿就是：**決定什麼時候該停下來想。**

## 2. 分級介入模型 (Tiered Engagement Model) 依然成立

我當初從一次跟 AI 的爭執中悟出這件事：
我要求它「全面批判我、永遠不要順從」，它反過來說：*「修個小 Bug 也要辯證人生哲學，那叫分析癱瘓。」*

真正的協作不是全面接管，而是**分級治理**：

| | **Tier 1：Critical Mode（戰略層）** | **Tier 2：Execution Mode（戰術層）** |
|:---|:---|:---|
| **適用** | 核心架構、UX 流程、商業邏輯、資料模型 | Bug fix、UI 微調、重構、原型 |
| **判斷** | 單向門（難以回頭）、影響面大、需求模糊 | 雙向門（隨時可改）、低風險、需求明確 |
| **AI 行為** | 先問 Why、列出 Trade-off、**等人類拍板** | 照業界標準直接做完，做完再回報 |
| **人類角色** | 決策者 | 驗收者 |

三個判斷維度：
1.  **可逆性 (Reversibility)**：做錯了能不能 `git revert` 就好？
2.  **影響半徑 (Impact Radius)**：做錯了是「用起來有點煩」，還是「失去用戶信任」？
3.  **模糊度 (Ambiguity)**：目標清楚嗎？還是我自己都還沒想清楚？

## 3. 2026 的關鍵升級：別再「求」AI 守規矩，把規矩做成機制

第一版的做法是寫一段 Prompt 請 AI 自我判斷 Tier。問題是：**Prompt 是建議，不是約束。** 對話一長、任務一急，它就會被沖淡。

現在的 Agent 工具（Claude Code、Cursor、Codex 等）都提供了真正的「閘門」，我把分級模型拆成三層：

### 第 1 層：專案規則檔 —— 告訴 Agent「這裡的家規」
`.cursorrules` 已經被淘汰。現在的通用做法是在 Repo 根目錄放 **`AGENTS.md`**（多數 Agent 工具都會讀），Claude Code 則讀 `CLAUDE.md`（可以在裡面寫一行 `@AGENTS.md` 共用同一份）。

重點不是寫人格設定（「你是一位資深 PM」），而是寫**這個專案的 Tier 1 地雷區在哪裡**：

```markdown
## Tier 1 zones — stop and ask before changing
- Database schema / migrations
- Pricing, billing, anything touching money
- Auth & permissions
- Anything that changes what the user sees in the core checkout flow

For these: write a plan, list trade-offs, and wait for my explicit approval.
Everything else is Tier 2: just do it, run the tests, report back.
```

完整範本在 [`templates/AGENTS.md`](../templates/AGENTS.md)，可以直接複製。

### 第 2 層：Plan Mode —— Tier 1 的「先想再做」
大部分 Agent 工具現在都有 **Plan Mode**：Agent 只能讀、不能改，必須先交出一份計畫，你核准後才開始動手。

這就是 Tier 1 的機制化版本。我的習慣是：
*   **Tier 1 任務**：一律從 Plan Mode 開始。我審的是計畫，不是 Code。
*   **Tier 2 任務**：直接放行，甚至開自動接受編輯。

### 第 3 層：權限與 Hooks —— 物理上擋住單向門
有些事不能只靠「它會記得問我」。
*   **權限設定**：讓 `git push`、刪除檔案、對外發訊息這類動作一定要經過我同意。
*   **Hooks**：在 Agent 執行某些動作前自動跑檢查（例如：改到 `migrations/` 就強制停下來）。

> **Prompt 是文化，Plan Mode 是流程，權限與 Hooks 是門禁。** 成熟的組織三者都要有，跟 AI 協作也一樣。

## 4. 我現在怎麼用（實際節奏）

1.  丟需求時，**我先自己判斷 Tier**，而不是讓 AI 判斷。這一步花我 5 秒，但它決定了接下來 5 小時。
2.  Tier 1 → Plan Mode。我會刻意問：「這個計畫最可能錯在哪？有沒有更簡單的做法？」
3.  Tier 2 → 放手做，我只看測試結果和 diff 摘要。
4.  每次 Agent 做了我事後覺得「應該先問我」的事，我就把它補進 `AGENTS.md` 的 Tier 1 清單。**規則檔是從事故裡長出來的。**

### Tier 也決定用哪個模型
分級不只決定 AI 要不要先問我，也決定**該花多少錢**。
*   **Tier 1 的事用貴的模型**：規格判斷、trade-off、跨文件一致性檢查，我讓 Opus 在主對話裡做。
*   **Tier 2 的體力活派便宜的模型**：把定稿的規格轉成 HTML prototype、重複的畫面修改，我會叫它派 Sonnet 的 subagent 去做。subagent 讀不到主對話的脈絡，所以派工時規格和視覺規範要一次講清楚；做完一定由主對話驗收，打開畫面、對數字、檢查有沒有真實個資。

貴的模型做決策，便宜的模型做體力活。這跟帶團隊一樣：你不會叫最資深的人整天切版。

### 操作 PROD 的規則要先講
我會讓 Claude 用瀏覽器去 PROD 實際操作，例如截圖寫使用手冊、做教育訓練教材。開始前一定先講清楚：**不准改到任何資料**；如果操作過程一定要改，做完要還原。這是最典型的單向門，不能等它自己想到。

## 5. 結語：Restrictions Liberate

設好邊界之後，我反而敢把更多事交給 Agent。
因為我知道：當它開始大刀闊斧地改東西時，那一定是**我已經把戰略想清楚了**。

AI 是你的外骨骼，甚至是一整個工程團隊。但大腦必須長在你自己的頭上。
奪回思考主權，從設定邊界開始；而在 2026 年，邊界要用機制來設，不是用拜託的。
