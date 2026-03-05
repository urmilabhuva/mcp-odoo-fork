#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
source .venv/bin/activate
ENV_FILE="${MCP_ODOO_ENV_FILE:-.env}"
if [ ! -f "$ENV_FILE" ]; then
  echo "MCP env file not found: $ENV_FILE" >&2
  exit 1
fi
set -a
source "$ENV_FILE"
set +a
exec python -m odoo_mcp
