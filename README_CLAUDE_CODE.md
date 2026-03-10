# PM Agent Skills × Claude Code 安裝指南

將你的 PM Agent Skills 安裝到本機，讓 Claude Code 能透過 Slash Commands 直接呼叫。

---

## 快速開始

### 1. Clone repo

```bash
git clone https://github.com/你的帳號/pm-agent-skills.git
cd pm-agent-skills
```

### 2. 給腳本執行權限

```bash
chmod +x install.sh uninstall.sh
```

### 3. 安裝（全域）

```bash
./install.sh
```

安裝完成後，所有 Skills 會出現在 `~/.claude/commands/` 資料夾，
**重新啟動 Claude Code** 後即可使用。

---

## 在 Claude Code 中使用

直接輸入 `/` 加上 Skill 名稱即可觸發：

| Slash Command | 功能 |
|---|---|
| `/idea-interviewer` | 把模糊 idea 逼出具體 Idea Brief + Persona |
| `/prd-builder` | 將 Idea Brief 展開為完整 PRD |
| `/challenger` | 批判性 review 產品文件 |
| `/flow-mapper` | PRD → Sitemap + User Flow |
| `/prototyper` | 產生可互動原型 |
| `/architect` | 產出技術方向建議給 RD |
| `/pages-checker` | 比對 PAGEs 系統相容性 |
| `/component-naming-skill` | 元件命名建議 |

---

## 安裝選項

```bash
# 全域安裝（所有專案都能用）—— 預設
./install.sh

# 專案本地安裝（只有當前專案能用）
./install.sh --local

# 列出所有可用 Skills（不安裝）
./install.sh --list

# 卸載
./uninstall.sh
./uninstall.sh --local   # 卸載本地版本
```

---

## 更新 Skills

當 repo 有新版本時：

```bash
git pull
./install.sh
```

腳本會自動偵測哪些 Skill 有更新，只覆蓋有變動的檔案。

---

## 安裝位置說明

| 模式 | 路徑 | 適用範圍 |
|---|---|---|
| Global（預設）| `~/.claude/commands/` | 所有專案 |
| Local | `.claude/commands/` | 當前專案 |

---

## 常見問題

**Q: 輸入 `/idea-interviewer` 沒有反應？**
A: 確認已重新啟動 Claude Code，且安裝路徑正確（`~/.claude/commands/idea-interviewer.md` 存在）。

**Q: 可以同時用 Global 和 Local 嗎？**
A: 可以。Local 會覆蓋 Global 的同名 Skill，適合在特定專案做客製化。

**Q: Windows 怎麼用？**
A: 請在 WSL 環境下執行腳本，路徑 `~` 對應到 WSL 的 home 目錄。
