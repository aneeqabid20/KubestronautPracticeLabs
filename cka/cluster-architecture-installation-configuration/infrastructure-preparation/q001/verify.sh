#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
[[ "$(node_exec node02 "sysctl -n net.ipv4.ip_forward")" == 1 ]] || { echo "[FAIL] runtime ip_forward"; exit 1; }
node_exec node02 "grep -Eq '^[[:space:]]*net.ipv4.ip_forward[[:space:]]*=[[:space:]]*1([[:space:]]*)$' /etc/sysctl.d/99-kpl-kubernetes.conf" || { echo "[FAIL] persistent ip_forward"; exit 1; }
echo "[PASS] IPv4 forwarding enabled and persistent"
