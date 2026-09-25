#!/usr/bin/env bash
set -Eeuo pipefail
B=/var/tmp/kpl-net-q012-Corefile.bak
if sudo test -f "$B"; then sudo cp "$B" /tmp/kpl-net-q012-Corefile-restore; kubectl -n kube-system create configmap coredns --from-file=Corefile=/tmp/kpl-net-q012-Corefile-restore --dry-run=client -o yaml | kubectl apply -f - >/dev/null; kubectl -n kube-system rollout restart deployment/coredns >/dev/null; kubectl -n kube-system rollout status deployment/coredns --timeout=90s >/dev/null; fi
kubectl delete ns cka-net-q012 --ignore-not-found --wait=true >/dev/null
sudo rm -f "$B" /tmp/kpl-net-q012-Corefile /tmp/kpl-net-q012-Corefile-restore
echo "[PASS] Original CoreDNS Corefile restored"
