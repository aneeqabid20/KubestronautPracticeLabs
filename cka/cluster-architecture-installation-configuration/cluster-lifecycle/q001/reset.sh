#!/usr/bin/env bash
set -Eeuo pipefail
kubectl uncordon k8slab-node02 >/dev/null 2>&1 || true
kubectl delete ns cka-ca-q007 --ignore-not-found --wait=true >/dev/null
echo "[PASS] node02 uncordoned and scenario removed"
