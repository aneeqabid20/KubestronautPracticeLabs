#!/usr/bin/env bash
set -Eeuo pipefail
port="$(kubectl -n cka-tr-q008 get deploy observer -o jsonpath='{.spec.template.spec.containers[?(@.name=="sidecar")].env[?(@.name=="BACKEND_PORT")].value}' 2>/dev/null)"
[[ "$port" == 80 ]] || { echo "[FAIL] BACKEND_PORT=80"; exit 1; }
kubectl -n cka-tr-q008 rollout status deploy/observer --timeout=40s >/dev/null
pod="$(kubectl -n cka-tr-q008 get pod -l app=observer -o jsonpath='{.items[0].metadata.name}')"
sleep 3
kubectl -n cka-tr-q008 logs "$pod" -c sidecar | grep -q "backend reachable" || { echo "[FAIL] success log missing"; exit 1; }
echo "[PASS] Sidecar configured and backend reachable"
