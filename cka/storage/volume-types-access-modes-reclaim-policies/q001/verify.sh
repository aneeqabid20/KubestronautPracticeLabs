#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0
p(){ echo "[PASS] $1"; }; f(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }
mode="$(kubectl get pv reports-pv -o jsonpath='{.spec.accessModes[0]}' 2>/dev/null || true)"
[[ "$mode" == "ReadWriteOnce" ]] && p "PV supports ReadWriteOnce" || f "PV supports ReadWriteOnce"
phase="$(kubectl -n cka-storage-q003 get pvc reports -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$phase" == "Bound" ]] && p "PVC reports is Bound" || f "PVC reports is Bound"
exit "$FAIL"
