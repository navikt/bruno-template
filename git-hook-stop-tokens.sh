FILES_PATTERN='\.bru$'
FORBIDDEN='eyJ'

git diff --cached --name-only | grep -E "$FILES_PATTERN" | xargs -r grep -q -F "$FORBIDDEN" && {
  echo "❌ COMMIT STOPPET: JWT Token funnet i .bru filer"
  exit 1
}

echo "✅ Ingen JWT Tokens funnet"