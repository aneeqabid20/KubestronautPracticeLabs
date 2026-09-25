#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete clusterrolebinding kpl-node-reader --ignore-not-found >/dev/null
kubectl delete clusterrole kpl-node-reader --ignore-not-found >/dev/null
kubectl delete ns cka-ca-q002 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
