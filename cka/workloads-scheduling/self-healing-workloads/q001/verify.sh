#!/usr/bin/env bash
set -Eeuo pipefail
path="$(kubectl -n cka-ws-q007 get deploy web -o jsonpath='{.spec.template.spec.containers[0].livenessProbe.httpGet.path}')"
port="$(kubectl -n cka-ws-q007 get deploy web -o jsonpath='{.spec.template.spec.containers[0].livenessProbe.httpGet.port}')"
ready="$(kubectl -n cka-ws-q007 get deploy web -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
[[ "$path" == / && "$port" == 80 && "$ready" == 2 ]] || { echo "[FAIL] liveness/readiness incorrect"; exit 1; }
echo "[PASS] Liveness probe and readiness correct"
