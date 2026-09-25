#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
node_exec node02 'F=/etc/sysctl.d/99-kpl-kubernetes.conf; B=/var/tmp/kpl-ca-q003-sysctl.bak; M=/var/tmp/kpl-ca-q003-sysctl.marker; O=/var/tmp/kpl-ca-q003-original-value; if sudo test -f "$M"; then if grep -qx existed "$M" && sudo test -f "$B"; then sudo cp -a "$B" "$F"; else sudo rm -f "$F"; fi; fi; if sudo test -f "$O"; then v=$(cat "$O"); sudo sysctl -w net.ipv4.ip_forward="$v" >/dev/null; fi; sudo rm -f "$B" "$M" "$O"'
echo "[PASS] Original sysctl state restored"
