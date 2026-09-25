#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"

source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node02"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"

FAIL=0

pass() {
  printf '[PASS] %s\n' "$1"
}

fail() {
  printf '[FAIL] %s\n' "$1"
  FAIL=$((FAIL + 1))
}

if kubectl get node "$K8S_NODE" >/dev/null 2>&1; then
  pass "Node $K8S_NODE exists"
else
  fail "Node $K8S_NODE exists"
  exit 1
fi

if node_exec "$NODE_ALIAS" true >/dev/null 2>&1; then
  pass "Administrative SSH access works"
else
  fail "Administrative SSH access works"
fi

if node_exec "$NODE_ALIAS" \
  "sudo -n systemctl is-active --quiet containerd" \
  >/dev/null 2>&1; then
  pass "containerd is active"
else
  fail "containerd is active"
fi

if node_exec "$NODE_ALIAS" \
  "sudo -n systemctl is-active --quiet kubelet" \
  >/dev/null 2>&1; then
  pass "kubelet is active"
else
  fail "kubelet is active"
fi

ready_status="$(kubectl get node "$K8S_NODE" \
  -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' \
  2>/dev/null || true)"

if [[ "$ready_status" == "True" ]]; then
  pass "$K8S_NODE is Ready"
else
  fail "$K8S_NODE is Ready (current: ${ready_status:-unknown})"
fi

exit "$FAIL"
