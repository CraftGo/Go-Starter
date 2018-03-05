#!/bin/sh
#!/bin/bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# Current directory
curdir="$PWD"

# Set GOPATH
GOPATH=$(readlink -f "$PWD/../..")

# Project name
project=$(head -n 1 "$PWD/../name")

# Temporarily change to project root
cd "$GOPATH/src/$project"

# Build
extension=""
for GOOS in darwin linux windows; do
    [ "$GOOS" = "windows" ] && extension=".exe"
    for GOARCH in 386 amd64; do
        export GOOS=$GOOS
        export GOARCH=$GOARCH
        go build -o $project-$GOOS-$GOARCH$extension "$@"
    done
done

# go back to previous directory
cd "$curdir"
