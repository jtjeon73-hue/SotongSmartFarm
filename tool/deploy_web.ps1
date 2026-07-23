# SotongSmartFarm Web Deploy Script (Windows PowerShell)
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

Write-Host "== 1) Repository check =="
if (-not (Test-Path "pubspec.yaml")) { throw "pubspec.yaml not found" }
$name = (Get-Content pubspec.yaml | Select-String "^name:\s*(.+)$").Matches[0].Groups[1].Value.Trim()
if ($name -ne "sotong_smart_farm") { throw "Unexpected package name: $name" }

Write-Host "== 2) Firebase Project ID check =="
$firebaseRc = Get-Content ".firebaserc" -Raw
if ($firebaseRc -notmatch '"default":\s*"sotong-smart-farm"') {
  throw "Firebase Project ID must be sotong-smart-farm"
}

Write-Host "== 3) flutter pub get =="
flutter pub get

Write-Host "== 4) dart format =="
dart format .

Write-Host "== 5) flutter analyze =="
flutter analyze
if ($LASTEXITCODE -ne 0) { throw "analyze failed" }

Write-Host "== 6) flutter test =="
flutter test
if ($LASTEXITCODE -ne 0) { throw "test failed" }

Write-Host "== 7) flutter build web --release =="
flutter build web --release
if ($LASTEXITCODE -ne 0) { throw "build failed" }

Write-Host "== 8) Firebase Hosting deploy =="
firebase deploy --only hosting --project sotong-smart-farm
if ($LASTEXITCODE -ne 0) { throw "deploy failed" }

Write-Host "== 9) Live URL =="
Write-Host "https://sotong-smart-farm.web.app"
Write-Host "Done."
