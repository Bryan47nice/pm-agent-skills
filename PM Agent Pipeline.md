# PM Agent Pipeline

> 一套以 AI 為核心協作者的產品經理工作流程，從 Idea 到交付給 RD 全程標準化。
> PM Agent 的產出邊界是：PRD（含 GWT 驗收條件）+ 設計稿 + 技術建議。
> 開發、測試、部署由 RD Agent 接手。

---

## Pipeline 總覽

```
PM Agent 職責範圍
═══════════════════════════════════════════════════════════════
Idea → PRD（含 GWT）→ [PAGEs Check] → Design → 技術建議 → 交付給 RD
 P1        P1           P1-6(條件)      P2        P3
═══════════════════════════════════════════════════════════════
                                                    ↓ 交接點
                                               RD Agent 職責範圍
                                           ═══════════════════════
                                            Development → QA → Deploy
                                                P4        P5    P6
                                           ═══════════════════════
```

---

## Skill 總覽

| # | Skill 名稱 | 互動模式 | 覆蓋階段 | 複用次數 | 狀態 |
|---|-----------|---------|---------|---------|------|
| 1 | Idea Interviewer | 蘇格拉底式提問 | P1-1 | 1 | ✅ 已完成 |
| 2 | PRD Builder | 結構化填表 + GWT 驗收條件 | P1-2, P1-3 | 1 | ✅ 已更新（v1.1 GWT） |
| 3 | Challenger | 批判性審查（多視角） | P1-4, P1-5, P2-4, P3-5*, P6-4* | 5 | ✅ 已更新（v1.1 跨團隊） |
| 4 | Flow Mapper | 結構化拆解 | P2-1 | 1 | ✅ 已完成 |
| 5 | Prototyper | 漸進式生成 | P2-2, P2-3 | 1 | ✅ 已完成 |
| 6 | Architect | 技術建議（非決策） | P3-1 ~ P3-4 | 1 | ✅ 已更新（v2.0 PM 版） |
| 7 | PAGEs Checker | 系統比對 | P1-6（條件性） | 1 | ✅ 已完成 |
| 8 | Component Naming | 字根字首命名 | P2-2 之前（條件性） | 1 | ✅ 既有 Skill |

> \* P3-5（架構審查）和 P6-4（覆盤）標註為**跨團隊協作**視角，PM 與 RD 共同使用。

### 已移除的 Skill（交由 RD Agent 負責）

| 原 Skill | 原覆蓋階段 | 移除理由 |
|---------|-----------|---------|
| ~~Builder~~ | P4-1 ~ P4-4, P5-4 | 開發由 RD Agent 負責 |
| ~~QA Engineer~~ | P5-1 ~ P5-3 | 驗收條件（GWT）整合進 PRD Builder；測試程式碼由 RD Agent 負責 |
| ~~Release Manager~~ | P6-1 ~ P6-3 | 部署由 RD Agent 負責 |

```
/skills
  /idea-interviewer       → P1-1
  /prd-builder            → P1-2 + P1-3（含 GWT 驗收條件 + 匯出驗收文件）
  /challenger             → P1-4, P1-5, P2-4, P3-5*, P6-4*
  /pages-checker          → P1-6（條件性：功能建構在 PAGEs 上時）
  /component-naming-skill → P2-2 之前（條件性：PAGEs Checker 判定有新元件時）
  /flow-mapper            → P2-1
  /prototyper             → P2-2 + P2-3
  /architect              → P3-1 ~ P3-4（建議性質，供 RD 參考）
```

---

## Phase 1：Idea → PRD

> 目標：把腦中模糊的想法變成一份 RD 團隊能直接開工的需求文件，含可驗收的 GWT 條件。

### P1-1 Idea Clarification（釐清想法）

- **Skill**：`idea-interviewer`
- **互動模式**：蘇格拉底式提問 — AI 扮演訪談者，持續追問把模糊想法逼出具體答案
- **輸入**：使用者的口頭描述 / 模糊想法
- **產出**：Idea Brief + Persona 模板
- **核心問題**：
  - 這個產品解決「誰」的「什麼問題」？
  - 為什麼現有方案不夠好？
  - 你的 unfair advantage 是什麼？
  - 最小可行版本（MVP）長什麼樣？

### P1-2 User Story Mapping（用戶故事地圖）

- **Skill**：`prd-builder`（Section A）
- **互動模式**：結構化填表 — 給定 Idea Brief + Persona，產出固定格式文件
- **輸入**：Idea Brief、Persona
- **產出**：User Stories 清單（含 GWT 驗收條件，按優先級排序）
- **包含內容**：
  - 目標用戶的使用場景
  - 功能需求與非功能需求
  - 需求優先級（Must / Should / Could / Won't）
  - **每條 Story 的 GWT 驗收條件**

