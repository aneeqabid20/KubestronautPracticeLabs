#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q008 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 10
r="$(kubectl -n cka-ws-q008 get pod -l app=slow-app -o jsonpath='{.items[0].status.containerStatuses[0].restartCount}' 2>/dev/null || echo 0)"
[[ "$r" -ge 1 ]] || { echo "[FAIL] expected early liveness restart"; exit 1; }
echo "[PASS] Challenge starting state validated"
