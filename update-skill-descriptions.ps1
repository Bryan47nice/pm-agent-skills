# PM Agent Skills - 批次更新 SKILL.md Description
# 此腳本會縮短所有 skills 的 description 以符合 Claude Code 要求

$skillsBasePath = "E:\claudecode\pm-agent-skills\skills"

# 定義每個 skill 的新 description
$skillDescriptions = @{
    "idea-interviewer" = "透過蘇格拉底式提問,把模糊想法轉為 Idea Brief 和 Persona"
    "prd-builder" = "從 Idea Brief 展開完整的 User Stories 和 PRD 文件"
    "challenger" = "多視角批判性審查產品文件,挑戰假設找出盲點"
    "flow-mapper" = "從 PRD 產生 Sitemap、User Flow 和 Page Inventory"
    "prototyper" = "從資訊架構漸進式生成可互動的 Wireframe 原型"
    "architect" = "從產品角度提出技術方向建議供 RD 參考"
    "component-naming-skill" = "根據字根字首規範協助命名 UI 元件"
}

Write-Host "開始更新 SKILL.md descriptions..." -ForegroundColor Cyan
Write-Host ""

foreach ($skillName in $skillDescriptions.Keys) {
    $skillPath = Join-Path $skillsBasePath "$skillName\SKILL.md"
    
    if (Test-Path $skillPath) {
        Write-Host "處理: $skillName" -ForegroundColor Yellow
        
        # 讀取檔案內容
        $content = Get-Content $skillPath -Raw -Encoding UTF8
        
        # 使用正則表達式替換 description
        # 匹配 frontmatter 中的 description (支援多行)
        $pattern = '(?s)(---\s*\nname:\s*' + [regex]::Escape($skillName) + '\s*\ndescription:\s*)([^\n]+(?:\n(?!---)[^\n]+)*)'
        $replacement = '$1' + $skillDescriptions[$skillName]
        
        $newContent = $content -replace $pattern, $replacement
        
        # 寫回檔案
        $newContent | Out-File -FilePath $skillPath -Encoding UTF8 -NoNewline
        
        Write-Host "  ✓ 已更新: $($skillDescriptions[$skillName])" -ForegroundColor Green
        Write-Host ""
    }
    else {
        Write-Host "  ✗ 找不到檔案: $skillPath" -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host "完成!所有 descriptions 已更新。" -ForegroundColor Green
Write-Host ""
Write-Host "下一步:" -ForegroundColor Cyan
Write-Host "1. 檢查變更: git diff" -ForegroundColor White
Write-Host "2. 提交變更: git add . && git commit -m 'fix: shorten skill descriptions'" -ForegroundColor White
Write-Host "3. 推送到 GitHub: git push" -ForegroundColor White
Write-Host "4. 重啟 Claude Code 測試" -ForegroundColor White
