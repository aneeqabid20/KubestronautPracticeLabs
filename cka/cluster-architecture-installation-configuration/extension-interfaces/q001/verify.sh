#!/usr/bin/env bash
set -Eeuo pipefail
grep -qx 'runtime-endpoint: unix:///run/containerd/containerd.sock' /etc/crictl.yaml || exit 1
grep -qx 'image-endpoint: unix:///run/containerd/containerd.sock' /etc/crictl.yaml || exit 1
sudo crictl info >/dev/null 2>&1 || exit 1
echo "[PASS] crictl communicates with containerd"
