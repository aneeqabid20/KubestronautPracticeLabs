#!/usr/bin/env bash
set -Eeuo pipefail
mode="$(kubectl -n cka-tr-q007 get pod worker -o jsonpath='{.spec.containers[0].env[?(@.name=="MODE")].value}' 2>/dev/null || true)"
[[ "$mode" == production ]] || { echo "[FAIL] MODE=production"; exit 1; }
kubectl -n cka-tr-q007 wait --for=condition=Ready pod/worker --timeout=20s >/dev/null || { echo "[FAIL] worker Ready"; exit 1; }
echo "[PASS] MODE=production"
echo "[PASS] worker Ready"
