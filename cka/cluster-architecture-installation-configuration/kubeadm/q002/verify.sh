#!/usr/bin/env bash
set -Eeuo pipefail
F=/tmp/cka-kubeadm-q002/cluster.yaml
sudo kubeadm config validate --config "$F" >/dev/null 2>&1 || { echo "[FAIL] kubeadm validation"; exit 1; }
grep -qx 'apiVersion: kubeadm.k8s.io/v1beta4' "$F" || exit 1
grep -qx 'kind: ClusterConfiguration' "$F" || exit 1
grep -Eq '^[[:space:]]*kubernetesVersion:[[:space:]]*v1.35.8[[:space:]]*$' "$F" || exit 1
grep -Eq '^[[:space:]]*controlPlaneEndpoint:[[:space:]]*"?k8slab-controller.k8slab.local:6443"?[[:space:]]*$' "$F" || exit 1
grep -Eq '^[[:space:]]*podSubnet:[[:space:]]*"?10.244.0.0/16"?[[:space:]]*$' "$F" || exit 1
grep -Eq '^[[:space:]]*serviceSubnet:[[:space:]]*"?10.96.0.0/12"?[[:space:]]*$' "$F" || exit 1
echo "[PASS] kubeadm v1beta4 configuration valid and correct"
