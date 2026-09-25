#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node01"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"
FAIL=0

pass() { printf '[PASS] %s\n' "$1"; }
fail() { printf '[FAIL] %s\n' "$1"; FAIL=$((FAIL + 1)); }

kubectl get node "$K8S_NODE" >/dev/null 2>&1 \
  && pass "Node $K8S_NODE exists" \
  || { fail "Node $K8S_NODE exists"; exit 1; }

node_exec "$NODE_ALIAS" "sudo -n systemctl is-active --quiet kubelet" >/dev/null 2>&1 \
  && pass "kubelet is active" \
  || fail "kubelet is active"

node_exec "$NODE_ALIAS" "sudo -n systemctl is-active --quiet containerd" >/dev/null 2>&1 \
  && pass "containerd is active" \
  || fail "containerd is active"

ready="$(kubectl get node "$K8S_NODE" \
  -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' 2>/dev/null || true)"

[[ "$ready" == "True" ]] \
  && pass "$K8S_NODE is Ready and communicating with the API server" \
  || fail "$K8S_NODE is Ready (current: ${ready:-unknown})"

exit "$FAIL"
