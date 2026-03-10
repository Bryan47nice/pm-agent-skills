# PM Agent Skills

> 標準化的產品開發流程 Skills,從 Idea 到 RD Handoff

📖 **第一次使用?** 請閱讀 [新手上路指南](GETTING_STARTED.md)

---

## 📦 快速安裝

### 在 Claude Code 中執行:
```bash
# 一行指令安裝所有 7 個 Skills
/plugin add https://github.com/Bryan47nice/pm-agent-skills
```

**就這麼簡單!** 不需要分別安裝每個 Skill。

### 停用可能衝突的官方 Skills:
```bash
/plugin disable superpowers
/plugin disable feature-dev
```

---

## 📚 包含的 Skills

| Skill | 階段 | 用途 | 觸發情境 |
|-------|------|------|----------|
| `idea-interviewer` | P1 發想 | Idea → Idea Brief + Persona | "我有一個想法..." |
| `prd-builder` | P1 規劃 | Idea Brief → User Stories + PRD | "幫我展開 PRD" |
| `flow-mapper` | P2 設計 | PRD → Sitemap + Flow + Inventory | "設計流程" |
| `prototyper` | P2 設計 | Flow → Interactive Prototype | "做 wireframe" |
| `architect` | P3 交接 | Design → Tech Specs (PM 視角) | "給 RD 技術建議" |
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
# 產出: idea-brief.md, persona.md

> 幫我展開 PRD
[prd-builder 執行]
# 產出: prd.md, user-stories.md

> 幫我 review 這份 PRD
[challenger 執行]
# 產出: review-report.md

# Phase 2: 設計
> 開始設計流程
[flow-mapper 執行]
# 產出: sitemap.md, user-flow.mermaid, page-inventory.md

> 做 wireframe
[prototyper 執行]
# 產出: wireframes/*.html

# Phase 3: RD 交接
> 給 RD 技術建議
[architect 掃描專案並產生]
# 產出: tech-specs.md

# 完成!所有文件已準備好交給 RD
$ git add .
$ git commit -m "feat: complete PM docs for login security"
$ git push
```

---

## 🔄 更新
```bash
/plugin update pm-agent-skills
```

---

## 📖 文件

- **[新手上路指南](GETTING_STARTED.md)** - 完整的安裝與使用說明
- **[Skills 詳細說明](skills/)** - 每個 Skill 的 SKILL.md

---

## 🤝 貢獻與回饋

- **Slack:** #pm-tools
- **GitHub Issues:** [回報問題或建議](https://github.com/Bryan47nice/pm-agent-skills/issues)
- **Email:** bryan472017@gmail.com

---

## 📄 授權

MIT License

---

**維護者:** 47  
**版本:** v1.0  
**最後更新:** 2025-03-10