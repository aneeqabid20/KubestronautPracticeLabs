#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
source "$ROOT_DIR/lib/node.sh"

NODE_ALIAS="node01"
K8S_NODE="$(node_k8s_name "$NODE_ALIAS")"
KUBECONFIG="/etc/kubernetes/kubelet.conf"
BACKUP="/var/tmp/kpl-cka-clusters-nodes-q005-kubelet.conf.bak"

restore_fault() {
  node_exec "$NODE_ALIAS" \
    "if sudo -n test -f '$BACKUP'; then
       sudo -n cp -a '$BACKUP' '$KUBECONFIG'
       sudo -n rm -f '$BACKUP'
     fi
     sudo -n systemctl restart kubelet >/dev/null 2>&1 || true" || true
}

require_cluster_access
require_node_access "$NODE_ALIAS"

ready="$(kubectl get node "$K8S_NODE" \
  -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')"
[[ "$ready" == "True" ]] || die "Baseline check failed: $K8S_NODE is not Ready."

node_exec "$NODE_ALIAS" "sudo -n systemctl is-active --quiet kubelet" \
  || die "Baseline check failed: kubelet is not active."

node_exec "$NODE_ALIAS" "sudo -n test -f '$KUBECONFIG'" \
  || die "Baseline check failed: $KUBECONFIG does not exist."

node_exec "$NODE_ALIAS" \
  "sudo -n cp -a '$KUBECONFIG' '$BACKUP'
   sudo -n sed -i 's#^[[:space:]]*server:.*#    server: https://127.0.0.1:6443#' '$KUBECONFIG'
   sudo -n systemctl restart kubelet"

success "Fault injected"

end=$((SECONDS + 120))
while (( SECONDS < end )); do
  ready="$(kubectl get node "$K8S_NODE" \
    -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' 2>/dev/null || true)"

  kubelet_active="no"
  if node_exec "$NODE_ALIAS" \
    "sudo -n systemctl is-active --quiet kubelet" >/dev/null 2>&1; then
    kubelet_active="yes"
  fi

  if [[ -n "$ready" && "$ready" != "True" && "$kubelet_active" == "yes" ]]; then
    success "$K8S_NODE is NotReady"
    success "kubelet remains active"
    success "Challenge starting state validated"
    exit 0
  fi

  sleep 2
done

error "Scenario did not reach its expected starting state; restoring baseline."
restore_fault

kubectl wait --for=condition=Ready "node/$K8S_NODE" \
  --timeout=120s >/dev/null 2>&1 || true
exit 1
