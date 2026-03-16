# PM Agent Skills
> 標準化的 PM 產品開發流程，從 Idea 到 RD Handoff
> 安裝後可在 Claude Code 直接用 Slash Command 觸發每個階段的 AI 協作。

---

## 安裝需求
- [Claude Code](https://claude.ai/code)

---

## 安裝步驟

### 方法一：下載 ZIP（推薦，最簡單）

1. 點擊頁面右上角 **Code → Download ZIP**，解壓縮
2. 將 `skills/` 資料夾內所有 `.md` 檔案複製到：
   - **Windows：** `C:\Users\你的帳號\.claude\commands\`
   - **Mac / Linux：** `~/.claude/commands/`
3. 重啟 Claude Code

---

### 方法二：透過指令安裝（支援 `/pm-update` 自動更新）

**Windows**

打開 **PowerShell**，安裝 WSL（Ubuntu）：

```powershell
wsl --install -d Ubuntu
```

安裝完成後**重啟電腦**。重啟後開啟 Ubuntu，依提示設定帳號與密碼，再執行：

```bash
git clone https://github.com/Bryan47nice/pm-agent-skills.git
cd pm-agent-skills
bash install.sh
```

**Mac / Linux**

打開**終端機**，執行：

```bash
git clone https://github.com/Bryan47nice/pm-agent-skills.git
cd pm-agent-skills
bash install.sh
```

---

安裝完成後**重啟 Claude Code**，輸入 `/idea-interviewer` 測試是否成功。

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

> 每個 Skill 的詳細使用說明與範例，請參考各自的 README（位於 `skills/` 資料夾內）。

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

**ZIP 安裝的用戶：** 重新下載 ZIP，將 `skills/` 內的 `.md` 檔案覆蓋貼上即可。

**指令安裝的用戶：** 在 Claude Code 輸入 `/pm-update`，Claude 會自動檢查並更新。

或手動執行：

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
請確認已重啟 Claude Code。ZIP 安裝請確認 `.md` 檔案已放到正確的 `.claude/commands/` 資料夾；指令安裝請確認看到 `✓ installed`。

**Q：ZIP 安裝跟指令安裝有什麼差別？**
功能完全相同。指令安裝的差別是可以使用 `/pm-update` 自動更新；ZIP 安裝需要手動重新下載覆蓋。

**Q：如何只在特定專案使用某個 Skill？**
在該專案資料夾執行 `bash install.sh --local`，或手動將 `.md` 檔案複製到該專案的 `.claude/commands/`。

---

**維護者：** 47  
**授權：** MIT
