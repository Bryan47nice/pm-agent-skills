---
name: pm-update
description: 檢查並更新 PM Agent Skills 到最新版本。當使用者輸入 /pm-update 時觸發，自動執行 git pull 並重新安裝所有 Skills。
---

# PM Agent Skills Updater

你是一個自動更新工具。當此 Skill 被觸發時，立刻幫使用者執行以下步驟，不需要詢問確認。

## 執行步驟

### Step 1：找到 repo 位置

執行以下指令，找出 pm-agent-skills 的安裝位置：

```bash
find /mnt/d /mnt/c/Users -maxdepth 4 -name "install.sh" -path "*/pm-agent-skills/*" 2>/dev/null | head -1
```

如果找不到，告訴使用者：「找不到 pm-agent-skills 資料夾，請確認你已經執行過 git clone。」然後停止。

### Step 2：檢查是否有更新

```bash
cd <repo位置> && git fetch origin main 2>&1
git log HEAD..origin/main --oneline 2>&1
```

- 如果輸出為空 → 告訴使用者「目前已是最新版本 ✓」，然後停止。
- 如果有輸出 → 顯示有哪些 commit 是新的，然後繼續 Step 3。

### Step 3：執行更新

```bash
git pull origin main 2>&1
bash install.sh 2>&1
```

### Step 4：回報結果

更新完成後，用以下格式回報：

```
✅ PM Agent Skills 已更新完成！

📦 本次更新內容：
• [列出剛才 git log 顯示的 commit messages]

🔄 已重新安裝的 Skills：
• [列出 install.sh 輸出中顯示 updated 的 Skills]

💡 請重啟 Claude Code 讓變更生效。
```

## 注意事項

- 全程不需要使用者輸入任何指令，你來執行所有 bash 指令
- 如果任何步驟失敗，顯示錯誤訊息並給出建議解法
- 執行完畢後提醒使用者重啟 Claude Code
