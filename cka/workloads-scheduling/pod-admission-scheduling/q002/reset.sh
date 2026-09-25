#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete ns cka-ws-q010 --ignore-not-found --wait=true >/dev/null
kubectl taint node k8slab-node02 dedicated=batch:NoSchedule- >/dev/null 2>&1 || true
echo "[PASS] Scenario removed and taint cleared"
