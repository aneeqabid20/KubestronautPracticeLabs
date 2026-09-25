#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node01"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"
CONFIG="/var/lib/kubelet/config.yaml"
BACKUP="/var/tmp/kpl-cka-clusters-nodes-q003-kubelet-config.yaml.bak"

require_node_access "$NODE_ALIAS"

node_exec "$NODE_ALIAS" \
  "if sudo -n test -f '$BACKUP'; then
     sudo -n cp -a '$BACKUP' '$CONFIG'
     sudo -n rm -f '$BACKUP'
   fi
   sudo -n systemctl restart kubelet"

success "Original kubelet configuration restored"

kubectl wait --for=condition=Ready "node/$K8S_NODE" --timeout=120s >/dev/null \
  && success "$K8S_NODE is Ready" \
  || die "$K8S_NODE did not return to Ready during reset."
