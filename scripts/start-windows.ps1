$ErrorActionPreference = 'Stop'
$projectDir = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $projectDir
$env:PYTHONUTF8 = '1'
$pythonPath = Join-Path $projectDir '.venv-local\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $pythonPath)) {
    throw 'Missing .venv-local. See docs/windows-local.md for setup.'
}
& $pythonPath -m uvicorn app.main:app --host 127.0.0.1 --port 8095
