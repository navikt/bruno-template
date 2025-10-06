#!/bin/sh

while read oldrev newrev refname; do
  git diff --diff-filter=AM --name-only -z "$oldrev" "$newrev" -- '*.txt' |
  while IFS= read -r -d '' file; do
    if git show "$newrev:$file" | grep -q "Hello World"; then
      echo "failed"
      exit 1
    fi
  done
done

echo "pass"
exit 0
