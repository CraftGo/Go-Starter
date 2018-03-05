#requires -version 3

# Check project root
if( !($Env:GOPATH -eq $(Resolve-Path "$PSScriptRoot\..\..")) ) {
    Write-Host "GOPATH variable is not defined to point to project root" -ForegroundColor Red
    Write-Host "Uset Set-GOPATH and restart your powershell session" -ForegroundColor Red
    exit 1
}

# Project name
$project = Get-Content "$PSScriptRoot\..\name" -First 1

# Temporarily change to project root
Push-Location "$Env:GOPATH\src\$project"

# Compile and run
go run "${project}.go" "$args"

# go back to previous directory
Pop-Location
