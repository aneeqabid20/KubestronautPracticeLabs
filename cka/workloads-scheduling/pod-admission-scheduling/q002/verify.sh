#!/usr/bin/env bash
set -Eeuo pipefail
node="$(kubectl -n cka-ws-q010 get pod batch -o jsonpath='{.spec.nodeName}' 2>/dev/null || true)"
tol="$(kubectl -n cka-ws-q010 get pod batch -o jsonpath='{range .spec.tolerations[?(@.key=="dedicated")]}{.value}:{.effect}{end}' 2>/dev/null || true)"
[[ "$node" == k8slab-node02 && "$tol" == batch:NoSchedule ]] || { echo "[FAIL] toleration/node incorrect"; exit 1; }
kubectl -n cka-ws-q010 wait --for=condition=Ready pod/batch --timeout=20s >/dev/null || exit 1
echo "[PASS] batch tolerates taint and runs on node02"
