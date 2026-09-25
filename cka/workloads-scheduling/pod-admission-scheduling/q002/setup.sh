#!/usr/bin/env bash
set -Eeuo pipefail
kubectl taint node k8slab-node02 dedicated=batch:NoSchedule --overwrite >/dev/null
kubectl create ns cka-ws-q010 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 3
[[ "$(kubectl -n cka-ws-q010 get pod batch -o jsonpath='{.status.phase}')" == Pending ]] || exit 1
echo "[PASS] Challenge starting state validated"
