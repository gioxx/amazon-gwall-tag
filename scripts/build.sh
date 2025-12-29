#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"

check_zip() {
  if ! command -v zip >/dev/null 2>&1; then
    echo "zip non trovato. Installa zip e riprova." >&2
    exit 1
  fi
}

prepare_dirs() {
  rm -rf "$DIST_DIR"
  mkdir -p "$DIST_DIR/chrome" "$DIST_DIR/firefox"
}

copy_common() {
  local target="$1"
  cp "$ROOT_DIR/about.html" "$target/"
  mkdir -p "$target/icons"
  cp "$ROOT_DIR/icons/icon16.png" "$ROOT_DIR/icons/icon48.png" "$ROOT_DIR/icons/icon128.png" "$ROOT_DIR/icons/Amazon_Tag_Replacer_noBG.png" "$target/icons/"
}

build_chrome() {
  local target="$DIST_DIR/chrome"
  copy_common "$target"
  cp "$ROOT_DIR/manifest.json" "$target/"
  cp "$ROOT_DIR/rules.json" "$target/"
  (cd "$target" && zip -qr "$DIST_DIR/amazon-gwall-tag-chrome.zip" .)
}

build_firefox() {
  local target="$DIST_DIR/firefox"
  copy_common "$target"
  cp "$ROOT_DIR/manifest.firefox.json" "$target/manifest.json"
  cp "$ROOT_DIR/background.js" "$target/"
  (cd "$target" && zip -qr "$DIST_DIR/amazon-gwall-tag-firefox.zip" .)
}

main() {
  check_zip
  prepare_dirs
  build_chrome
  build_firefox
  echo "Pacchetti pronti in $DIST_DIR:"
  ls -1 "$DIST_DIR"/amazon-gwall-tag-*.zip
}

main "$@"
