#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q004 --ignore-not-found --wait=true >/dev/null 2>&1 || true
kubectl delete pv archive-pv --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f resources/start.yaml >/dev/null
kubectl wait --for=jsonpath='{.status.phase}'=Bound pvc/archive -n cka-storage-q004 --timeout=30s >/dev/null
echo "[PASS] Challenge starting state validated"
