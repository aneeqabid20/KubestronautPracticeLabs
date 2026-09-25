#!/usr/bin/env bash
set -Eeuo pipefail
cls="$(kubectl get pv db-pv -o jsonpath='{.spec.storageClassName}' 2>/dev/null || true)"
phase="$(kubectl -n cka-storage-q005 get pvc db-data -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$cls" == "db-static" ]] || { echo "[FAIL] db-pv class"; exit 1; }
[[ "$phase" == "Bound" ]] || { echo "[FAIL] db-data Bound"; exit 1; }
echo "[PASS] db-pv uses db-static"
echo "[PASS] db-data is Bound"
