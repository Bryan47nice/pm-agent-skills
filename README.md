# PM Agent Skills

> 標準化的產品開發流程 Skills,從 Idea 到 RD Handoff

## 📦 快速安裝

### 在 Claude Code 中執行:

```bash
# 1. 加入 Marketplace
/plugin marketplace add your-username/pm-agent-skills

# 2. 安裝所有 Skills
/plugin install idea-interviewer@pm-agent-skills
/plugin install prd-builder@pm-agent-skills
/plugin install challenger@pm-agent-skills
/plugin install flow-mapper@pm-agent-skills
/plugin install prototyper@pm-agent-skills
/plugin install architect@pm-agent-skills
/plugin install component-naming-skill@pm-agent-skills
```

> **提示:** 將 `your-username` 替換為你的 GitHub username

---

## 📚 包含的 Skills

### 核心 PM Pipeline

| Skill | 階段 | 用途 | 觸發情境 |
|-------|------|------|----------|
| `idea-interviewer` | P1 | Idea → Idea Brief + Persona | "我有一個想法..." |
| `prd-builder` | P1 | Idea Brief → User Stories + PRD | "幫我展開 PRD" |
| `flow-mapper` | P2 | PRD → Sitemap + Flow + Inventory | "設計流程" |
| `prototyper` | P2 | Flow → Interactive Prototype | "做 wireframe" |
| `architect` | P3 | Design → Tech Specs (PM 視角) | "給 RD 技術建議" |

### 輔助工具

| Skill | 用途 | 觸發情境 |
|-------|------|----------|
| `challenger` | 批判性審查 (可複用於多個階段) | "幫我 review...", "競品分析" |
| `component-naming-skill` | 基於字根字首規範的元件命名 | "幫我命名這個元件" |

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

> 競品怎麼做?
[challenger 執行競品分析]
# 產出: competitor-analysis.md

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

# 提交成果
$ git add .
$ git commit -m "feat: complete PM handoff"
$ git push
```

---

## 🔄 更新 Skills

當 Skills 有更新時:

```bash
# 方法 1: 重新安裝特定 Skill
/plugin reinstall prd-builder@pm-agent-skills

# 方法 2: 更新整個 Marketplace
/plugin marketplace update pm-agent-skills
```

---

## 📖 詳細文檔

- [安裝指南](docs/installation.md) - 詳細安裝步驟與疑難排解
- [使用指南](docs/usage-guide.md) - 每個 Skill 的詳細使用範例
- [Pipeline 說明](docs/pm-pipeline.md) - 完整的 PM Agent Pipeline 流程
- [貢獻指南](CONTRIBUTING.md) - 如何改進和提交新 Skills

---

## 🤝 貢獻

歡迎團隊成員貢獻改進!

### 更新 Skills 的流程:

1. **Fork 這個 Repository**
2. **建立分支**: `git checkout -b improve/prd-builder`
3. **編輯 Skill**: 修改 `skills/prd-builder/SKILL.md`
4. **更新版本**: 在 `marketplace.json` 中更新版本號
5. **提交**: `git commit -m "feat(prd-builder): add GWT format"`
6. **推送**: `git push origin improve/prd-builder`
7. **建立 Pull Request**

---

## 📝 版本記錄

查看 [CHANGELOG.md](CHANGELOG.md) 了解所有版本更新。

---

## 📄 授權

MIT License - 自由使用和修改

---

## 💬 支援

有問題或建議?

- 📧 Email: pm-team@yourcompany.com
- 💬 Slack: #pm-tools 頻道
- 🐛 Issues: [GitHub Issues](https://github.com/your-username/pm-agent-skills/issues)

---

## 🎓 了解更多

- [Claude Code 官方文檔](https://code.claude.com/docs)
- [Agent Skills 標準](https://agentskills.io)
- [PM Agent Pipeline 完整說明](docs/pm-pipeline.md)
