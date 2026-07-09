#!/usr/bin/env bash
# Publish — cukup jalankan npm publish (bump & push otomatis via lifecycle scripts)
set -e

cd "$(dirname "$0")/.."
npm publish
