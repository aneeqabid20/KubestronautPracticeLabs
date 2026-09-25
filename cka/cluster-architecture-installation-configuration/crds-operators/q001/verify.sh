#!/usr/bin/env bash
set -Eeuo pipefail
size="$(kubectl -n cka-ca-q014 get widgets.kpl.example demo -o jsonpath='{.spec.size}' 2>/dev/null || true)"
[[ "$size" == 3 ]] || { echo "[FAIL] Widget demo spec.size=3"; exit 1; }
echo "[PASS] Widget demo accepted with size 3"
