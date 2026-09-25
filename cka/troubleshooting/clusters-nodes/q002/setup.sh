#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"

source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node02"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"

require_cluster_access
require_node_access "$NODE_ALIAS"

ready_status="$(kubectl get node "$K8S_NODE" \
  -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')"

[[ "$ready_status" == "True" ]] \
  || die "Baseline check failed: $K8S_NODE must be Ready before setup."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl is-active --quiet kubelet" \
  || die "Baseline check failed: kubelet is not active."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl is-active --quiet containerd" \
  || die "Baseline check failed: containerd is not active."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl stop containerd"

success "Fault injected"

end=$((SECONDS + 120))

while (( SECONDS < end )); do

  ready_status="$(kubectl get node "$K8S_NODE" \
    -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' \
    2>/dev/null || true)"

  if [[ -n "$ready_status" && "$ready_status" != "True" ]]; then
    success "$K8S_NODE is NotReady"
    success "Challenge starting state validated"
    exit 0
  fi

  sleep 2
done

error "$K8S_NODE did not become NotReady; restoring containerd."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl start containerd" || true

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl restart kubelet" || true

kubectl wait \
  --for=condition=Ready \
  "node/$K8S_NODE" \
  --timeout=120s >/dev/null 2>&1 || true

exit 1
