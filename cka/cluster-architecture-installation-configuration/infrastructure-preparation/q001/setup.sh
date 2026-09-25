#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
N=node02; F=/etc/sysctl.d/99-kpl-kubernetes.conf; B=/var/tmp/kpl-ca-q003-sysctl.bak; M=/var/tmp/kpl-ca-q003-sysctl.marker
require_node_access "$N"
node_exec "$N" "sudo sh -c 'sysctl -n net.ipv4.ip_forward > /var/tmp/kpl-ca-q003-original-value'; if sudo test -f '$F'; then sudo cp -a '$F' '$B'; echo existed | sudo tee '$M' >/dev/null; else echo absent | sudo tee '$M' >/dev/null; fi; echo 'net.ipv4.ip_forward = 0' | sudo tee '$F' >/dev/null; sudo sysctl -w net.ipv4.ip_forward=0 >/dev/null"
[[ "$(node_exec "$N" "sysctl -n net.ipv4.ip_forward")" == 0 ]] || exit 1
echo "[PASS] Challenge starting state validated"
