# Installs the skills in .\skills into Claude Code's personal skills folder (Windows PowerShell).
# Usage:  powershell -ExecutionPolicy Bypass -File .\install.ps1
#         $env:CLAUDE_SKILLS_DIR = "D:\otra\ruta"; .\install.ps1
# Existing skills with the same name are backed up, never silently overwritten.
$ErrorActionPreference = 'Stop'

$Src = Join-Path $PSScriptRoot 'skills'
$Dest = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME '.claude\skills' }
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

if (-not (Test-Path $Src)) { throw "No encuentro la carpeta skills\ junto a este script." }
New-Item -ItemType Directory -Force -Path $Dest | Out-Null

$installed = 0
Get-ChildItem -Path $Src -Directory | ForEach-Object {
    if (-not (Test-Path (Join-Path $_.FullName 'SKILL.md'))) { return }
    $target = Join-Path $Dest $_.Name
    if (Test-Path $target) {
        $backup = "$target.bak-$Stamp"
        Move-Item $target $backup
        Write-Host "  respaldo: $($_.Name) -> $(Split-Path $backup -Leaf)"
    }
    Copy-Item $_.FullName $target -Recurse
    Write-Host "  ok: $($_.Name)"
    $installed++
}

Write-Host ""
Write-Host "$installed skills instaladas en $Dest"
Write-Host "Abre una sesion nueva de Claude Code para que las cargue."
