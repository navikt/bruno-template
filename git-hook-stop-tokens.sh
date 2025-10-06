FILES_PATTERN='\.bru$'
FORBIDDEN='eyJ'

git diff --cached --name-only | \
  grep -E "$FILES_PATTERN" | \
  xargs grep --with-filename -n -F "$FORBIDDEN" && \
  echo "❌ rrrr COMMIT STOPPET fant JWT Token i .bru. Inneholder '$FORBIDDEN. Slett dem før du committer" && exit 1 || \
  echo "✅ rrrr Fant ingen JWT Token i .bru filer"