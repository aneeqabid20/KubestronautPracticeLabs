#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q009 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-tr-q009 rollout status deploy/web --timeout=60s >/dev/null
ep="$(kubectl -n cka-tr-q009 get endpointslice -l kubernetes.io/service-name=web -o jsonpath='{.items[0].endpoints[0].addresses[0]}' 2>/dev/null || true)"
[[ -z "$ep" ]] || { echo "[FAIL] expected no endpoints"; exit 1; }
echo "[PASS] Challenge starting state validated"
