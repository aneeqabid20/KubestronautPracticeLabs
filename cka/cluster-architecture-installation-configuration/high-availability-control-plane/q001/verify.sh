#!/usr/bin/env bash
set -Eeuo pipefail
F=/tmp/cka-ha-q001/cluster.yaml
sudo kubeadm config validate --config "$F" >/dev/null 2>&1 || { echo "[FAIL] kubeadm config validate"; exit 1; }
grep -Eq '^controlPlaneEndpoint:[[:space:]]*"?k8s-lb.k8slab.local:6443"?[[:space:]]*$' "$F" || exit 1
grep -Eq 'podSubnet:[[:space:]]*"?10.244.0.0/16"?' "$F" || exit 1
grep -Eq 'serviceSubnet:[[:space:]]*"?10.96.0.0/12"?' "$F" || exit 1
grep -Eq '^[[:space:]]*local:[[:space:]]*(\{\})?[[:space:]]*$' "$F" || { echo "[FAIL] local etcd not configured"; exit 1; }
! grep -Eq '^[[:space:]]*external:' "$F" || { echo "[FAIL] external etcd still configured"; exit 1; }
echo "[PASS] HA ClusterConfiguration is valid"
