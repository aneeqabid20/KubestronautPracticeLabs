#!/usr/bin/env bash
set -Eeuo pipefail
key="$(kubectl -n cka-ws-q003 get deploy greeter -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="MESSAGE")].valueFrom.configMapKeyRef.key}')"
ready="$(kubectl -n cka-ws-q003 get deploy greeter -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$key" == message && "$ready" == 2 ]] || { echo "[FAIL] ConfigMap ref/readiness incorrect"; exit 1; }
echo "[PASS] ConfigMap key reference correct"
echo "[PASS] 2 replicas Ready"
