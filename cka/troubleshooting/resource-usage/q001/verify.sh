#!/usr/bin/env bash
set -Eeuo pipefail
cpu="$(kubectl -n cka-tr-q005 get deploy processor -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}' 2>/dev/null)"
mem="$(kubectl -n cka-tr-q005 get deploy processor -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}' 2>/dev/null)"
ready="$(kubectl -n cka-tr-q005 get deploy processor -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$cpu" == 100m && "$mem" == 64Mi && "$ready" == 2 ]] || { echo "[FAIL] resource/ready state incorrect"; exit 1; }
echo "[PASS] Requests are 100m/64Mi"
echo "[PASS] processor has 2 Ready replicas"
