param(
  [string]$TargetPath = (Get-Location).Path,
  [ValidateSet('auto', 'laravel', 'node', 'docs')]
  [string]$Profile = 'auto',
  [switch]$Force,
  [switch]$InstallGlobal
)

$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot

function Get-Profile {
  param([string]$Path)

  if ($Profile -ne 'auto') {
    return $Profile
  }

  $hasComposer = Test-Path (Join-Path $Path 'composer.json')
  $hasArtisan = Test-Path (Join-Path $Path 'artisan')
  $hasPackage = Test-Path (Join-Path $Path 'package.json')

  if ($hasComposer -or $hasArtisan) { return 'laravel' }
  if ($hasPackage) { return 'node' }
  return 'docs'
}

function Copy-FileSafe {
  param(
    [string]$Source,
    [string]$Destination
  )

  $destinationDir = Split-Path -Parent $Destination
  if ($destinationDir) {
    New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
  }

  if ((Test-Path $Destination) -and -not $Force) {
    throw "Destination already exists: $Destination. Re-run with -Force to overwrite."
  }

  if ((Test-Path $Destination) -and $Force) {
    $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backup = "$Destination.bak.$timestamp"
    Copy-Item -Force $Destination $backup
  }

  Copy-Item -Force $Source $Destination
}

function Install-Set {
  param(
    [string]$SourceDir,
    [string]$DestinationRoot
  )

  Copy-FileSafe (Join-Path $SourceDir 'AGENTS.md') (Join-Path $DestinationRoot 'AGENTS.md')
  Copy-FileSafe (Join-Path $SourceDir 'GEMINI.md') (Join-Path $DestinationRoot 'GEMINI.md')
  Copy-FileSafe (Join-Path $repoRoot '.gemini\settings.json') (Join-Path $DestinationRoot '.gemini\settings.json')
  Copy-FileSafe (Join-Path $repoRoot 'AI_OPERATION_GUIDE.md') (Join-Path $DestinationRoot 'AI_OPERATION_GUIDE.md')
}

$resolvedTarget = (Resolve-Path $TargetPath).Path
$selectedProfile = Get-Profile -Path $resolvedTarget
$profileDir = Join-Path $repoRoot ("presets\" + $selectedProfile)

if (-not (Test-Path $profileDir)) {
  throw "Unknown profile directory: $profileDir"
}

Install-Set -SourceDir $profileDir -DestinationRoot $resolvedTarget

if ($InstallGlobal) {
  $codexHome = Join-Path $HOME '.codex'
  $geminiHome = Join-Path $HOME '.gemini'
  New-Item -ItemType Directory -Force -Path $codexHome | Out-Null
  New-Item -ItemType Directory -Force -Path $geminiHome | Out-Null

  Copy-FileSafe (Join-Path $repoRoot 'AGENTS.md') (Join-Path $codexHome 'AGENTS.md')
  Copy-FileSafe (Join-Path $repoRoot 'GEMINI.md') (Join-Path $geminiHome 'GEMINI.md')
  Copy-FileSafe (Join-Path $repoRoot '.gemini\settings.json') (Join-Path $geminiHome 'settings.json')
}

Write-Host "Installed AI config to: $resolvedTarget"
Write-Host "Profile: $selectedProfile"
if ($InstallGlobal) {
  Write-Host "Global config updated under: $HOME"
}
