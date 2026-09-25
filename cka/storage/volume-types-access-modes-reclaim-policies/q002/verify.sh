#!/usr/bin/env bash
set -Eeuo pipefail
policy="$(kubectl get pv archive-pv -o jsonpath='{.spec.persistentVolumeReclaimPolicy}' 2>/dev/null || true)"
phase="$(kubectl -n cka-storage-q004 get pvc archive -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$policy" == "Retain" ]] && echo "[PASS] reclaimPolicy is Retain" || { echo "[FAIL] reclaimPolicy is Retain"; exit 1; }
[[ "$phase" == "Bound" ]] && echo "[PASS] PVC remains Bound" || { echo "[FAIL] PVC remains Bound"; exit 1; }
