#!/usr/bin/env bash
set -euo pipefail
# Faber — interactive or prompt-driven
# Usage: faber                          → interactive Claude Code session
#        PROMPT="do something" faber    → non-interactive, identity + prompt
#        echo "do something" | faber    → non-interactive, stdin

ENTITY_DIR="${ENTITY_DIR:-$HOME/.faber}"
IDENTITY="$ENTITY_DIR/memories/001-identity.md"
CALL_DIR="${CWD:-$PWD}"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

cd "$ENTITY_DIR"

if [ -n "$PROMPT" ]; then
  exec claude --dangerously-skip-permissions -p "$(cat "$IDENTITY")

Working directory context: $CALL_DIR

$PROMPT" --add-dir "$CALL_DIR"
else
  exec claude . --model sonnet --dangerously-skip-permissions --add-dir "$CALL_DIR"
fi
