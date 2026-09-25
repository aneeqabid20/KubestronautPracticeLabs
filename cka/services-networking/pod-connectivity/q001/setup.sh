#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q001 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q001 wait --for=condition=Ready pod/server pod/client --timeout=60s >/dev/null
ip="$(kubectl -n cka-net-q001 get pod server -o jsonpath='{.status.podIP}')"
if kubectl -n cka-net-q001 exec client -- wget -q -T 2 -O- "http://$ip:8080" >/dev/null 2>&1; then echo "[FAIL] expected cross-Pod connection failure"; exit 1; fi
echo "[PASS] Cross-node Pod connection failure validated"
