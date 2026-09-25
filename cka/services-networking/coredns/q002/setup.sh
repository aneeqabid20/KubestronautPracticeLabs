#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q013 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q013 rollout status deploy/backend --timeout=60s >/dev/null
kubectl -n cka-net-q013 wait --for=condition=Ready pod/client --timeout=60s >/dev/null
if kubectl -n cka-net-q013 exec client -- nslookup backend >/dev/null 2>&1; then echo "[FAIL] expected DNS failure"; exit 1; fi
echo "[PASS] Client DNS policy failure validated"
