#!/usr/bin/env bash
set -Eeuo pipefail
M="/etc/kubernetes/manifests/kube-apiserver.yaml"; B="/var/tmp/kpl-cka-cc-q003-apiserver.yaml.bak"
if sudo test -f "$B"; then sudo cp -a "$B" "$M"; sudo rm -f "$B"; fi
end=$((SECONDS+120))
while ((SECONDS<end)); do kubectl --request-timeout=3s get --raw=/readyz >/dev/null 2>&1 && { echo "[PASS] API recovered"; exit 0; }; sleep 3; done
echo "[FAIL] API did not recover" >&2; exit 1
