#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q006 --ignore-not-found --wait=true >/dev/null
kubectl delete pv media-pv --ignore-not-found >/dev/null
echo "[PASS] Scenario resources removed"
