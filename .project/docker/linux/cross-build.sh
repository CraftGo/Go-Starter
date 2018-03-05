#!/bin/sh
#!/bin/bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# Current directory
curdir="$PWD"

# Project name
project=$(head -n 1 "$PWD/../../name")

# Build
extension=""
for GOOS in darwin linux windows; do
    [ "$GOOS" = "windows" ] && extension=".exe"
    for GOARCH in 386 amd64; do
        export GOOS=$GOOS
        export GOARCH=$GOARCH
        docker run --rm \
                -v $PSScriptRoot/../../..:/go \
                -w /go/src/$project \
                -e GOOS=$GOOS \
                -e GOARCH=$GOARCH \
                golang:alpine go build -o $project-$GOOS-$GOARCH$extension "$@"

    done
done

# go back to previous directory
cd "$curdir"
