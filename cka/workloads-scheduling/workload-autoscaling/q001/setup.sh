#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q005 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-ws-q005 rollout status deploy/web --timeout=60s >/dev/null
echo "[PASS] Challenge starting state validated"
