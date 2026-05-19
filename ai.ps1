param(
  [string]$TargetPath = (Get-Location).Path,
  [ValidateSet('auto', 'laravel', 'node', 'docs')]
  [string]$Profile = 'auto',
  [switch]$Force,
  [switch]$InstallGlobal
)

& "$PSScriptRoot\install-ai.ps1" -TargetPath $TargetPath -Profile $Profile -Force:$Force -InstallGlobal:$InstallGlobal

