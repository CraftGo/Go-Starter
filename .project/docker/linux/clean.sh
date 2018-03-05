#!/bin/sh
#!/bin/bash

# set -e : Exit the script if any statement returns a non-true return value.
# set -u : Exit the script when using uninitialised variable.
set -eu

# Current directory
curdir="$PWD"

# Project name
project=$(head -n 1 "$PWD/../../name")

# Clean
docker run --rm -v $PWD/../../..:/go -w /go/src/$project golang:alpine go clean "$@"
