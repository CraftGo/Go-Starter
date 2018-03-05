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

# Build
$gooss=@("darwin", "linux", "windows")
$extensions=@("", "", ".exe")
$goarchs=@("386", "amd64")
foreach($goos in $gooss) {
    $extension=$extensions[$gooss.IndexOf($goos)]
    foreach($goarch in $goarchs) {
        $Env:GOOS=$goos
        $Env:GOARCH=$goarch
        go build -o $project-$GOOS-$GOARCH$extension "$args"
    }
}

# go back to previous directory
Pop-Location
