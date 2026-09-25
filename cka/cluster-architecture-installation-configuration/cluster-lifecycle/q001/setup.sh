#!/usr/bin/env bash
set -Eeuo pipefail
kubectl uncordon k8slab-node02 >/dev/null 2>&1 || true
kubectl create ns cka-ca-q007 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-ca-q007 rollout status deploy/maintenance-app --timeout=90s >/dev/null
kubectl -n cka-ca-q007 wait --for=condition=Ready pod/maintenance-scratch --timeout=60s >/dev/null
node="$(kubectl -n cka-ca-q007 get pod maintenance-scratch -o jsonpath='{.spec.nodeName}')"
[[ "$node" == k8slab-node02 ]] || { echo "[FAIL] maintenance Pod not on node02"; exit 1; }
echo "[PASS] Maintenance starting state validated"
