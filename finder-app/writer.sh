#!/bin/sh

if [ "$#" -lt 2 ]; then
    printf 'Error: writefile and writestr are required.\n' >&2
    exit 1
fi

writefile=$1
writestr=$2

if [ -z "$writefile" ]; then
    printf 'Error: writefile must not be empty.\n' >&2
    exit 1
fi

write_dir=$(dirname -- "$writefile")
if ! mkdir -p -- "$write_dir"; then
    printf 'Error: could not create directory "%s".\n' "$write_dir" >&2
    exit 1
fi

if ! printf '%s\n' "$writestr" > "$writefile"; then
    printf 'Error: could not create or write file "%s".\n' "$writefile" >&2
    exit 1
fi
