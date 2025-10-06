FILES_PATTERN='\.txt$'
FORBIDDEN='hello world'

git diff --cached --name-only | \
  grep -E "$FILES_PATTERN" | \
  xargs grep --with-filename -n -F "$FORBIDDEN" && \
  echo "COMMIT REJECTED Found '$FORBIDDEN' references. Please remove them before committing" && exit 1 || \
  echo "No forbidden text found"