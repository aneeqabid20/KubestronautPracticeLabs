#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
node_exec node02 'if sudo test -f /var/tmp/kpl-ca-q013-cni.path && sudo test -f /var/tmp/kpl-ca-q013-cni.bak; then cfg=$(cat /var/tmp/kpl-ca-q013-cni.path); sudo cp -a /var/tmp/kpl-ca-q013-cni.bak "$cfg"; sudo systemctl restart kubelet; fi; sudo rm -f /var/tmp/kpl-ca-q013-cni.path /var/tmp/kpl-ca-q013-cni.bak'
kubectl delete ns cka-ca-q013 --ignore-not-found --wait=true >/dev/null
echo "[PASS] CNI baseline restored and scenario removed"
