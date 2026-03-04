$files = Get-ChildItem -Filter "*.html"
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $content = $content -replace 'href="#"([^>]*>\s*<span[^>]*>[^<]*<\/span>\s*See It)', 'href="index.html"$1'
    $content = $content -replace 'href="#"([^>]*>\s*<span[^>]*>[^<]*<\/span>\s*Explain It)', 'href="explain-it.html"$1'
    $content = $content -replace 'href="#"([^>]*>\s*<span[^>]*>[^<]*<\/span>\s*Fix It)', 'href="fix-it.html"$1'
    $content = $content -replace 'href="#"([^>]*>\s*<span[^>]*>[^<]*<\/span>\s*Fund It)', 'href="fund-it.html"$1'
    Set-Content -Path $file.FullName -Value $content -NoNewline
}
Write-Host "Links updated."
