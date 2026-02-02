#!/usr/bin/env bash
set -euo pipefail

FILE="host_id.txt"

if [ -f "$FILE" ]; then
  echo "[OK] $FILE already exists. Keeping existing host id."
  cat "$FILE"
  exit 0
fi

if command -v uuidgen >/dev/null 2>&1; then
  uuidgen > "$FILE"
else
  # fallback if uuidgen not available
  python3 - << 'PY'
import uuid
print(uuid.uuid4())
PY
fi

echo "[OK] Generated $FILE:"
cat "$FILE"
echo ""
echo "Do NOT delete this file. It is used to bind the license to this server."
