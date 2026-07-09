#!/usr/bin/env bash
# Publish to npm — bump version otomatis, commit, push, publish
set -e

ROOT="$(dirname "$(dirname "$0")")"
YEAR=$(date +%Y)
MONTH=$(date +%-m)
YEAR_FIRST=2026
MAJOR=$((YEAR - YEAR_FIRST + 1))
VER="${MAJOR}.${MONTH}"

# Baca current version
CUR=$(grep '"version"' "$ROOT/package.json" | head -1 | sed 's/.*"version": "\(.*\)",/\1/')
CUR_BASE=$(echo "$CUR" | cut -d. -f1-2)
CUR_PATCH=$(echo "$CUR" | cut -d. -f3)

if [ "$CUR_BASE" = "$VER" ]; then
    PATCH=$((CUR_PATCH + 1))
else
    PATCH=1
fi

FULL="${VER}.${PATCH}"

echo "━━━ termux-connecting publish ━━━"
echo "  Current : $CUR"
echo "  New     : $FULL"
echo ""

# Update package.json
sed -i '' 's/"version": "'"$CUR"'"/"version": "'"$FULL"'"/' "$ROOT/package.json"

# Update bin/termux-connect-pc
sed -i '' 's/^VERSION="'"$CUR"'"/VERSION="'"$FULL"'"/' "$ROOT/bin/termux-connect-pc"

# Commit, push, publish
cd "$ROOT"
git add -A
git commit -m "chore: publish v${FULL}"
git push
npm publish

echo ""
echo "[✓] Published v${FULL}"
