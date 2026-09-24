#!/usr/bin/env bash

info()    { printf '[INFO] %s\n' "$*"; }
success() { printf '[PASS] %s\n' "$*"; }
warn()    { printf '[WARN] %s\n' "$*" >&2; }
error()   { printf '[FAIL] %s\n' "$*" >&2; }
die()     { error "$*"; exit 1; }

require_command() {
  command -v "$1" >/dev/null 2>&1 || die "Required command not found: $1"
}

trim() {
  local value="$*"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}
