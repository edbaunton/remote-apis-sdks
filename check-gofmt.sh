#!/bin/bash

# Source: https://golang.org/misc/git/pre-commit

unformatted=$(gofmt -l "$@")
[ -z "$unformatted" ] && exit 0

# Some files are not gofmt'd. Print message and fail.

echo >&2 "Go files must be formatted with gofmt. Please run:"
for fn in $unformatted; do
	echo >&2 "  gofmt -w $PWD/$fn"
done

exit 1
