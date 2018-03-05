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
go build -v "$@"

# go back to previous directory
cd "$curdir"
