# PM Agent Skills

> 標準化的 PM 產品開發流程，從 Idea 到 RD Handoff
> 安裝後可在 Claude Code 直接用 Slash Command 觸發每個階段的 AI 協作。

---

## 安裝需求

- Windows + WSL（Ubuntu）
- [Claude Code](https://claude.ai/code)

---

## 安裝步驟

打開 **WSL**，執行以下三行：

```bash
git clone https://github.com/Bryan47nice/pm-agent-skills.git
cd pm-agent-skills
bash install.sh
```

安裝完成後，**重啟 Claude Code**，輸入 `/idea-interviewer` 測試是否成功。

---

## 包含的 Skills

| Slash Command | 階段 | 用途 |
|---|---|---|
| `/idea-interviewer` | P1 發想 | 把模糊 idea 逼出具體 Idea Brief + Persona |
| `/prd-builder` | P1 規劃 | Idea Brief → User Stories + PRD |
| `/challenger` | 審查 | 批判性 review 產品文件 |
| `/flow-mapper` | P2 設計 | PRD → Sitemap + User Flow |
| `/prototyper` | P2 設計 | Flow → 可互動原型 |
| `/architect` | P3 交接 | 產出技術方向建議給 RD |
| `/pages-checker` | 輔助 | 比對 PAGEs 系統相容性 |
| `/component-naming-skill` | 輔助 | 元件命名建議 |
| `/pm-update` | 維護 | 自動檢查並更新所有 Skills 到最新版本 |

---

## 典型工作流程

```
# Phase 1：發想與規劃
/idea-interviewer   → idea-brief.md + persona.md
/prd-builder        → prd.md + user-stories.md
/challenger         → review-report.md

# Phase 2：設計
/flow-mapper        → sitemap.md + user-flow.md
/prototyper         → wireframes

# Phase 3：RD 交接
/architect          → tech-specs.md
```

---

## 更新 Skills

在 Claude Code 輸入：
```
/pm-update
```

Claude 會自動檢查 GitHub 是否有新版本，有的話直接 pull + 重裝，並回報哪些 Skills 被更新了。

或手動在 WSL 執行：
```bash
cd pm-agent-skills
git pull
bash install.sh
```

---

## 其他指令

```bash
bash install.sh --list     # 列出所有可用 Skills（不安裝）
bash install.sh --local    # 只安裝到當前專案（.claude/commands/）
bash uninstall.sh          # 移除所有已安裝的 Skills
```

---

## 常見問題

**Q：輸入 `/idea-interviewer` 沒有反應？**
請確認已重啟 Claude Code，且 WSL 安裝步驟有成功跑完（看到 ✓ installed）。

**Q：Mac / Linux 可以用嗎？**
可以，直接執行 `bash install.sh` 即可，腳本會自動偵測環境。

**Q：如何只在特定專案使用某個 Skill？**
在該專案資料夾執行 `bash install.sh --local`，會安裝到該專案的 `.claude/commands/`。

---

**維護者：** 47  
**授權：** MIT
