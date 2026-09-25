#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/kubernetes.sh"
MANIFEST="/etc/kubernetes/manifests/kube-controller-manager.yaml"; BACKUP="/var/tmp/kpl-cka-cc-q002-controller.yaml.bak"; NS="cka-cc-q002"
require_cluster_access
sudo -n true >/dev/null 2>&1 || die "Passwordless sudo required."
grep -q -- '--kubeconfig=/etc/kubernetes/controller-manager.conf' "$MANIFEST" || die "Unexpected controller-manager baseline."
sudo cp -a "$MANIFEST" "$BACKUP"
sudo sed -i 's#--kubeconfig=/etc/kubernetes/controller-manager.conf#--kubeconfig=/etc/kubernetes/controller-manager-broken.conf#' "$MANIFEST"
success "Fault injected"
sleep 8
kubectl create ns "$NS" >/dev/null
kubectl -n "$NS" create deployment web --image=nginx:1.27-alpine --replicas=3 >/dev/null
sleep 5
count="$(kubectl -n "$NS" get rs --no-headers 2>/dev/null | wc -l)"
[[ "$count" -eq 0 ]] || die "Deployment unexpectedly reconciled"
success "Challenge starting state validated"
