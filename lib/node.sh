#!/usr/bin/env bash

KPL_CONFIG="${HOME}/.kubestronaut-practice.conf"
[[ -f "$KPL_CONFIG" ]] && source "$KPL_CONFIG"

node_k8s_name() {
  case "$1" in
    controller) printf '%s\n' "${KPL_CONTROLLER_NAME:-k8slab-controller.k8slab.local}" ;;
    node01)     printf '%s\n' "${KPL_NODE01_NAME:-k8slab-node01}" ;;
    node02)     printf '%s\n' "${KPL_NODE02_NAME:-k8slab-node02}" ;;
    *) die "Unknown node alias: $1" ;;
  esac
}

node_internal_ip() {
  local node_name
  node_name="$(node_k8s_name "$1")"

  kubectl get node "$node_name" \
    -o jsonpath='{.status.addresses[?(@.type=="InternalIP")].address}' 2>/dev/null
}

node_host() {
  local alias="$1"
  local configured=""
  local user="${KPL_NODE_USER:-ubuntu}"

  case "$alias" in
    controller)
      configured="${KPL_CONTROLLER_HOST:-}"
      user="${KPL_CONTROLLER_USER:-$user}"
      ;;
    node01)
      configured="${KPL_NODE01_HOST:-}"
      user="${KPL_NODE01_USER:-$user}"
      ;;
    node02)
      configured="${KPL_NODE02_HOST:-}"
      user="${KPL_NODE02_USER:-$user}"
      ;;
    *)
      die "Unknown node alias: $alias"
      ;;
  esac

  if [[ -n "$configured" ]]; then
    printf '%s\n' "$configured"
    return 0
  fi

  local ip
  ip="$(node_internal_ip "$alias")"

  [[ -n "$ip" ]] \
    || die "Unable to discover InternalIP for $(node_k8s_name "$alias")"

  printf '%s@%s\n' "$user" "$ip"
}

node_exec() {
  local node="$1"
  shift

  local host
  host="$(node_host "$node")"

  ssh \
    -o BatchMode=yes \
    -o ConnectTimeout=5 \
    -o StrictHostKeyChecking=accept-new \
    "$host" "$@"
}

require_node_access() {
  local node="$1"
  local host
  host="$(node_host "$node")"

  node_exec "$node" true >/dev/null 2>&1 \
    || die "SSH access unavailable for $node ($host)"
}
