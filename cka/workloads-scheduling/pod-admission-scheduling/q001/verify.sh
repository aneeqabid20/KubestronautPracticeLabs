#!/usr/bin/env bash
set -Eeuo pipefail
node="$(kubectl -n cka-ws-q009 get pod affinity-app -o jsonpath='{.spec.nodeName}' 2>/dev/null || true)"
key="$(kubectl -n cka-ws-q009 get pod affinity-app -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key}' 2>/dev/null || true)"
val="$(kubectl -n cka-ws-q009 get pod affinity-app -o jsonpath='{.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0]}' 2>/dev/null || true)"
[[ "$node" == k8slab-node01 && "$key" == kubernetes.io/hostname && "$val" == k8slab-node01 ]] || { echo "[FAIL] affinity/node incorrect"; exit 1; }
echo "[PASS] Required affinity schedules Pod to node01"
