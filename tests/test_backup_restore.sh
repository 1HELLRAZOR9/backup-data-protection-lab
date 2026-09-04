#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

SOURCE="$WORK/source"
BACKUP="$WORK/backup"
RESTORE="$WORK/restore"
mkdir -p "$SOURCE" "$BACKUP" "$RESTORE"

printf 'security lab test data\n' > "$SOURCE/example.txt"
printf 'second file\n' > "$SOURCE/config.txt"

bash "$ROOT/scripts/backup.sh" "$SOURCE" "$BACKUP"

test -f "$BACKUP/example.txt"
test -f "$BACKUP/config.txt"

rm "$SOURCE/example.txt" "$SOURCE/config.txt"
bash "$ROOT/scripts/restore.sh" "$BACKUP" "$RESTORE"

test "$(cat "$RESTORE/example.txt")" = 'security lab test data'
test "$(cat "$RESTORE/config.txt")" = 'second file'

echo 'PASS: backup and restore workflow works.'
