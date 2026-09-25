#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q007 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 10
sum="$(kubectl -n cka-ws-q007 get pods -l app=web -o jsonpath='{range .items[*]}{.status.containerStatuses[0].restartCount}{"\n"}{end}' | awk '{s+=$1} END{print s+0}')"
[[ "$sum" -ge 1 ]] || { echo "[FAIL] expected liveness restarts"; exit 1; }
echo "[PASS] Challenge starting state validated"
