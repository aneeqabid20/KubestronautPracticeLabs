#!/usr/bin/env bash
set -Eeuo pipefail
j(){ kubectl -n cka-ws-q002 get deploy api -o jsonpath="$1"; }
[[ "$(j '{.spec.replicas}')" == 4 ]] || exit 1
[[ "$(j '{.spec.strategy.type}')" == RollingUpdate ]] || exit 1
[[ "$(j '{.spec.strategy.rollingUpdate.maxUnavailable}')" == 0 ]] || exit 1
[[ "$(j '{.spec.strategy.rollingUpdate.maxSurge}')" == 1 ]] || exit 1
[[ "$(j '{.status.readyReplicas}')" == 4 ]] || exit 1
echo "[PASS] RollingUpdate strategy and availability correct"
