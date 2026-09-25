#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
N=node01; F=/etc/sysctl.d/99-kpl-bridge.conf
require_node_access "$N"
node_exec "$N" "sudo modprobe br_netfilter; sysctl -n net.bridge.bridge-nf-call-iptables | sudo tee /var/tmp/kpl-ca-q004-original-value >/dev/null; if sudo test -f '$F'; then sudo cp -a '$F' /var/tmp/kpl-ca-q004-sysctl.bak; echo existed | sudo tee /var/tmp/kpl-ca-q004-marker >/dev/null; else echo absent | sudo tee /var/tmp/kpl-ca-q004-marker >/dev/null; fi; echo 'net.bridge.bridge-nf-call-iptables = 0' | sudo tee '$F' >/dev/null; sudo sysctl -w net.bridge.bridge-nf-call-iptables=0 >/dev/null"
echo "[PASS] Challenge starting state validated"
