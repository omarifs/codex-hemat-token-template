param(
  [string]$AliasName = 'ai',
  [string]$SetupName = 'ai-setup',
  [switch]$InstallGlobal
)

$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$profilePath = $PROFILE.CurrentUserAllHosts
$profileDir = Split-Path -Parent $profilePath

if ($profileDir) {
  New-Item -ItemType Directory -Force -Path $profileDir | Out-Null
}

$markerStart = '# BEGIN codex-hemat-token-template'
$markerEnd = '# END codex-hemat-token-template'
$profileBlock = @"
$markerStart
function $AliasName {
  & '$repoRoot\ai.ps1' @args
}

function $SetupName {
  & '$repoRoot\install-ai.ps1' @args
}
$markerEnd
"@

$existing = ''
if (Test-Path $profilePath) {
  $existing = Get-Content -Raw $profilePath
}

$updated = if ($existing -match [regex]::Escape($markerStart) + '.*?' + [regex]::Escape($markerEnd)) {
  [regex]::Replace($existing, [regex]::Escape($markerStart) + '.*?' + [regex]::Escape($markerEnd), $profileBlock, 'Singleline')
} elseif ($existing) {
  $existing.TrimEnd() + "`r`n`r`n" + $profileBlock + "`r`n"
} else {
  $profileBlock + "`r`n"
}

Set-Content -Path $profilePath -Value $updated -Encoding UTF8

Write-Host "Installed PowerShell aliases in: $profilePath"
Write-Host "Commands: $AliasName, $SetupName"

if ($InstallGlobal) {
  & "$repoRoot\install-ai.ps1" -InstallGlobal
}
