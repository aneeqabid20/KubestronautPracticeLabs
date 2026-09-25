#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q003 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q003 rollout status deploy/api --timeout=60s >/dev/null
kubectl -n cka-net-q003 wait --for=condition=Ready pod/allowed pod/denied --timeout=60s >/dev/null
sleep 2
if kubectl -n cka-net-q003 exec allowed -- wget -q -T 2 -O- http://api >/dev/null 2>&1; then exit 1; fi
echo "[PASS] Default-deny state validated"
