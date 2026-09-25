#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-net-q005 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-q005 rollout status deploy/web --timeout=60s >/dev/null
sleep 2
ep="$(kubectl -n cka-net-q005 get endpointslice -l kubernetes.io/service-name=web -o jsonpath='{.items[0].endpoints[0].addresses[0]}' 2>/dev/null || true)"
[[ -z "$ep" ]] || exit 1
echo "[PASS] No-endpoint state validated"
