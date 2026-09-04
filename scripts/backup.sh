#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="${1:-}"
BACKUP_DIR="${2:-}"

if [[ -z "$SOURCE_DIR" || -z "$BACKUP_DIR" ]]; then
  echo "Usage: $0 <source_dir> <backup_dir>"
  exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: source directory does not exist: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$BACKUP_DIR"

cp -a "$SOURCE_DIR"/. "$BACKUP_DIR"/

echo "Backup completed: $SOURCE_DIR -> $BACKUP_DIR"
