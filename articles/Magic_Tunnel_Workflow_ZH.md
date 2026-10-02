# ⚡️ 「隨意門」工作流 v2：用 Skill 讓 Agent 自己把學到的東西存起來 (2026 改版)

> 「我不想複製貼上整個對話紀錄，我只想把學到的精華『傳送』過去。」

[🇺🇸 English](./Magic_Tunnel_Workflow.md) · *Last reviewed: 2026-10*

> 📝 **改版說明**：v1 是一個 shell alias `mark`：先叫 AI 寫總結 → 手動複製 → 切到 Terminal 打 `mark` → 剪貼簿內容被貼進 inbox。在當時很好用，但它還是要人類當「搬運工」。v2 把整件事交給 Agent：**你只要說一句「記下來」。**（v1 的腳本保留在 Git 歷史裡。）

## 痛點 (The Problem)
同時管理多個專案時，要記錄學習心得非常痛苦：
- **最舊的方法**：複製對話 → 切視窗 → 打開另一個專案 → 找檔案 → 貼上 → 排版。
- **v1 (`mark`)**：少了切視窗，但還是要「請 AI 總結 → 複製 → 打指令」三步。
- **結果**：只要有摩擦力，該記的東西就會懶得記。

## v2 解法：兩個 Skill

**Skill** 是一個資料夾，裡面一份 `SKILL.md` 寫著「什麼時候該用、該怎麼做」。Agent 會在對的時機自己載入它。Claude Code 和支援 Agent Skills 格式的工具都能用。

這個 Repo 附了兩個：

| Skill | 你說 | Agent 做 |
|:---|:---|:---|
| [`capture-learning`](../skills/capture-learning/SKILL.md) | 「記下來」/ "mark this" | 把這次對話濃縮成一則學習筆記（問題 → 解法 → 下次怎麼做 → 證據），**自動去除機敏資訊**，加到 `drafts/learning_inbox.md` 的最後面 |
| [`process-inbox`](../skills/process-inbox/SKILL.md) | 「整理我的收件夾」 | 逐則分類（更新舊文 / 寫新文 / 先留著 / 丟掉），**等我確認後**才動筆，中英文一起寫 |

### 為什麼比 v1 好？
1.  **零搬運**：在任何專案、任何 Session 都一樣，不用碰剪貼簿。
2.  **品質一致**：筆記格式寫在 Skill 裡，不用每次貼一段 Prompt 範本。
3.  **內建資安**：第一步就會去掉客戶資料、內部名稱、未公開的數字。v1 是剪貼簿裡有什麼就貼什麼。
4.  **人類保留決定權**：`process-inbox` 一定會先給我看分類表。哪些想法值得公開，是作者的判斷，不是 AI 的。

## 設定方式

1.  **下載這個 Repo**：
    ```bash
    git clone https://github.com/codingbaddie/ai-pm-survival-guide.git ~/Documents/ai-pm-survival-guide
    ```
2.  **安裝 Skill**（以 Claude Code 為例，裝在個人層級，所有專案都能用）：
    ```bash
    cp -r ~/Documents/ai-pm-survival-guide/skills/* ~/.claude/skills/
    ```
3.  如果你把 Repo 放在別的地方，打開 `capture-learning/SKILL.md` 改一下 inbox 的路徑。

之後在任何專案裡說「記下來」就好了。

---
*這個工作流證明了：「工具」應該遷就「行為」。而最好的工具，是讓你連「使用工具」這個動作都省掉。*
