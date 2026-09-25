#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
node_exec node01 "lsmod | grep -q '^br_netfilter'" || { echo "[FAIL] br_netfilter loaded"; exit 1; }
[[ "$(node_exec node01 "sysctl -n net.bridge.bridge-nf-call-iptables")" == 1 ]] || { echo "[FAIL] runtime bridge setting"; exit 1; }
node_exec node01 "grep -Eq '^[[:space:]]*net.bridge.bridge-nf-call-iptables[[:space:]]*=[[:space:]]*1' /etc/sysctl.d/99-kpl-bridge.conf" || exit 1
echo "[PASS] bridge netfilter prerequisite enabled and persistent"
