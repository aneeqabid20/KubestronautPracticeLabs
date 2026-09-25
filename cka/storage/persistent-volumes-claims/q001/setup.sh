#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q005 --ignore-not-found --wait=true >/dev/null 2>&1 || true
kubectl delete pv db-pv --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f resources/start.yaml >/dev/null
sleep 2
[[ "$(kubectl -n cka-storage-q005 get pvc db-data -o jsonpath='{.status.phase}')" == "Pending" ]] || exit 1
echo "[PASS] Challenge starting state validated"
