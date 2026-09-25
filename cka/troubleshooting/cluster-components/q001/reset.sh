#!/usr/bin/env bash
set -Eeuo pipefail
MANIFEST="/etc/kubernetes/manifests/kube-scheduler.yaml"; BACKUP="/var/tmp/kpl-cka-cc-q001-scheduler.yaml.bak"
if sudo test -f "$BACKUP"; then sudo cp -a "$BACKUP" "$MANIFEST"; sudo rm -f "$BACKUP"; fi
end=$((SECONDS+120)); while ((SECONDS<end)); do kubectl --request-timeout=3s get --raw=/readyz >/dev/null 2>&1 && break; sleep 2; done
kubectl -n kube-system wait --for=condition=Ready pod -l component=kube-scheduler --timeout=120s >/dev/null
kubectl delete ns cka-cc-q001 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scheduler restored and scenario removed"
