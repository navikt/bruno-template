#!/bin/sh
while read oldrev newrev refname; do
  # List added or modified .txt files between oldrev and newrev
  files=$(git diff --name-only "$oldrev" "$newrev" -- '*.txt')

  for file in $files; do
    # Extract the file content from the new revision
    if git show "$newrev:$file" | grep -q "Hello World"; then
      echo "❌ Push rejected: 'Hello World' detected in $file"
      exit 1
    fi
  done
done