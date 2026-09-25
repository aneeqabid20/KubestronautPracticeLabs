#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"

source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node01"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"

require_cluster_access
require_node_access "$NODE_ALIAS"

ready_status="$(kubectl get node "$K8S_NODE" \
  -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')"

[[ "$ready_status" == "True" ]] \
  || die "Baseline check failed: $K8S_NODE must be Ready before setup."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl is-active --quiet kubelet" \
  || die "Baseline check failed: kubelet is not active on $K8S_NODE."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl stop kubelet"

success "Fault injected"

end=$((SECONDS + 90))

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

error "Node did not become NotReady; restoring kubelet."

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl start kubelet" || true

kubectl wait \
  --for=condition=Ready \
  "node/$K8S_NODE" \
  --timeout=90s >/dev/null 2>&1 || true

exit 1
