#!/bin/bash -e

files=$(for file in "$@"; do echo "$file" | sed 's/\/Dockerfile$//'; done | awk '!a[$0]++' | jq -nR '[inputs | select(length>0)]')
echo ::set-output name=files::${files}
