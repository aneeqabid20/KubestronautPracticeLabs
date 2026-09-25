#!/usr/bin/env bash
set -Eeuo pipefail
F=/tmp/cka-kubeadm-q001/join.sh
[[ -x "$F" ]] || { echo "[FAIL] join.sh missing/not executable"; exit 1; }
grep -Eq 'kubeadm[[:space:]]+join[[:space:]].*--token[[:space:]]+[a-z0-9]{6}\.[a-z0-9]{16}.*--discovery-token-ca-cert-hash[[:space:]]+sha256:' "$F" || { echo "[FAIL] complete join command not found"; exit 1; }
token="$(grep -Eo -- '--token[[:space:]]+[a-z0-9]{6}\.[a-z0-9]{16}' "$F" | awk '{print $2}' | head -1)"
sudo kubeadm token list | awk 'NR>1{print $1}' | grep -qx "$token" || { echo "[FAIL] referenced token not active"; exit 1; }
echo "[PASS] Executable join command uses active token"
