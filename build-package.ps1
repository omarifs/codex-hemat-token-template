param(
  [string]$OutputPath = (Join-Path $PSScriptRoot 'portable-package'),
  [switch]$IncludePresets
)

$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$output = (Resolve-Path -LiteralPath $OutputPath -ErrorAction SilentlyContinue)
if ($output) {
  $output = $output.Path
} else {
  $output = [System.IO.Path]::GetFullPath((Join-Path (Get-Location).Path $OutputPath))
}

New-Item -ItemType Directory -Force -Path $output | Out-Null

$files = @(
  'AGENTS.md',
  'GEMINI.md',
  '.gemini\settings.json',
  'AI_OPERATION_GUIDE.md',
  'ai.cmd',
  'ai.ps1',
  'install-ai.cmd',
  'install-ai.ps1',
  'install-alias.cmd',
  'install-alias.ps1',
  'setup.cmd',
  'setup.ps1',
  'RUN_ME_FIRST.md',
  'PORTABLE_PACKAGE.md'
)

foreach ($relative in $files) {
  $source = Join-Path $repoRoot $relative
  $destination = Join-Path $output $relative
  $destinationDir = Split-Path -Parent $destination
  New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
  Copy-Item -Force $source $destination
}

if ($IncludePresets) {
  foreach ($preset in @('laravel', 'node', 'docs')) {
    $presetSource = Join-Path $repoRoot ("presets\$preset")
    $presetDest = Join-Path $output ("presets\$preset")
    New-Item -ItemType Directory -Force -Path $presetDest | Out-Null
    Copy-Item -Force (Join-Path $presetSource 'AGENTS.md') (Join-Path $presetDest 'AGENTS.md')
    Copy-Item -Force (Join-Path $presetSource 'GEMINI.md') (Join-Path $presetDest 'GEMINI.md')
  }
}

Write-Host "Portable package built at: $output"
if ($IncludePresets) {
  Write-Host "Included presets: laravel, node, docs"
}

