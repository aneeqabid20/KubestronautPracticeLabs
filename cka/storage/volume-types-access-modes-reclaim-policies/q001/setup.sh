#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q003 --ignore-not-found --wait=true >/dev/null 2>&1 || true
kubectl delete pv reports-pv --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f resources/start.yaml >/dev/null
sleep 2
[[ "$(kubectl -n cka-storage-q003 get pvc reports -o jsonpath='{.status.phase}')" == "Pending" ]] \
  || { echo "[FAIL] Expected Pending PVC"; exit 1; }
echo "[PASS] Challenge starting state validated"
