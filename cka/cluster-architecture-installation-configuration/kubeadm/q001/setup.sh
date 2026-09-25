#!/usr/bin/env bash
set -Eeuo pipefail
sudo rm -rf /tmp/cka-kubeadm-q001
sudo mkdir -p /tmp/cka-kubeadm-q001
sudo chown "$(id -u):$(id -g)" /tmp/cka-kubeadm-q001
echo "[PASS] Challenge starting state prepared"
