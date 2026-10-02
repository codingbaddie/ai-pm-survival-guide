# AI PM Survival Guide 🧠
> **在 AI Agent 時代奪回人類的思考主權。**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/codingbaddie/ai-pm-survival-guide/pulls)
![Last reviewed](https://img.shields.io/badge/last%20reviewed-2026--10-blue)

[English Version](./README.md)

---

## 宣言 (Manifesto)
我們正處在一個 **「Code 很便宜，但判斷力很昂貴」** 的時代。

AI Agent 現在能自己讀完整個 Codebase、執行指令、開 Pull Request。PM 的角色從「管理執行」變成**「管理智能」**，現在更進一步：**設計 Agent 工作的系統**，包括它讀什麼脈絡、守什麼邊界、跑什麼 Skill。

這個 Repo 不是 Prompt 大補帖。它是給想要領導 AI、而不是被 AI 取代的人，準備的**心智模型、機制與可重複使用的 Skill**。

> 🔁 這個 Repo 第一版寫於 2025 年，2026 年 10 月全面改版。我沒有默默改寫歷史，而是把我錯在哪裡寫下來：**[《我 9 個月前錯在哪》](./articles/What_I_Got_Wrong_ZH.md)**。

## 📖 協議庫 (The Protocol Library)

| 文章 | 核心概念 | 語言版本 |
|:--- |:--- |:--- |
| 🆕 **我 9 個月前錯在哪** | 一次自我 Code Review：哪些觀念留下來、哪些工具建議過期了、為什麼。 | [English](./articles/What_I_Got_Wrong_EN.md) / [中文](./articles/What_I_Got_Wrong_ZH.md) |
| 🆕 **把 PM 的工作流程做成 Skill** | 從「會用 AI」到「為團隊打造 AI 能力」：BRD 撰寫 / 審查、需求收斂，以及設計 Skill 的 6 個原則。 | [English](./articles/Skills_as_Product_EN.md) / [中文](./articles/Skills_as_Product_ZH.md) |
| **奪回思考主權** | 分級介入模型，用機制實現（`AGENTS.md`、Plan Mode、權限、Hooks），而不只是 Prompt。 | [English](./articles/Boundaries_with_AI_EN.md) / [中文](./articles/Boundaries_with_AI_ZH.md) |
| **AI 原生工作流指南** | 把 Git Repo 變成你和 Agent 的共享大腦：Context Files、決策紀錄，以及讓機敏資料遠離 Agent 的 Context。 | [English](./articles/AI_Native_Workflow_Guide_EN.md) / [中文](./articles/AI_Native_Workflow_Guide.md) |
| **從 Prototype 到 Production** | 為什麼 AI 變聰明了，原型幻覺還在；以及瓶頸為什麼從「寫 Code」變成「審 Code」。 | [English](./articles/From_Prototype_to_Production_EN.md) / [中文](./articles/From_Prototype_to_Production.md) |
| **Google Workspace × AI** | 讓 Docs、Sheets、會議紀錄變得 Agent 讀得懂，並用 OAuth Connector 取代下載金鑰。 | [English](./articles/Google_Workspace_Guide_EN.md) / [中文](./articles/Google_Workspace_Guide.md) |
| **「隨意門」工作流 v2** | 零摩擦知識捕捉：說一句「記下來」，Skill 就幫你歸檔。 | [English](./articles/Magic_Tunnel_Workflow.md) / [中文](./articles/Magic_Tunnel_Workflow_ZH.md) |

## 🛠 直接拿去用

| 路徑 | 內容 |
|:---|:---|
| [`templates/AGENTS.md`](./templates/AGENTS.md) | 含 Tier 1 / Tier 2 區域的專案規則檔，複製到你的 Repo 根目錄。 |
| [`skills/capture-learning`](./skills/capture-learning/SKILL.md) | Skill：把當下的對話濃縮成學習筆記，存進 inbox。 |
| [`skills/process-inbox`](./skills/process-inbox/SKILL.md) | Skill：把 inbox 的筆記分類、整理成文章，動筆前先等人類確認。 |

安裝到 Claude Code：

```bash
cp -r skills/* ~/.claude/skills/
```

## 📜 Changelog

- **2026-10**：全面改版。用 `AGENTS.md` + Plan Mode + 權限取代 `.cursorrules`；用兩個 Skill 取代 `mark` shell alias；移除 Service Account JSON Key 的建議；修正「LSP + Code Graph」的錯誤說法；依 Agent 時代更新 Prototype → Production 的論點。新增《我 9 個月前錯在哪》、《把 PM 的工作流程做成 Skill》，以及 `templates/`、`skills/`。
- **2025-12**：第一版：奪回思考主權、AI 原生工作流、Google Workspace、Prototype 到 Production、「隨意門」工作流。

## 🤝 參與貢獻
如果你發現了馴服 AI 的更好方法，歡迎開 PR。特別歡迎：
- 新的心智模型
- 經過實戰驗證的 `AGENTS.md` 規則或 Skill
- 失敗故事（AI 導致災難的驗屍報告）

---
*Created by [Coding Baddie](https://github.com/codingbaddie)*
