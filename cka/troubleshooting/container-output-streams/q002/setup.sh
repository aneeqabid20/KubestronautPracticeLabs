#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q008 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-tr-q008 rollout status deploy/observer --timeout=60s >/dev/null
pod="$(kubectl -n cka-tr-q008 get pod -l app=observer -o jsonpath='{.items[0].metadata.name}')"
sleep 4
kubectl -n cka-tr-q008 logs "$pod" -c sidecar | grep -q "backend unreachable" || { echo "[FAIL] expected sidecar error log"; exit 1; }
echo "[PASS] Challenge starting state validated"
