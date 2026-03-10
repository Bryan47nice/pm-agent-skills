# PM Agent Skills

> 標準化的產品開發流程 Skills,從 Idea 到 RD Handoff

## 📦 快速安裝

### 在 Claude Code 中執行:
```bash
# 1. 加入 Marketplace
/plugin marketplace add Bryan47nice/pm-agent-skills

# 2. 安裝所有 Skills
/plugin install idea-interviewer@pm-agent-skills
/plugin install prd-builder@pm-agent-skills
/plugin install challenger@pm-agent-skills
/plugin install flow-mapper@pm-agent-skills
/plugin install prototyper@pm-agent-skills
/plugin install architect@pm-agent-skills
/plugin install component-naming-skill@pm-agent-skills
```

---

## 📚 包含的 Skills

| Skill | 階段 | 用途 | 觸發情境 |
|-------|------|------|----------|
| `idea-interviewer` | P1 | Idea → Idea Brief + Persona | "我有一個想法..." |
| `prd-builder` | P1 | Idea Brief → User Stories + PRD | "幫我展開 PRD" |
| `flow-mapper` | P2 | PRD → Sitemap + Flow + Inventory | "設計流程" |
| `prototyper` | P2 | Flow → Interactive Prototype | "做 wireframe" |
| `architect` | P3 | Design → Tech Specs (PM 視角) | "給 RD 技術建議" |
| `challenger` | 審查 | 批判性審查工具 | "幫我 review...", "競品分析" |
| `component-naming-skill` | 輔助 | 元件命名助手 | "幫我命名這個元件" |

---

## 🎯 典型工作流程
```bash
# 啟動新專案
$ cd ~/projects/new-feature
$ claude

# Phase 1: 發想與規劃
> 我有一個想法:改善用戶登入的安全性...
[idea-interviewer 自動觸發]
# 產出: idea-brief.md

> 幫我展開 PRD
[prd-builder 執行]
# 產出: prd.md, user-stories.md

# Phase 2: 設計
> 開始設計流程
[flow-mapper 執行]
# 產出: sitemap.md, user-flow.mermaid

> 做 wireframe
[prototyper 執行]
# 產出: wireframes/*.html

# Phase 3: RD 交接
> 給 RD 技術建議
[architect 掃描專案並產生]
# 產出: tech-specs.md
```

---

## 📄 授權

MIT License