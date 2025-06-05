#!/usr/bin/env bash
# Check syntax of all .ttl macro files using ttpmacro.exe

set -u

if ! command -v ttpmacro.exe >/dev/null 2>&1; then
    echo "Error: ttpmacro.exe not found in PATH." >&2
    exit 1
fi

status=0
while IFS= read -r -d '' macro; do
    echo "Checking $macro ..."
    ttpmacro.exe /C "$macro" || status=1
done < <(find . -name '*.ttl' -print0)

exit $status
