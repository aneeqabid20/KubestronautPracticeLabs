#!/usr/bin/env bash
set -Eeuo pipefail
f=/tmp/cka-ha-q002-join.txt
[[ -f "$f" ]] || { echo '[FAIL] join command file missing'; exit 1; }
grep -Eq '^kubeadm join k8s-ha\.example\.local:6443 ' "$f" || exit 1
grep -Eq -- '--token abcdef\.0123456789abcdef' "$f" || exit 1
grep -Eq -- '--discovery-token-ca-cert-hash sha256:[0-9a-f]{64}' "$f" || exit 1
grep -Eq -- '(^|[[:space:]])--control-plane([[:space:]]|$)' "$f" || exit 1
grep -Eq -- '--certificate-key [0-9a-f]{64}' "$f" || exit 1
echo '[PASS] HA control-plane join command structure correct'
