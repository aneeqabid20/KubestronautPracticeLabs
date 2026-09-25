#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
node_exec node02 'cfg=$(cat /var/tmp/kpl-ca-q013-cni.path); grep -q "cilium-cni" "$cfg"' || { echo "[FAIL] Cilium CNI config not restored"; exit 1; }
kubectl -n cka-ca-q013 wait --for=condition=Ready pod/net-test --timeout=60s >/dev/null || { echo "[FAIL] net-test not Ready"; exit 1; }
node="$(kubectl -n cka-ca-q013 get pod net-test -o jsonpath='{.spec.nodeName}')"
[[ "$node" == k8slab-node02 ]] || exit 1
echo "[PASS] CNI config restored and net-test Ready on node02"
