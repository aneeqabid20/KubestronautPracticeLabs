#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q011 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 4
pods="$(kubectl -n cka-ws-q011 get pods --no-headers 2>/dev/null | wc -l)"
[[ "$pods" -eq 0 ]] || { echo "[FAIL] expected admission rejection"; exit 1; }
echo "[PASS] Challenge starting state validated"
