#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q011 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-tr-q011 rollout status deploy/api --timeout=60s >/dev/null
sleep 2
if kubectl -n cka-tr-q011 exec client -- wget -q -T 2 -O- http://api >/dev/null 2>&1; then echo "[FAIL] expected client denied"; exit 1; fi
echo "[PASS] Default-deny starting state validated"
