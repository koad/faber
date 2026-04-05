#!/usr/bin/env bash
set -euo pipefail
#
# ~/.faber/hooks/executed-without-arguments.sh
#
# Rooted to fourty4. Config lives in .env:
#   KOAD_IO_ENTITY_HARNESS, ENTITY_HOST, REMOTE_HARNESS_BIN, REMOTE_NVM_INIT
#
# This hook defers to the framework default logic but is kept here so entity-level
# overrides can be added without touching the framework.
#

source "$HOME/.koad-io/.env" 2>/dev/null || true
source "$HOME/.${ENTITY:?ENTITY not set}/.env" 2>/dev/null || true

ENTITY_DIR="${ENTITY_DIR:-$HOME/.$ENTITY}"
CALL_DIR="${CWD:-$PWD}"
KOAD_IO_ENTITY_HARNESS="${KOAD_IO_ENTITY_HARNESS:-opencode}"
ENTITY_HOST="${ENTITY_HOST:-}"
REMOTE_HARNESS_BIN="${REMOTE_HARNESS_BIN:-$KOAD_IO_ENTITY_HARNESS}"
REMOTE_NVM_INIT="${REMOTE_NVM_INIT:-}"
LOCKFILE="/tmp/entity-${ENTITY}.lock"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

if [ -f "${CALL_DIR}/PRIMER.md" ]; then
  PROJECT_PRIMER="$(cat "$CALL_DIR/PRIMER.md")"
  PROMPT="$(printf 'Project context (from %s/PRIMER.md):\n%s\n\n---\n\n%s' "$CALL_DIR" "$PROJECT_PRIMER" "$PROMPT")"
fi

if [ -n "$REMOTE_NVM_INIT" ]; then
  REMOTE_PREFIX="$REMOTE_NVM_INIT && "
else
  REMOTE_PREFIX=""
fi

if [ -z "$PROMPT" ]; then
  exec ssh -t "$ENTITY_HOST" \
    "${REMOTE_PREFIX}cd \$HOME/.$ENTITY && $REMOTE_HARNESS_BIN . --model sonnet --dangerously-skip-permissions"
fi

if [ -f "$LOCKFILE" ]; then
  LOCKED_PID=$(cat "$LOCKFILE" 2>/dev/null || echo "")
  if [ -n "$LOCKED_PID" ] && kill -0 "$LOCKED_PID" 2>/dev/null; then
    echo "$ENTITY is busy (pid $LOCKED_PID). Try again shortly." >&2
    exit 1
  fi
fi
echo $$ > "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT

ENCODED=$(printf '%s' "$PROMPT" | base64 -w0 2>/dev/null || printf '%s' "$PROMPT" | base64)
ssh "$ENTITY_HOST" \
  "${REMOTE_PREFIX}cd \$HOME/.$ENTITY && DECODED=\$(echo '$ENCODED' | base64 -d) && $REMOTE_HARNESS_BIN --model sonnet --dangerously-skip-permissions --output-format=json -p \"\$DECODED\" 2>/dev/null" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('result',''))"
