#!/usr/bin/env bash
set -Eeuo pipefail
F=/tmp/cka-kubeadm-q001/join.sh
if [[ -f "$F" ]]; then token="$(grep -Eo -- '--token[[:space:]]+[a-z0-9]{6}\.[a-z0-9]{16}' "$F" | awk '{print $2}' | head -1 || true)"; [[ -z "$token" ]] || sudo kubeadm token delete "$token" >/dev/null 2>&1 || true; fi
sudo rm -rf /tmp/cka-kubeadm-q001
echo "[PASS] Lab token/file removed"
