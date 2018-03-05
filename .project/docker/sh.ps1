# Project name
$project = Get-Content "$PSScriptRoot\..\name" -First 1

docker run -it --rm -v $PSScriptRoot/../..:/go -w /go/src/$project golang:alpine /bin/sh
