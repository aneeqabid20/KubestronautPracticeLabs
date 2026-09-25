#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q006 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 4
pods="$(kubectl -n cka-tr-q006 get pods --no-headers 2>/dev/null | wc -l)"
[[ "$pods" -eq 0 ]] || { echo "[FAIL] expected quota admission to prevent Pods"; exit 1; }
echo "[PASS] Challenge starting state validated"
