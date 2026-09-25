#!/usr/bin/env bash
set -Eeuo pipefail
cpu_r="$(kubectl -n cka-ws-q006 get deploy api -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}' 2>/dev/null || true)"
cpu_l="$(kubectl -n cka-ws-q006 get deploy api -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}' 2>/dev/null || true)"
target="$(kubectl -n cka-ws-q006 get hpa api -o jsonpath='{.spec.metrics[0].resource.target.averageUtilization}')"
[[ "$cpu_r" == 100m && "$cpu_l" == 500m && "$target" == 70 ]] || { echo "[FAIL] CPU resources/HPA target incorrect"; exit 1; }
echo "[PASS] Deployment CPU request/limit and HPA target correct"
