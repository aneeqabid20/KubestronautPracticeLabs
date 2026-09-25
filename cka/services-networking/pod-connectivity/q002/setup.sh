#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q002 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q002 rollout status deploy/backend --timeout=60s >/dev/null
kubectl -n cka-net-q002 wait --for=condition=Ready pod/host-client --timeout=60s >/dev/null
if kubectl -n cka-net-q002 exec host-client -- nslookup backend >/dev/null 2>&1; then echo "[FAIL] expected cluster DNS failure"; exit 1; fi
echo "[PASS] hostNetwork DNS failure validated"
