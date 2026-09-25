#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"; source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/node.sh"
N=node02; NS=cka-ca-q013
require_node_access "$N"
node_exec "$N" 'cfg=$(grep -l "cilium-cni" /etc/cni/net.d/* 2>/dev/null | head -1); test -n "$cfg" || exit 2; echo "$cfg" | sudo tee /var/tmp/kpl-ca-q013-cni.path >/dev/null; sudo cp -a "$cfg" /var/tmp/kpl-ca-q013-cni.bak; sudo sed -i "s/cilium-cni/kpl-missing-cni/g" "$cfg"; sudo systemctl restart kubelet'
kubectl create ns "$NS" >/dev/null
kubectl -n "$NS" apply -f resources/pod.yaml >/dev/null
sleep 8
ready="$(kubectl -n "$NS" get pod net-test -o jsonpath='{.status.containerStatuses[0].ready}' 2>/dev/null || true)"
[[ "$ready" != true ]] || { echo "[FAIL] expected sandbox failure"; exit 1; }
echo "[PASS] CNI failure starting state validated"
