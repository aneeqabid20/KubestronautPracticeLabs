#!/usr/bin/env bash

VALIDATION_FAILURES=0

check_pass() {
  printf '[PASS] %s\n' "$1"
}

check_fail() {
  printf '[FAIL] %s\n' "$1"
  VALIDATION_FAILURES=$((VALIDATION_FAILURES + 1))
}

check_cmd() {
  local description="$1"
  shift

  if "$@" >/dev/null 2>&1; then
    check_pass "$description"
  else
    check_fail "$description"
  fi
}

validation_result() {
  if [[ "$VALIDATION_FAILURES" -eq 0 ]]; then
    return 0
  fi
  return 1
}
