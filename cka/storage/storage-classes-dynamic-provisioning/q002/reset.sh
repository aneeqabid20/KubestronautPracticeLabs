#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q002 --ignore-not-found --wait=true >/dev/null
kubectl delete sc fast-local --ignore-not-found >/dev/null
echo "[PASS] Scenario resources removed"
