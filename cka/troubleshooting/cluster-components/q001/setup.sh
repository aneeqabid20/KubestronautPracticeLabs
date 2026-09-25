#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
MANIFEST="/etc/kubernetes/manifests/kube-scheduler.yaml"
BACKUP="/var/tmp/kpl-cka-cc-q001-scheduler.yaml.bak"
NS="cka-cc-q001"

require_cluster_access
sudo -n true >/dev/null 2>&1 || die "Passwordless sudo required."
[[ -f "$MANIFEST" ]] || die "Run on the kubeadm control-plane node."
grep -q -- '--kubeconfig=/etc/kubernetes/scheduler.conf' "$MANIFEST" || die "Unexpected scheduler manifest baseline."

sudo cp -a "$MANIFEST" "$BACKUP"
sudo sed -i 's#--kubeconfig=/etc/kubernetes/scheduler.conf#--kubeconfig=/etc/kubernetes/scheduler-broken.conf#' "$MANIFEST"
success "Fault injected"

end=$((SECONDS+90))
while ((SECONDS<end)); do
  ready="$(kubectl -n kube-system get pod -l component=kube-scheduler -o jsonpath='{range .items[*]}{.status.containerStatuses[0].ready}{"\n"}{end}' 2>/dev/null || true)"
  [[ "$ready" != *true* ]] && break
  sleep 2
done

kubectl create ns "$NS" >/dev/null
kubectl -n "$NS" run workload --image=nginx:1.27-alpine >/dev/null
sleep 4
node="$(kubectl -n "$NS" get pod workload -o jsonpath='{.spec.nodeName}')"
[[ -z "$node" ]] || die "workload unexpectedly scheduled"
success "Challenge starting state validated"
