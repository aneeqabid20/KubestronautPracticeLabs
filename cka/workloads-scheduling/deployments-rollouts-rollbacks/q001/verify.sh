#!/usr/bin/env bash
set -Eeuo pipefail
img="$(kubectl -n cka-ws-q001 get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}')"
rep="$(kubectl -n cka-ws-q001 get deploy web -o jsonpath='{.spec.replicas}')"
ready="$(kubectl -n cka-ws-q001 get deploy web -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$img" == nginx:1.27-alpine && "$rep" == 3 && "$ready" == 3 ]] || { echo "[FAIL] rollout not restored"; exit 1; }
echo "[PASS] Last working image restored"
echo "[PASS] 3 replicas Ready"
