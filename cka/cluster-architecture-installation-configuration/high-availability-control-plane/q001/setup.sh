#!/usr/bin/env bash
set -Eeuo pipefail
rm -rf /tmp/cka-ha-q001; mkdir -p /tmp/cka-ha-q001
cp resources/broken.yaml /tmp/cka-ha-q001/cluster.yaml
echo "[PASS] HA configuration challenge prepared"
