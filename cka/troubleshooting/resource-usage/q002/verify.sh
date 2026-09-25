#!/usr/bin/env bash
set -Eeuo pipefail
D="kubectl -n cka-tr-q006 get deploy api"
cpu_r="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')"
mem_r="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')"
cpu_l="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')"
mem_l="$($D -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')"
ready="$($D -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$cpu_r" == 100m && "$mem_r" == 64Mi && "$cpu_l" == 500m && "$mem_l" == 128Mi && "$ready" == 2 ]] || { echo "[FAIL] required resources/readiness not met"; exit 1; }
echo "[PASS] Resource requests/limits correct"
echo "[PASS] api has 2 Ready replicas"
