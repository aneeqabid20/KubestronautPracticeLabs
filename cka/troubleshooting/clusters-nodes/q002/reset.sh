#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"

source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node02"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"

require_node_access "$NODE_ALIAS"

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl start containerd"

success "containerd started on $K8S_NODE"

node_exec "$NODE_ALIAS" \
  "sudo -n systemctl start kubelet"

success "kubelet running on $K8S_NODE"

if kubectl wait \
  --for=condition=Ready \
  "node/$K8S_NODE" \
  --timeout=120s >/dev/null 2>&1; then

  success "$K8S_NODE is Ready"
else
  die "$K8S_NODE did not return to Ready during reset."
fi
