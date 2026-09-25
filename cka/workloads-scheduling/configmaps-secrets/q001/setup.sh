#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q003 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 4
ready="$(kubectl -n cka-ws-q003 get deploy greeter -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
[[ -z "$ready" || "$ready" == 0 ]] || exit 1
echo "[PASS] Challenge starting state validated"
