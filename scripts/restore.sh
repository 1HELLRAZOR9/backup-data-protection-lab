#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${1:-}"
RESTORE_DIR="${2:-}"

if [[ -z "$BACKUP_DIR" || -z "$RESTORE_DIR" ]]; then
  echo "Usage: $0 <backup_dir> <restore_dir>"
  exit 1
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
  echo "Error: backup directory does not exist: $BACKUP_DIR"
  exit 1
fi

mkdir -p "$RESTORE_DIR"

cp -a "$BACKUP_DIR"/. "$RESTORE_DIR"/

echo "Restore completed: $BACKUP_DIR -> $RESTORE_DIR"
