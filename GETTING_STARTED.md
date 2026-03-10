# PM Agent Skills - 新手上路指南

> 讓 Claude Code 成為你的 PM 工作夥伴,從 Idea 到 RD Handoff 的標準化流程

---

## 📚 目錄

- [這是什麼?](#這是什麼)
- [Claude.ai vs Claude Code - 該用哪個?](#claudeai-vs-claude-code---該用哪個)
- [安裝前準備](#安裝前準備)
- [安裝步驟](#安裝步驟)
- [第一次使用](#第一次使用)
- [日常使用](#日常使用)
- [所有 Skills 介紹](#所有-skills-介紹)
- [疑難排解](#疑難排解)
- [更新與維護](#更新與維護)
- [常見問題](#常見問題)

---

## 這是什麼?

**PM Agent Skills** 是一套 7 個專業 Skills,幫助 PM 完成從產品發想到 RD 交接的完整流程。

### 🎯 能幫你做什麼?

| 你想做的事 | 對應的 Skill | 產出 |
|-----------|-------------|------|
| 把模糊的想法變清楚 | idea-interviewer | Idea Brief + Persona |
| 寫完整的 PRD | prd-builder | User Stories + PRD 文件 |
| 檢查文件品質 | challenger | 批判性審查報告 |
| 設計產品流程 | flow-mapper | Sitemap + User Flow |
| 做 Wireframe | prototyper | 可互動的原型 |
| 給 RD 技術建議 | architect | Tech Specs 文件 |
| 命名 UI 元件 | component-naming-skill | 符合規範的命名 |

### 💡 使用情境範例

**情境:** 週一早上,你有一個新產品想法

```
你: 我想做一個幫助 PM 管理需求的工具

[idea-interviewer 自動啟動]
Claude: 太好了!讓我透過幾個問題幫你釐清這個想法。
       首先,你觀察到 PM 在管理需求時遇到什麼具體的痛點?

... (經過 15 分鐘的對話)

Claude: [產出 Idea Brief.md 和 Persona.md]

---

你: 幫我展開 PRD

[prd-builder 自動啟動]
Claude: 我會根據你的 Idea Brief 展開完整的 User Stories...

... (20 分鐘後)

Claude: [產出 PRD.md 和 User Stories 清單]
```

---

## Claude.ai vs Claude Code - 該用哪個?

### 🤔 兩者有什麼不同?

在開始安裝前,先了解 **Claude.ai (網頁版/App)** 和 **Claude Code (CLI 工具)** 的差異,這會影響你的使用體驗。

---

### 📊 核心差異對照表

| 面向 | Claude.ai (網頁版/App) | Claude Code (CLI) |
|------|----------------------|------------------|
| **Skills 安裝** | 手動上傳 ZIP 檔 | `/plugin add` 一行指令 |
| **更新方式** | 重新上傳 ZIP | `/plugin update` 自動更新 |
| **檔案存取** | 只能上傳單個檔案 | 可直接讀寫整個專案目錄 |
| **團隊協作** | 每人各自上傳 | 共用 GitHub,一次設定 |
| **版本控制** | 手動管理 | Git 自動追蹤 |
| **使用場景** | 通用對話、快速查詢 | 專案開發、團隊協作 |
| **跨裝置** | ✅ 自動同步 | ❌ 每台電腦要安裝 |
| **產出儲存** | 手動複製/下載 | 自動寫入專案目錄 |

---

### 🎯 實際使用體驗差異

#### **情境:完整的 PM 流程 (Idea → RD Handoff)**

**使用 Claude.ai 網頁版:**

```
Day 1: Ideation
你: 我有一個想法:做英文學習 App
[idea-interviewer 啟動]
產出: Idea Brief (顯示在對話中)

你需要做:
1. ❌ 手動複製內容
2. ❌ 貼到 Notion/Google Docs
3. ❌ 或下載對話記錄

Day 2: PRD
你: 幫我展開 PRD
問題: 
- ❌ 需要重新貼上 Idea Brief
- ❌ 或在同一個對話繼續 (但對話很長)
產出: PRD (顯示在對話中)

你需要做:
1. ❌ 手動複製 PRD
2. ❌ 整理格式
3. ❌ 貼到專案文檔

結果: 每個階段都要手動複製/貼上/整理
```

---

**使用 Claude Code:**

```
Day 1: Ideation
$ cd ~/projects/english-learning-app
$ claude

你: 我有一個想法:做英文學習 App
[idea-interviewer 啟動]

產出: ✅ 自動寫入專案
├── 01-brief/
│   ├── idea-brief.md
│   └── persona.md

你需要做: 無!檔案已經在專案裡

Day 2: PRD
你: 幫我展開 PRD
[prd-builder 自動讀取 idea-brief.md]

產出: ✅ 自動寫入專案
├── 02-prd/
│   ├── prd.md
│   └── user-stories.md

你需要做:
$ git add .
$ git commit -m "feat: complete PRD"
$ git push

RD 團隊: 
$ git pull ← 直接拿到所有文件!

結果: 所有產出自動整理,版本控制,團隊協作零摩擦
```

---

### 💡 該選哪個?

#### **選 Claude.ai 的情況:**

✅ **快速探索/個人發想**
```
- 通勤時在手機上快速釐清想法
- 不需要正式產出,只是整理思路
- 跨裝置使用 (公司 → 家裡)
```

✅ **獨立分析/研究**
```
- 競品分析討論
- UX Review
- 純討論,不需要產出檔案
```

✅ **無法/不想安裝 Claude Code**
```
- 公司電腦無管理員權限
- 只是偶爾用
- 出差用別人電腦
```

---

#### **選 Claude Code 的情況 (強烈推薦!):**

✅ **正式專案開發**
```
從 Idea 到 RD Handoff 的完整流程
→ PM Agent Skills 就是為此設計的!

為什麼 Claude Code 更好:
- ✅ 檔案自動寫入專案目錄
- ✅ Skills 自動讀取之前的產出 (串接流程)
- ✅ Git 追蹤每次迭代
- ✅ 團隊 git pull 就能拿到所有文件
```

✅ **團隊協作**
```
PM 團隊統一工作流程

Claude Code 優勢:
- ✅ 一個指令安裝
- ✅ 更新同步
- ✅ 版本統一

Claude.ai 問題:
- ❌ 每人各自上傳
- ❌ 更新要通知所有人
- ❌ 版本可能不一致
```

✅ **需要讀寫專案檔案**
```
Claude Code:
- 直接讀取專案檔案
- 修改後直接寫回
- Skills 可以串接檔案流程

Claude.ai:
- 需要手動上傳每個檔案
- 產出要手動複製回去
```

---

### 🔄 混合使用策略 (最佳實踐)

**不是二選一,而是各取所長!**

```
個人快速發想 → Claude.ai (手機/平板)
    ↓
    確認要做成正式專案
    ↓
正式專案開發 → Claude Code (用 PM Agent Skills)
    ↓
    產出完整文檔
    ↓
臨時討論/Review → Claude.ai 或 Claude Code 都可
```

**實際工作流程:**

```
週一早上 (通勤,用手機)
用 Claude.ai:
"我有個想法..." 快速釐清思路

回到辦公室 (用電腦)
用 Claude Code:
$ claude
> 正式開發這個產品
[完整的 PM Agent Pipeline]
產出所有文件 → Git

下午開會討論 (手機/平板)
用 Claude.ai:
"幫我分析這個設計" 臨時討論

會後整理 (電腦)
用 Claude Code:
根據討論更新專案文件 → Git
```

---

### ✅ 給團隊的建議

#### **主要使用 Claude Code**
- 所有正式專案開發
- 使用 PM Agent Skills 的完整流程
- 文件產出與協作

#### **輔助使用 Claude.ai**
- 個人快速發想
- 跨裝置討論
- 臨時分析

#### **團隊標準**
- ✅ 所有正式產出必須在 Claude Code 中完成
- ✅ 確保文件進版控
- ✅ Claude.ai 只用於探索/討論

---

### 📌 簡單記住

**Claude.ai = 個人筆記本** (快速、隨時隨地)  
**Claude Code = 專業工作站** (完整、協作、版控)

**PM Agent Skills 應該主要在 Claude Code 使用,才能發揮最大價值!**

---

**接下來的安裝步驟,都是針對 Claude Code。**

---

## 安裝前準備

### 1️⃣ 確認你有 Claude Code

**檢查方式:**

打開終端機 (PowerShell 或 Terminal),輸入:

```bash
claude --version
```

**如果看到:**
- ✅ `2.1.72 (Claude Code)` 或更高版本 → 已安裝,可以繼續
- ❌ `找不到 'claude' 命令` → 需要先安裝

**安裝 Claude Code:**

前往官網下載: https://claude.ai/download

或使用 npm:
```bash
npm install -g @anthropic-ai/claude-code
```

安裝完成後,再次執行 `claude --version` 確認。

---

### 2️⃣ 確認版本 >= 2.0

PM Agent Skills 需要 Claude Code 2.0 以上才支援 Plugin 功能。

```bash
claude --version
# 需要看到 2.x.x
```

---

## 安裝步驟

### 步驟 1: 啟動 Claude Code

```bash
# 在任何目錄都可以
claude
```

**應該會看到 Claude Code 的介面,下方有輸入框。**

---

### 步驟 2: 安裝 PM Agent Skills

**在 Claude Code 的輸入框中,輸入以下指令並按 Enter:**

```bash
/plugin add https://github.com/Bryan47nice/pm-agent-skills
```

**等待約 10-30 秒,應該會看到:**

```
✅ Successfully added plugin: pm-agent-skills
   Loaded 7 skills:
   - idea-interviewer
   - prd-builder
   - challenger
   - flow-mapper
   - prototyper
   - architect
   - component-naming-skill
```

**如果看到這個訊息,表示安裝成功!**

---

### 步驟 3: 停用可能衝突的官方 Skills (重要!)

某些官方 Skills 可能會與 PM Agent Skills 的觸發條件衝突。

**執行以下指令:**

```bash
/plugin disable superpowers
```

```bash
/plugin disable feature-dev
```

**這兩個指令分開執行,每次按 Enter。**

---

### 步驟 4: 驗證安裝

**執行:**

```bash
/plugin list
```

**應該會看到:**

```
User
  pm-agent-skills Plugin · 7 skills · ✓ enabled
    - idea-interviewer
    - prd-builder
    - challenger
    - flow-mapper
    - prototyper
    - architect
    - component-naming-skill
```

**如果看到這個列表,表示一切正常!**

---

## 第一次使用

### 🧪 測試 1: idea-interviewer

**在 Claude Code 的輸入框輸入:**

```
我有一個想法:做一個幫助團隊協作的工具
```

**預期結果:**

Claude 應該會:
1. 自動識別這是一個「新想法」
2. 觸發 `idea-interviewer` Skill
3. 開始用蘇格拉底式提問來釐清你的想法

**如果看到類似這樣的回應,就成功了:**

```
好,讓我們來把你的想法具體化。

我會用幾個階段的提問來幫你釐清這個 idea,最後會產出一份 
Idea Brief 和 Persona 文件。

先從最基本的開始——你想解決什麼問題?或者你觀察到了什麼
讓你覺得「應該有人做一個東西來解決」的痛點?
```

---

### 🧪 測試 2: 手動觸發 Skill

有時候 Claude 可能沒有自動觸發正確的 Skill。你可以用 `@` 符號手動指定:

```
@idea-interviewer 我想做一個任務管理 App
```

**這會強制使用 idea-interviewer Skill。**

---

### 🧪 測試 3: 完整流程測試

試著走一次完整的 PM 流程:

```
階段 1: Idea
> 我想做一個英文單字學習 App
(idea-interviewer 啟動,完成訪談)

階段 2: PRD
> 幫我展開 PRD
(prd-builder 啟動,產出 PRD)

階段 3: Review
> 幫我 review 這份 PRD
(challenger 啟動,批判性審查)

階段 4: Flow
> 開始設計流程
(flow-mapper 啟動,產出 Sitemap)

階段 5: Wireframe
> 做 wireframe
(prototyper 啟動,產出原型)

階段 6: Tech Specs
> 給 RD 技術建議
(architect 啟動,產出技術方向)
```

---

## 日常使用

### 🚀 啟動 Claude Code

每次要用,只需要:

```bash
# 在終端機執行
claude
```

**就這麼簡單!Skills 已經安裝好,隨時可用。**

---

### 💬 自然對話即可

**你不需要記指令!** 只要用自然語言描述你要做的事:

| 你的輸入 | 會觸發的 Skill |
|---------|---------------|
| 「我有一個想法...」 | idea-interviewer |
| 「我想做一個...」 | idea-interviewer |
| 「幫我展開 PRD」 | prd-builder |
| 「寫 PRD」 | prd-builder |
| 「幫我 review...」 | challenger |
| 「競品分析」 | challenger |
| 「設計流程」 | flow-mapper |
| 「畫流程圖」 | flow-mapper |
| 「做 wireframe」 | prototyper |
| 「做原型」 | prototyper |
| 「技術建議」 | architect |
| 「給 RD 的建議」 | architect |
| 「幫我命名這個元件」 | component-naming-skill |

---

### 🎯 手動指定 Skill (進階)

如果自動觸發不正確,用 `@` 強制指定:

```
@prd-builder 幫我寫一個登入功能的 PRD
```

---

## 所有 Skills 介紹

### 1️⃣ idea-interviewer - 產品發想訪談工具

**用途:** 把模糊的想法變成清楚的 Idea Brief

**觸發詞:**
- 「我有一個想法...」
- 「我想做一個...」
- 「幫我釐清這個 idea」

**工作方式:**
- 蘇格拉底式提問 (一次問 1-2 個問題)
- 分 4 個階段:問題空間 → 解法空間 → 差異化 → 範圍收斂
- 完成後產出 Idea Brief + Persona

**產出範例:**
```markdown
# Idea Brief: 英文單字學習 App

## 問題陳述
上班族想利用零碎時間背單字,但現有 App 太複雜,
需要完整時段才能使用。

## 目標用戶
25-35 歲上班族,通勤時間 30-60 分鐘,
想提升英文但沒有完整學習時段。

## MVP 功能範圍
1. 單字卡片快速瀏覽
2. 例句記憶
3. 每日複習提醒

## 成功指標
- 日活躍用戶留存率 > 40%
- 平均每日使用時長 > 10 分鐘
```

---

### 2️⃣ prd-builder - PRD 文件生成器

**用途:** 從 Idea Brief 展開完整的 PRD

**觸發詞:**
- 「幫我展開 PRD」
- 「寫 PRD」
- 「需求文件」

**工作方式:**
- 讀取 Idea Brief
- 展開 User Stories 清單
- 產出結構化的 PRD 文件

**產出範例:**
- User Stories 清單 (含優先級)
- 完整的 PRD 文件 (含功能規格、驗收標準)

---

### 3️⃣ challenger - 批判性審查工具

**用途:** 多視角審查你的文件品質

**觸發詞:**
- 「幫我 review...」
- 「檢查一下」
- 「競品分析」

**工作方式:**
- 可以從競品、技術、設計、架構等不同視角審查
- 挑戰假設,找出盲點
- 產出結構化的審查報告

**適用階段:**
- PRD Review
- 設計稿 Review
- 技術架構 Review
- 產品覆盤

---

### 4️⃣ flow-mapper - 資訊架構設計工具

**用途:** 從 PRD 產生 Sitemap、User Flow、Page Inventory

**觸發詞:**
- 「設計流程」
- 「畫流程圖」
- 「資訊架構」

**工作方式:**
- 讀取 PRD
- 產生 Sitemap (頁面結構)
- 產生 User Flow (使用者流程)
- 產生 Page Inventory (頁面清單)

**產出格式:**
- Markdown
- Mermaid 流程圖

---

### 5️⃣ prototyper - 原型生成器

**用途:** 從資訊架構生成可互動的 Wireframe

**觸發詞:**
- 「做 wireframe」
- 「做原型」
- 「UI 設計」

**工作方式:**
- 讀取 Sitemap/User Flow
- 漸進式生成每個頁面的 wireframe
- 產出可互動的 HTML 原型

---

### 6️⃣ architect - 技術方向建議工具

**用途:** 從 PM 視角提出技術方向建議給 RD

**觸發詞:**
- 「技術建議」
- 「給 RD 的建議」
- 「要用什麼技術」

**工作方式:**
- 讀取設計稿和需求
- 提出產品技術約束
- 建議技術方向偏好
- 提供概念資料模型
- 列出第三方服務需求

**注意:** 這是建議性質,最終技術決策權在 RD。

---

### 7️⃣ component-naming-skill - 元件命名助手

**用途:** 根據字根字首規範命名 UI 元件

**觸發詞:**
- 「幫我命名這個元件」
- 「這個元件該叫什麼」

**工作方式:**
- 載入團隊的字根字首表
- 根據元件功能建議符合規範的命名
- 如果字根不足,提供新字根建議

---

## 疑難排解

### ❌ 問題 1: Skills 沒有自動觸發

**症狀:** 你說「我有一個想法」,但 Claude 沒有啟動 idea-interviewer

**原因:** 可能是官方 Skills 的觸發條件衝突了

**解決方式:**

```bash
# 停用可能衝突的官方 Skills
/plugin disable superpowers
/plugin disable feature-dev

# 或手動指定
@idea-interviewer 我有一個想法...
```

---

### ❌ 問題 2: 找不到 /plugin 指令

**症狀:** 輸入 `/plugin` 沒有反應

**原因:** 
1. Claude Code 版本太舊 (< 2.0)
2. 不是在 Claude Code 中執行 (可能在 VS Code 擴充套件)

**解決方式:**

```bash
# 1. 確認版本
claude --version
# 需要 >= 2.0

# 2. 確認是在獨立的 Claude Code 中
# 不是在 VS Code 的 Claude 擴充套件
```

---

### ❌ 問題 3: 安裝時顯示 "Failed to load plugin"

**可能原因:**
- 網路問題
- GitHub 存取權限問題

**解決方式:**

```bash
# 方式 1: 重試
/plugin remove pm-agent-skills
/plugin add https://github.com/Bryan47nice/pm-agent-skills

# 方式 2: 檢查網路
ping github.com

# 方式 3: 聯繫維護者
Slack: #pm-tools
```

---

### ❌ 問題 4: 觸發了錯誤的 Skill

**症狀:** 你想用 idea-interviewer,但觸發了 superpowers

**解決方式:**

```bash
# 停用那個 Skill
/plugin disable superpowers

# 或手動指定正確的
@idea-interviewer 我的想法是...
```

---

## 更新與維護

### 🔄 如何更新到最新版

當維護者更新了 Skills (例如改進 idea-interviewer 的提問邏輯),你可以這樣更新:

```bash
# 在 Claude Code 中執行
/plugin update pm-agent-skills
```

**就這麼簡單!**

---

### 📢 如何知道有新版本?

維護者會在 Slack #pm-tools 頻道公告:

```
🎉 PM Agent Skills v1.1 更新!

更新內容:
- idea-interviewer: 改進問題邏輯,更快收斂
- prd-builder: 新增 GWT 格式的 acceptance criteria

更新方式:
/plugin update pm-agent-skills
```

---

### 🗑️ 如何移除

如果不想用了:

```bash
/plugin remove pm-agent-skills
```

---

## 常見問題

### Q1: 我可以只安裝部分 Skills 嗎?

**A:** 目前的設計是安裝整個 Plugin (包含所有 7 個 Skills)。

如果你只想用其中幾個,可以:
```bash
# 安裝全部
/plugin add https://github.com/Bryan47nice/pm-agent-skills

# 停用不要的
/plugin disable prd-builder
/plugin disable prototyper
```

但建議全部保留,因為它們是一套完整的流程。

---

### Q2: Skills 會記住之前的對話嗎?

**A:** 
- 在同一個 Claude Code session 內:✅ 會記住
- 重新啟動 Claude Code:❌ 不會記住

**建議:** 把重要的產出 (Idea Brief, PRD) 存成檔案。

---

### Q3: 可以客製化 Skills 嗎?

**A:** 可以!

**方式 1: 提需求給維護者**
- 在 Slack #pm-tools 提出建議
- 維護者評估後更新

**方式 2: Fork 自己改**
```bash
# Clone 到本地
git clone https://github.com/Bryan47nice/pm-agent-skills.git ~/my-skills

# 修改你想改的 Skill
code ~/my-skills/skills/idea-interviewer/SKILL.md

# 用你的版本
/plugin add ~/my-skills
```

---

### Q4: 這些 Skills 會消耗很多 token 嗎?

**A:** 
- idea-interviewer: 中等 (互動式對話)
- prd-builder: 較高 (生成長文件)
- challenger: 中等
- flow-mapper: 中等
- prototyper: 較高 (生成 HTML)
- architect: 中等
- component-naming-skill: 低

**總體來說:** 比手動寫 prompt 更高效,因為 Skills 已經優化過提示詞。

---

### Q5: 團隊有新人加入,怎麼快速 onboard?

**A:** 把這份文件傳給他,照著做就好!

完整流程:
1. 確認有 Claude Code
2. 執行 `/plugin add https://github.com/Bryan47nice/pm-agent-skills`
3. 停用衝突的官方 Skills
4. 測試:「我有一個想法...」
5. 完成!

**預計時間: 5-10 分鐘**

---

## 🎓 進階使用

### 組合使用多個 Skills

```bash
# Day 1: Ideation
我想做一個...
(idea-interviewer 完成)

# Day 2: PRD
幫我展開 PRD
(prd-builder 完成)

競品怎麼做?
(challenger 執行競品分析)

幫我 review 這份 PRD
(challenger 執行 PRD review)

# Day 3: Design
設計流程
(flow-mapper 完成)

做 wireframe
(prototyper 完成)

# Day 4: Handoff
給 RD 技術建議
(architect 完成)

# 完整的產出:
- Idea Brief
- Persona
- User Stories
- PRD
- 競品分析
- PRD Review
- Sitemap
- User Flow
- Wireframes
- Tech Specs

準備交給 RD 了!
```

---

## 📞 需要協助?

### Slack
- 頻道: `#pm-tools`
- 直接 @ 維護者: `@Bryan`

### GitHub
- Issues: https://github.com/Bryan47nice/pm-agent-skills/issues
- 回報 bug、功能建議都歡迎

### Email
- bryan472017@gmail.com

---

## 🎉 開始使用吧!

現在你已經了解所有需要知道的了。

**開始你的第一個 PM 專案:**

```bash
claude
> 我有一個想法...
```

**祝你順利! 🚀**

---

*最後更新: 2025-03-10*  
*維護者: Bryan*  
*版本: v1.0*
