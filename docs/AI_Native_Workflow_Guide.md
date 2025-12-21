# 🚀 非工程師也能懂的 AI 協作指南：如何用 GitHub + IDE 管理你的「第二大腦」

*(這篇文章是寫給像我一樣，習慣用 Google Docs/Notion 管理文件，把不斷迭代的prototype 都放在雲上（claude artifact，但想開始使用 Cursor/Windsurf/Gemini Code Assist 等 AI IDE 進行產品開發的 PM 或領域專家)*

## 為什麼需要這篇指南？

在 AI 輔助寫 code 的時代，我遇到一個新的挑戰：**「記憶斷層」**。
以前我都把文件在雲端 (Google Drive)，隨便換台電腦登入就能繼續工作。
但現在，當我們把專案 `git clone` 下來時，AI 往往會問：「你是誰？我們上次做到哪？」

這是因為 Git 只存了「程式碼」，卻沒存我們的「大腦」(決策過程、待辦事項)。
這篇指南將分享一套 **AI Native 的專案管理心法**，並教你如何優雅地處理最頭痛的「機敏資料備份」問題。

---

## 🤔 為什麼要從 Claude Artifacts 轉戰 IDE？
你可能會覺得：「Claude Pro 也可以上傳 CSV 當 Knowledge Base，也可以一次改好幾個 Artifacts 啊！」
沒錯，現在的 AI 網頁版都很強。但當你從「做 Prototype」進階到「做 Product」時，IDE 真正的殺手級應用在於 **「架構力」** 與 **「協作性」**：

1.  **靜態知識庫 vs. 動態工程索引 (Static Knowledge vs. Live Code Graph)**
    *   **網頁版 (Claude Projects)**: 它的確很聰明，能讀取你上傳的 Knowledge。但本質上它是**「基於文字的檢索 (Vector Search)」**且讀取的是**「靜態檔案」**。當你改了 Code 但還沒重傳，或是需要跨越 20 層檔案追蹤一個函數的定義時，它容易產生幻覺。
    *   **IDE Agent**: 它是基於 **「即時的結構化理解 (Live Graph & LSP)」**。
        *   *技術差異*：IDE 不只看「文字」，還會呼叫底層 API (如 Language Server Protocol) 去分析程式碼的**結構**。它知道 `User.login()` 被哪些檔案引用、它的定義在哪裡。
        *   *實戰價值*：當你說「依照 PRD 修改登入邏輯」，IDE 能精準抓出「所有用到登入的頁面」並進行修改，而不是只改了你貼給它的那一段。這種**對「現狀 (Live State)」的精準掌控**，是網頁版難以取代的。

2.  **散落的零件 vs. 完整的引擎 (Snippets vs. Repository)**
    *   **網頁版**: Claude Artifacts 確實有 Code，也可以下載。但對工程師來說，那往往是**「孤島式」的程式碼**。拿到之後，工程師還得自己建立 `package.json`、搞定依賴版本、猜測這段 Code 該放在哪個資料夾，甚至要解決套件版本衝突。
    *   **IDE + GitHub**: 你交付的是一個**「能動的系統」**。
        *   **Standardization**: 你的 Repo 裡有完整的檔案結構 (`src/`, `components/`) 和環境設定 (`package.json`)。工程師只要 `git clone` 然後 `npm install`，專案就跑起來了。
        *   **Scalability**: 從單頁 Prototype 到百頁大專案，Repo 的結構能支撐擴充，而不會崩塌成一堆難以管理的 Artifacts 連結。

3.  **避開「原型完成度幻覺」 (The Prototype Illusion)**
    *   **網頁版**: 最大的陷阱就是「看起來做完了」。但 AI 在真空環境寫的 Prototype，完全不知道你公司既有的 DB Schema 長怎樣，也不知道改了這行 CSS 會不會讓舊功能的版面崩壞。
    *   **IDE**: 在這裡，你是基於**既有的 Codebase** 進行迭代。AI 會被迫面對真實世界的髒亂——「這段新 Code 要怎麼接舊的 API？」、「這個變數會不會跟舊的衝到？」。能在開發初期就發現這些**整合債 (Integration Debt)**，才是不搞死團隊的專業 PM。

