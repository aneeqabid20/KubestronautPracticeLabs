#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0
p(){ echo "[PASS] $1"; }; f(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }
cap="$(kubectl get pv media-pv -o jsonpath='{.spec.capacity.storage}' 2>/dev/null || true)"
mode="$(kubectl get pv media-pv -o jsonpath='{.spec.accessModes[0]}' 2>/dev/null || true)"
cls="$(kubectl get pv media-pv -o jsonpath='{.spec.storageClassName}' 2>/dev/null || true)"
rp="$(kubectl get pv media-pv -o jsonpath='{.spec.persistentVolumeReclaimPolicy}' 2>/dev/null || true)"
hp="$(kubectl get pv media-pv -o jsonpath='{.spec.hostPath.path}' 2>/dev/null || true)"
phase="$(kubectl -n cka-storage-q006 get pvc media -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$cap" == "2Gi" ]] && p "capacity 2Gi" || f "capacity 2Gi"
[[ "$mode" == "ReadWriteOnce" ]] && p "ReadWriteOnce" || f "ReadWriteOnce"
[[ "$cls" == "media-static" ]] && p "class media-static" || f "class media-static"
[[ "$rp" == "Retain" ]] && p "reclaim Retain" || f "reclaim Retain"
[[ "$hp" == "/opt/kpl/media" ]] && p "hostPath correct" || f "hostPath correct"
[[ "$phase" == "Bound" ]] && p "PVC media Bound" || f "PVC media Bound"
exit "$FAIL"
