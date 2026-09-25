#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q007 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 8
restart="$(kubectl -n cka-tr-q007 get pod worker -o jsonpath='{.status.containerStatuses[0].restartCount}' 2>/dev/null || echo 0)"
[[ "$restart" -ge 1 ]] || { echo "[FAIL] expected restarts"; exit 1; }
echo "[PASS] Crash/restart state validated"
