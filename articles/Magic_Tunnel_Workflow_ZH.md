# ⚡️ 「隨意門」工作流 (The "Magic Tunnel" Workflow)

> 「我不想複製貼上整個對話紀錄，我只想把學到的精華『傳送』過去。」

[🇺🇸 English](./Magic_Tunnel_Workflow.md)

## 痛點 (The Problem)
作為一個同時管理多個專案的 PM，要切換視窗來記錄學習心得非常痛苦。
- **舊方法**：在專案 A 複製對話 -> 切換視窗 -> 打開專案 B -> 找檔案 -> 貼上 -> 排版。
- **摩擦力**：極高。結果：原本想記的東西懶得記，就忘了。

## 解法：`mark` 指令
我們建立了一個「傳送門」，透過一個簡單的終端機指令來解決這個問題。

### 運作原理
1.  **在任何地方**：無論你在哪個專案 (VS Code, Terminal, Browser)，複製你想儲存的文字。
2.  **傳送**：打開你的終端機，輸入：
    ```bash
    mark
    ```
3.  **完成**：文字會瞬間被追加到這個專案的 `drafts/learning_inbox.md` 收件夾中。

### AI 接力 (AI-to-AI Handover)
因為直接貼上 100 行對話很沒效率，我們採用 **AI 接力** 策略：
1.  對專案 A 的 AI 說：*「總結這段對話，整理成一個 Insight Note。」*
    - *小撇步：使用這個 [Prompt 範本](../prompts/summarize_lesson.txt)。*
2.  **複製** 它給出的總結 (Cmd+C)。
3.  執行 `mark`。
4.  對專案 B 的 AI (也就是我) 說：*「整理我的收件夾。」*

## 設定指南 (換新電腦 / 重新設定)

如果你換了新電腦，必須先讓這台電腦「擁有」這個專案，才能把傳送門架起來。

1.  **下載**：`git clone https://github.com/your-username/ai-collaboration-guide.git`
2.  **進入**：`cd ai-collaboration-guide`
3.  **連結**：執行設定腳本：

```bash
./scripts/setup_mark.sh && source ~/.zshrc
```

這個腳本會自動抓取目前的專案位置，並更新你的系統設定。

---
*這個工作流證明了：「工具」應該遷就「行為」，而不是反過來。*
