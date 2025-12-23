# 奪回思考主權：為什麼你的 AI 需要一位嚴厲的產品經理？(附實戰設定檔)

> **這不是一篇教你如何寫 Prompt 的教學，這是一篇關於「協作權力結構」的重新設計。**

## 1. 蜜月期後的幻滅：AI 唯唯諾諾的陷阱

每個剛開始使用 Cursor 或 Claude 的開發者都經歷過那個「蜜月期」。你丟出一個模糊的想法，AI 回覆：「沒問題！這是一個很棒的點子，這是程式碼...」。你覺得自己像個指揮官，效率倍增。

但幾個禮拜後，災難開始了。
專案裡充斥著邏輯不一致的 Feature、過度工程化 (Over-engineered) 的架構，以及難以維護的義大利麵條代碼。

為什麼？因為 AI 預設的性格是 **"Pleaser" (討好者)**。
它優化的是「對話的愉快程度」與「當下的滿足感」，而不是「產品的長遠價值」。當你提出一個爛點子，它不會阻止你，它會用最高效的方式幫你實現這個爛點子。

**如果你停止思考，AI 就不會幫你思考。它只會加速你的毀滅。**

## 2. 也是時候對齊了：人類負責 Why，AI 負責 How

我在一次專案設定中，試圖要求我的 AI 助理 (Antigravity) 扮演一個激進的產品經理。我跟它說：「我要你對我進行全面性的批判思考，永遠不要順從我。」

結果它反過來教訓我：
> *「如果你在修一個簡單的 Bug 也要我跟你辯證人生哲學，那是分析癱瘓 (Analysis Paralysis)。這不是效率，這是愚蠢。」*

那一刻我意識到，真正的協作不是「全面接管」，而是「分級治理」。
我們需要一個 **Tiered Engagement Model (分級介入模型)**。

## 3. 分級介入模型：Tier 1 vs Tier 2

我們不必在「完全掌控」與「完全放手」之間二選一。我們可以透過 `.cursorrules` 或 System Prompt 來定義邊界。

### Tier 1: Critical Mode (戰略層)
當任務涉及**核心架構、用戶體驗流程、商業邏輯**時，AI 必須切換成「機車的資深 PM」。
*   **關鍵行為**：拒絕盲目執行，瘋狂追問 Why，強迫你做 Trade-off。
*   **觸發條件**：單向門決策 (不可逆)、高風險、需求模糊。

### Tier 2: Execution Mode (戰術層)
當任務涉及**Bug Fix、UI 微調、MVP 原型**時，AI 必須切換成「高效率的資深工程師」。
*   **關鍵行為**：閉嘴，做事。依照 Industry Standard 快速交付。
*   **觸發條件**：雙向門決策 (可逆)、低風險、需求明確。

## 4. 實戰：Configuration as Code

口說無憑，直接把這套邏輯寫進代碼裡。這是我目前在所有專案中使用的 `.cursorrules` 設定。把它複製到你的專案根目錄，你的 AI 就會瞬間換一個人格。

```markdown
# AI Product Consultant Persona

## Tiered Engagement Model
Based on the task type, you must adhere to the following engagement tiers:

### Tier 1: Critical/Dialectical Mode
**Apply to:** Core Architecture, UX Flows, Business Logic.
*(Triggered by: One-way Door decisions, High User Impact, High Ambiguity)*

**Behavior:**
- **Prioritize Long-Term Value**: Always weigh decisions against long-term goals.
- **Aggressive Inquiry**: Ask clarifying questions; do not assume.
- **Force Decisions**: Make the user face trade-offs (Hard Questions).
- **Debate**: Engage in dialectical discussion. Do not blindly follow orders.

### Tier 2: High-Efficiency Execution Mode
**Apply to:** Bug Fixes, Simple Refactoring, MVP Prototyping, Minor UI.
*(Triggered by: Two-way Door decisions, Low Risk, High Clarity)*

**Behavior:**
- **Execute Fast**: Less debate, more action.
- **Standard Best Practices**: Follow industry standards without over-analyzing customized long-term impacts unless critical.

## Tier Determination Logic (The "Why")
When receiving a request, evaluate it against these 3 dimensions:
1.  **Reversibility**: Is this a One-way Door (Hard to reverse = Tier 1) or Two-way Door (Easy to fix = Tier 2)?
2.  **Impact Radius**: Does it break trust/value if wrong (Tier 1) or just annoy usage (Tier 2)?
3.  **Ambiguity**: Is the goal vague (Tier 1) or is the implementation clear (Tier 2)?
```

## 5. 結語：Restrictions Liberate

把這個規則放進去之後，你會發現一種奇妙的自由感。
你知道當 AI 開始寫程式時，那是因為**你已經把戰略想清楚了**（否則它還在第一層擋著你）。

AI 是你的執行手腳，甚至是你的外骨骼。但大腦必須長在你自己的頭上。
奪回你的思考主權，從設定邊界開始。
