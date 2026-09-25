#!/usr/bin/env bash

# Shared optional dependencies for CKA practice labs.
# Source after lib/common.sh and lib/kubernetes.sh.

KPL_ROOT_DIR="${ROOT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

ensure_local_path_provisioner() {
  local manifest="$KPL_ROOT_DIR/dependencies/local-path-provisioner.yaml"

  [[ -f "$manifest" ]] || die "Missing dependency manifest: $manifest"

  if ! kubectl get namespace kpl-storage-system >/dev/null 2>&1; then
    info "Installing local-path provisioner dependency..."
    kubectl apply -f "$manifest" >/dev/null
  else
    kubectl apply -f "$manifest" >/dev/null
  fi

  kubectl -n kpl-storage-system rollout status \
    deployment/kpl-local-path-provisioner --timeout=120s >/dev/null \
    || die "Local-path provisioner did not become Ready."
}

ensure_gateway_api_crds() {
  local version="${KPL_GATEWAY_API_VERSION:-v1.6.2}"
  local url="https://github.com/kubernetes-sigs/gateway-api/releases/download/${version}/standard-install.yaml"

  if kubectl get crd gateways.gateway.networking.k8s.io >/dev/null 2>&1 \
     && kubectl get crd httproutes.gateway.networking.k8s.io >/dev/null 2>&1; then
    return 0
  fi

  info "Installing Gateway API ${version} Standard CRDs..."
  kubectl apply --server-side=true -f "$url" >/dev/null \
    || die "Unable to install Gateway API CRDs from $url"
}
