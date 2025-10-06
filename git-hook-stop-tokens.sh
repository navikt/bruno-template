#!/bin/sh

while read local_ref local_sha remote_ref remote_sha; do
  files=$(git diff --diff-filter=AM --name-only -z "$remote_sha" "$local_sha" -- '*.txt')
  echo "$files" | while IFS= read -r -d '' file; do
    if git show "$local_sha:$file" | grep -q "Hello World"; then
      echo "failed"
      exit 1
    fi
  done
done

echo "pass"
exit 0
