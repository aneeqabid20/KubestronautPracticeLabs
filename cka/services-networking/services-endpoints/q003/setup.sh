#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q007 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q007 rollout status deploy/web --timeout=60s >/dev/null
kubectl -n cka-net-q007 wait --for=condition=Ready pod/client --timeout=60s >/dev/null
echo "[PASS] Challenge starting state prepared"
