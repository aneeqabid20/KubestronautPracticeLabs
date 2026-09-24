#!/usr/bin/env bash

require_cluster_access() {
  kubectl version --request-timeout=5s >/dev/null 2>&1 \
    || die "kubectl cannot reach the Kubernetes API server."
}

namespace_exists() {
  kubectl get namespace "$1" >/dev/null 2>&1
}

wait_for_pods_created() {
  local namespace="$1"
  local selector="$2"
  local timeout="${3:-60}"

  local end=$((SECONDS + timeout))
  while (( SECONDS < end )); do
    if [[ "$(kubectl -n "$namespace" get pods -l "$selector" --no-headers 2>/dev/null | wc -l)" -gt 0 ]]; then
      return 0
    fi
    sleep 2
  done
  return 1
}