---

---

## 💡 核心觀念：把 IDE 當成你的第二大腦

不要只把 IDE (與 AI 的對話視窗) 當成寫程式的地方，它也是你的專案管理中心。
為了讓 AI 隨時能進入狀況，我們需要在專案根目錄建立 **「Context Files (脈絡檔案)」**。

### 1. 必備的檔案結構
我都這樣整理我的專案，讓 AI 一秒讀懂：

```text
my-awesome-project/
├── 📂 docs/                # 💡 存放 PRD、訪談逐字稿、規格書 (AI 讀這裡才知道要做什麼)
├── 📂 data/                # 📊 存放數據資料 (下面會教你怎麼處理機敏資料)
├── 📂 scripts/             # 🛠️ 存放給 AI 用的小工具 (例如資料處理腳本)
├── 📝 task.md              # ✅ [重要] 專案進度表 (我們的共享大腦)
└── 📝 implementation_plan.md # 🏗️ [重要] 技術實作計畫 (AI 的施工藍圖)
```

*   **`task.md`**: 就像你的 Jira/Trello，但直接寫成 Markdown 放在這裡。每次叫 AI 工作前，先讓它讀這個檔，它就知道現在進度到哪。
*   **`docs/`**: 把 Google Docs 下載成 `.md` 或 `.txt` 放進來，AI 讀取本地檔案的速度比聯網讀 Google Docs 快且精準。

---

## 🔒 進階技巧：機敏資料的「隱身術」 (.gitignore)

這是新手最容易踩雷的地方！
有些資料（如客戶名單、API Key）**絕對不能**上傳到 GitHub 公開。

### 實戰案例
假設我的專案有一個 VIP 客戶名單 `data/VIP_Clients_Q1.csv` 和一個金鑰檔 `secrets.json`。

**步驟 1：告訴 Git「無視」它們**
在專案根目錄找到或建立 `.gitignore` 檔案，加入以下內容：

```gitignore
# 忽略機敏資料夾內的所有檔案
data/VIP_Clients_Q1.csv
secrets.json

# 也可以忽略整個環境設定檔
.env
```

**步驟 2：手動備份**
既然這些檔案不上傳 GitHub，那換電腦怎麼辦？
👉 **回到最原始的方法：雲端硬碟**。
1. 把 `VIP_Clients_Q1.csv` 上傳到你的 Google Drive 私人資料夾。
2. 在新電腦 `git clone` 專案後。
3. 從 Google Drive 下載該檔案，並**手動放回** `data/` 資料夾中。

這樣既保證了資安，又能在不同電腦間順利切換工作！

---

## 🔄 完整工作流：從 A 電腦切換到 B 電腦

假設你今天在公司 (電腦 A) 做了一半，回家想用筆電 (電腦 B) 繼續：

### 在電腦 A (下班前)
1. 呼叫 AI：「更新 `task.md`，把我們做完的打勾。」
2. 執行 Git 指令 (或請 AI 幫你)：
   ```bash
   git add .
   git commit -m "update: 完成首頁設計與 task 更新"
   git push
   ```
3. 確認機敏資料 (如 CSV) 已經備份在 Google Drive。

### 在電腦 B (回家後)
1. 打開 Terminal:
   ```bash
   git clone https://github.com/your-name/project.git
   ```
2. **[關鍵動作]** 從 Google Drive 下載機敏檔案 (`VIP_Clients_Q1.csv`)，放回 `data/` 資料夾。
3. 打開 IDE，跟 AI 說：「請讀取 `task.md`，告訴我接下來該做什麼？」
4. 🚀 無縫接軌，繼續開發！

---

## 結語

身為 PM 或與 AI 協作的開發者，**學會管理 Context 比學會寫扣更重要**。
當你建立了這套結構，你就不再只是在「問 AI 問題」，而是在「與 AI 共同經營一個產品」。

*如果你覺得這篇指南有幫助，歡迎 Fork 或 Star 我的 Repository！*
*(在此附上你的 Repo 連結)*
