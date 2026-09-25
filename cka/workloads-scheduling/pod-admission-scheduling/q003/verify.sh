#!/usr/bin/env bash
set -Eeuo pipefail
D="kubectl -n cka-ws-q011 get deploy memory-app"
req="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')"
lim="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')"
ready="$($D -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
kubectl -n cka-ws-q011 get limitrange memory-policy >/dev/null || exit 1
[[ "$req" == 64Mi && "$lim" == 128Mi && "$ready" == 1 ]] || { echo "[FAIL] resources/readiness incorrect"; exit 1; }
echo "[PASS] LimitRange preserved and Deployment compliant"
