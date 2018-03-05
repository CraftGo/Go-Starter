#requires -version 3
#Requires -RunAsAdministrator

# Define project root
$gopath = $(Resolve-Path "$PSScriptRoot\..\..")
$Command = "cmd.exe /c setx GOPATH ""$gopath"" /M"
Invoke-Expression $Command