### P1-3 PRD Drafting（需求文件撰寫）

- **Skill**：`prd-builder`（Section B + Section C）
- **互動模式**：結構化填表 — 整合前步產出，生成正式 PRD + 獨立驗收文件
- **輸入**：Idea Brief、Persona、User Stories
- **產出**：
  - 完整 PRD 文件（每條 US 內含 GWT）
  - **獨立驗收案例文件**（彙整所有 GWT，交給 RD 作為開發和測試的依據）
- **PRD 標準結構**：
  - 產品目標與背景
  - 目標用戶與 Persona
  - 功能範圍（MVP Scope）
  - User Stories 明細（含 GWT 驗收條件）
  - 成功指標（KPI）
  - 限制條件與假設
  - 時程估算

### P1-4 Competitive Analysis（競品分析）

- **Skill**：`challenger`（視角：市場定位）
- **互動模式**：批判性審查 — 從市場角度挑戰產品定位
- **輸入**：PRD
- **產出**：競品比較表 + 差異化定位分析
- **審查維度**：
  - 市場上有哪些類似產品？
  - 它們的功能、定價、優缺點？
  - 你的差異化在哪裡？是否站得住腳？

### P1-5 PRD Review（需求審查）

- **Skill**：`challenger`（視角：多角色挑戰）
- **互動模式**：批判性審查 — AI 分別站在工程師、設計師、商業的角度挑戰 PRD
- **輸入**：PRD + 競品分析結果
- **產出**：Review Report（問題清單 + 修改建議）
- **審查維度**：
  - 工程師視角：技術可行性、開發成本
  - 設計師視角：用戶體驗合理性、流程完整性
  - 商業視角：市場規模、變現模式、ROI

### P1-6 PAGEs Compatibility Check（PAGEs 相容性判斷）⚙️ 條件性

- **Skill**：`pages-checker`
- **互動模式**：系統比對 — 逐條 User Story 比對 CM Docs，判斷相容性
- **觸發條件**：功能建構在 PAGEs 上時才需要執行；非 PAGEs 專案跳過此步
- **輸入**：PRD（含 User Stories）+ CM Docs
- **產出**：PAGEs 相容性報告
- **判定三分法**：
  - ✅ 可複用：現有 PAGEs 元件直接能用
  - ⚠️ 可優化：現有結構能用但需擴展
  - ❌ 需另建：現有結構無法支撐，需從頭設計
- **影響後續流程**：
  - Flow Mapper：可複用的 US 基於 PAGEs 現有結構設計
  - Prototyper：可複用的 US 對齊 PAGEs UI 規範
  - Architect：需另建的 US 標註需要獨立架構設計
  - **🏷️ 新元件命名**：判定為「需另建」或「可優化（需新增元件）」的 US，在 Prototyper 開始前觸發 `component-naming-skill` 完成命名

---

## Phase 2：PRD → Design

> 目標：把文字需求轉化為可互動的視覺原型。

### P2-1 Information Architecture（資訊架構）

- **Skill**：`flow-mapper`
- **互動模式**：結構化拆解 — 輸入 PRD，產出頁面結構與流程
- **輸入**：PRD
- **產出**：Sitemap（Mermaid 圖）+ User Flow（Mermaid 圖）+ 頁面清單
- **包含內容**：
  - 頁面層級結構
  - 用戶操作流程
  - 頁面間的導航關係

### P2-2 Wireframe / Low-fi Prototype（低保真原型）

- **Skill**：`prototyper`（Phase A：Low-fi）
- **互動模式**：漸進式生成 — 先產出佈局結構，確認後再升級
- **輸入**：Sitemap、User Flow、PRD
- **產出**：可互動的 HTML/React 線框圖（Artifact）
- **重點**：
  - 只處理佈局和流程邏輯
  - 不處理色彩、字型等視覺細節
  - 所有互動都可點擊驗證

### P2-3 Visual Design / Hi-fi Prototype（高保真原型）

- **Skill**：`prototyper`（Phase B：Hi-fi）
- **互動模式**：漸進式生成 — 在 wireframe 基礎上疊加視覺設計
- **輸入**：確認後的 Wireframe
- **產出**：高保真可互動原型（React Artifact）
- **重點**：
  - 色彩系統、字型、間距
  - 元件狀態（hover、active、disabled）
  - 響應式佈局
  - 搭配 `frontend-design` Skill 確保設計品質

### P2-4 Design Review（設計審查）

- **Skill**：`challenger`（視角：可用性 / 無障礙 / 設計一致性）
- **互動模式**：批判性審查
- **輸入**：Hi-fi Prototype
- **產出**：Design Review Report
- **審查維度**：
  - 可用性：操作直覺嗎？新手能上手嗎？
  - 無障礙：色彩對比、字型大小、鍵盤操作
  - 一致性：元件風格是否統一？

