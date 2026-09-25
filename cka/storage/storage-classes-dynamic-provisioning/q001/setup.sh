#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"
source "$ROOT_DIR/lib/kubernetes.sh"
source "$ROOT_DIR/lib/dependencies.sh"

NS="cka-storage-q001"
require_cluster_access
ensure_local_path_provisioner

# This lab needs no other default StorageClass.
others="$(kubectl get sc -o jsonpath='{range .items[?(@.metadata.annotations.storageclass\.kubernetes\.io/is-default-class=="true")]}{.metadata.name}{"\n"}{end}' \
  | grep -v '^kpl-local-path$' || true)"
[[ -z "$others" ]] || die "Baseline has another default StorageClass: $others"

kubectl annotate sc kpl-local-path \
  storageclass.kubernetes.io/is-default-class- \
  storageclass.beta.kubernetes.io/is-default-class- >/dev/null 2>&1 || true

kubectl create namespace "$NS" >/dev/null
kubectl -n "$NS" apply -f resources/start.yaml >/dev/null

sleep 3
phase="$(kubectl -n "$NS" get pvc web-data -o jsonpath='{.status.phase}')"
[[ "$phase" == "Pending" ]] || die "Expected web-data to be Pending, got $phase"
success "PVC is Pending with no default StorageClass"
success "Challenge starting state validated"
