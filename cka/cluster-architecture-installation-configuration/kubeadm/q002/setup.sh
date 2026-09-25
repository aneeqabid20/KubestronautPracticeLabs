#!/usr/bin/env bash
set -Eeuo pipefail
rm -rf /tmp/cka-kubeadm-q002; mkdir -p /tmp/cka-kubeadm-q002
cp resources/broken.yaml /tmp/cka-kubeadm-q002/cluster.yaml
echo "[PASS] Challenge file prepared"