---

## Phase 3：Design → 技術建議（交接準備）

> 目標：PM 提供技術方向建議，供 RD 團隊參考。最終架構決策權在 RD。

### P3-1 ~ P3-4 技術建議

- **Skill**：`architect`（建議性質）
- **互動模式**：決策樹 + 結構化填表
- **輸入**：PRD + Design
- **產出**：技術建議文件（標註「供 RD 參考，非最終決策」）
- **包含內容**：
  - 技術選型建議（前端框架、後端服務、資料庫、部署平台）
  - 資料模型草案
  - API 設計草案
  - 元件拆解建議

### P3-5 Architecture Review ⭐ 跨團隊協作

- **Skill**：`challenger`（視角：過度設計 / 擴展性 / 安全性）
- **互動模式**：批判性審查
- **輸入**：RD 的技術架構文件
- **產出**：Architecture Review Report
- **說明**：此視角為 PM 與 RD 共同使用。PM 從產品角度審查架構是否符合需求，RD 從技術角度審查是否合理。

---

## Phase 4-6：RD Agent 職責範圍

> 以下階段由 RD Agent 負責，PM Agent 的產出物作為 RD Agent 的輸入。

### PM → RD 交接文件清單

| # | 文件 | 產出 Skill | 用途 |
|---|------|-----------|------|
| 1 | Idea Brief | idea-interviewer | 產品背景理解 |
| 2 | Persona | idea-interviewer | 目標用戶理解 |
| 3 | PRD（含 GWT） | prd-builder | 功能規格 + 驗收標準 |
| 4 | 驗收案例文件 | prd-builder | 獨立的 GWT 彙整，供 QA 使用 |
| 5 | 競品分析 | challenger | 市場定位參考 |
| 6 | PRD Review Report | challenger | 已知問題和建議 |
| 7 | Sitemap + User Flow | flow-mapper | 頁面結構和流程 |
| 8 | Page Inventory | flow-mapper | 頁面功能和狀態定義 |
| 9 | Hi-fi Prototype | prototyper | 視覺設計參考 |
| 10 | Design Review Report | challenger | 設計問題和建議 |
| 11 | 技術建議文件 | architect | 技術方向建議（非決策） |
| 12 | PAGEs 相容性報告（條件性） | pages-checker | PAGEs 專案的複用/優化/另建判定 |

### RD Agent 負責的階段

| 階段 | 內容 | 對應的 PM 交接文件 |
|------|------|------------------|
| P4：Development | 環境建置、基礎層、功能開發、整合 | PRD + Prototype + 技術建議 |
| P5：QA | 單元測試、整合測試、UAT、Bug Fix | 驗收案例文件（GWT） |
| P6：Deploy | 部署前檢查、部署、文件更新、監控 | PRD 的成功指標 |

### P6-4 Post-launch Review ⭐ 跨團隊協作

- **Skill**：`challenger`（視角：KPI / 用戶反饋 / 下一輪迭代）
- **說明**：上線後覆盤由 PM 和 RD 共同進行。PM 關注 KPI 和用戶反饋，RD 關注技術品質和流程改進。

---

## 工具生態系統

### PM Agent 核心工具

| 工具 | 用途 | 對應階段 |
|------|------|---------|
| **Memory** | 跨對話記住偏好、專案 context | 全階段 |
| **Skills** | 標準化每個階段的 SOP | 全階段 |
| **Projects** | 專案專屬空間 + Custom Instructions | 全階段 |
| **Artifacts** | 產出可互動的 prototype | P2 |
| **Deep Research** | 競品分析、技術調研 | P1-4 |

### PM ↔ RD 協作工具

| 工具 | 用途 |
|------|------|
| **MCP（GitHub）** | PM 在 repo 中建 issue、管理 milestone |
| **MCP（Slack）** | 跨團隊溝通、Review 通知 |
| **MCP（JIRA）** | User Story 和 Sprint 管理 |

---

## Challenger 視角參數一覽

| 使用階段 | 視角參數 | 審查重點 | 使用者 |
|---------|---------|---------|--------|
| P1-4 競品分析 | `market_positioning` | 市場定位、差異化、競品優缺點 | PM |
| P1-5 PRD Review | `multi_role` | 工程師 / 設計師 / 商業三角度 | PM |
| P2-4 Design Review | `usability` | 可用性、無障礙、設計一致性 | PM |
| P3-5 Architecture Review | `engineering` | 過度設計、擴展性、安全性 | ⭐ PM + RD |
| P6-4 Post-launch Review | `retrospective` | KPI、用戶反饋、迭代優先級 | ⭐ PM + RD |
