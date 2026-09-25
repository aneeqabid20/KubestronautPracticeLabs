#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q010 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-tr-q010 rollout status deploy/web --timeout=60s >/dev/null
kubectl -n cka-tr-q010 wait --for=condition=Ready pod/tester --timeout=60s >/dev/null
sleep 2
if kubectl -n cka-tr-q010 exec tester -- wget -q -T 2 -O- http://web >/dev/null 2>&1; then echo "[FAIL] expected Service request to fail"; exit 1; fi
echo "[PASS] Challenge starting state validated"
