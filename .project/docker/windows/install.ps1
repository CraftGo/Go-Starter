#requires -version 3

# Check project root
if( !($Env:GOPATH -eq $(Resolve-Path "$PSScriptRoot\..\..\..")) ) {
    Write-Host "GOPATH variable is not defined to point to project root" -ForegroundColor Red
    Write-Host "Uset Set-GOPATH and restart your powershell session" -ForegroundColor Red
    exit 1
}

# Project name
$project = Get-Content "$PSScriptRoot\..\..\name" -First 1

# Compile and install
docker run --rm -v $PSScriptRoot/../../..:/go -w /go/src/$project golang:alpine go install "$args"
