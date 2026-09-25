#!/usr/bin/env bash
set -Eeuo pipefail
M="/etc/kubernetes/manifests/kube-controller-manager.yaml"; B="/var/tmp/kpl-cka-cc-q002-controller.yaml.bak"
if sudo test -f "$B"; then sudo cp -a "$B" "$M"; sudo rm -f "$B"; fi
kubectl -n kube-system wait --for=condition=Ready pod -l component=kube-controller-manager --timeout=120s >/dev/null
kubectl delete ns cka-cc-q002 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Controller manager restored and scenario removed"
