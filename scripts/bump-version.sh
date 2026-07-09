#!/usr/bin/env bash
# Bump version otomatis based on Y.M.P scheme
set -e

ROOT="$(dirname "$(dirname "$0")")"
YEAR=$(date +%Y)
MONTH=$(date +%-m)
FIRST_YEAR=2026
FIRST_MONTH=7
MAJOR=$((YEAR - FIRST_YEAR + 1))
MINOR=$(( (YEAR - FIRST_YEAR) * 12 + (MONTH - FIRST_MONTH) + 1 ))
VER="${MAJOR}.${MINOR}"

CUR=$(grep '"version"' "$ROOT/package.json" | head -1 | sed 's/.*"version": "\(.*\)",/\1/')
CUR_BASE=$(echo "$CUR" | cut -d. -f1-2)
CUR_PATCH=$(echo "$CUR" | cut -d. -f3)

if [ "$CUR_BASE" = "$VER" ]; then
    PATCH=$((CUR_PATCH + 1))
else
    PATCH=1
fi

FULL="${VER}.${PATCH}"

sed -i '' 's/"version": "'"$CUR"'"/"version": "'"$FULL"'"/' "$ROOT/package.json"
sed -i '' 's/^VERSION="'"$CUR"'"/VERSION="'"$FULL"'"/' "$ROOT/bin/termux-connect-pc"

cd "$ROOT"
git add -A
git commit -m "chore: publish v${FULL}"

echo "v${FULL}"
