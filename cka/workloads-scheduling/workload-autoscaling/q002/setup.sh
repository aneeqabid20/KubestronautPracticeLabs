#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q006 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-ws-q006 rollout status deploy/api --timeout=60s >/dev/null
echo "[PASS] Challenge starting state validated"
