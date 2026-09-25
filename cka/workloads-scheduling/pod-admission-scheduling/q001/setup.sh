#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q009 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 3
[[ "$(kubectl -n cka-ws-q009 get pod affinity-app -o jsonpath='{.status.phase}')" == Pending ]] || exit 1
echo "[PASS] Challenge starting state validated"
