#!/usr/bin/env bash
set -euo pipefail
VERSION="${VERSION:-$1}"

MANIFESTS=(
  ".claude-plugin/plugin.json"
  ".claude-plugin/marketplace.json"
  ".codex-plugin/plugin.json"
  "gemini-extension.json"
)

for f in "${MANIFESTS[@]}"; do
  jq --arg v "$VERSION" '
    if .plugins then .plugins[].version = $v
    else .version = $v
    end
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
  echo "  $(basename "$f"): -> $VERSION"
done
