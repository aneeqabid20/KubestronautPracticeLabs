#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
source "$ROOT_DIR/lib/dependencies.sh"

NS="cka-storage-q002"
require_cluster_access
ensure_local_path_provisioner

kubectl delete namespace "$NS" --ignore-not-found --wait=true >/dev/null 2>&1 || true
kubectl delete sc fast-local --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f resources/start.yaml >/dev/null

sleep 4
phase="$(kubectl -n "$NS" get pvc cache -o jsonpath='{.status.phase}')"
[[ "$phase" == "Pending" ]] || die "Expected cache PVC Pending, got $phase"
success "Broken dynamic provisioning state validated"
