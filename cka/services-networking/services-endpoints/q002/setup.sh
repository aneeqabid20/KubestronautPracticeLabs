#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q006 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q006 rollout status deploy/web --timeout=60s >/dev/null
kubectl -n cka-net-q006 wait --for=condition=Ready pod/client --timeout=60s >/dev/null
sleep 2
if kubectl -n cka-net-q006 exec client -- wget -q -T 2 -O- http://web:8080 >/dev/null 2>&1; then exit 1; fi
echo "[PASS] Broken service port mapping validated"
