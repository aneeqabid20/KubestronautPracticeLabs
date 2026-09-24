#!/usr/bin/env bash

# Node-level abstraction for future CKA/CKS labs.
#
# Configure optional aliases in ~/.kubestronaut-practice.conf:
#   KPL_NODE01_HOST="k8slab-node01"
#   KPL_NODE02_HOST="k8slab-node02"
#   KPL_CONTROLLER_HOST="k8slab-controller.k8slab.local"
#
# The challenge layer calls node_exec node01 "...", rather than embedding
# Windows, WSL, or PowerShell commands.

KPL_CONFIG="${HOME}/.kubestronaut-practice.conf"
[[ -f "$KPL_CONFIG" ]] && source "$KPL_CONFIG"

node_host() {
  case "$1" in
    controller) printf '%s\n' "${KPL_CONTROLLER_HOST:-k8slab-controller.k8slab.local}" ;;
    node01)     printf '%s\n' "${KPL_NODE01_HOST:-k8slab-node01}" ;;
    node02)     printf '%s\n' "${KPL_NODE02_HOST:-k8slab-node02}" ;;
    *) die "Unknown node alias: $1" ;;
  esac
}

node_exec() {
  local node="$1"
  shift
  local host
  host="$(node_host "$node")"
  ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" "$@"
}

require_node_access() {
  local node="$1"
  node_exec "$node" true >/dev/null 2>&1 \
    || die "SSH access unavailable for node alias: $node ($(node_host "$node"))"
}
