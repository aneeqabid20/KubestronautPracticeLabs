#!/usr/bin/env bash
set -Eeuo pipefail

PASS=0
WARN=0
FAIL=0

ok(){ printf '[PASS] %s\n' "$1"; PASS=$((PASS+1)); }
warn(){ printf '[WARN] %s\n' "$1"; WARN=$((WARN+1)); }
fail(){ printf '[FAIL] %s\n' "$1"; FAIL=$((FAIL+1)); }

for c in bash kubectl ssh sudo python3 grep awk sed; do
  command -v "$c" >/dev/null 2>&1 && ok "$c available" || fail "$c missing"
done

for c in kubeadm crictl openssl; do
  command -v "$c" >/dev/null 2>&1 && ok "$c available" || warn "$c missing; some CKA labs require it"
done

command -v helm >/dev/null 2>&1 && ok "helm available" || warn "helm missing; Helm topic q001 requires it"

if kubectl version --request-timeout=5s >/dev/null 2>&1; then
  ok "Kubernetes API reachable"
else
  fail "Kubernetes API not reachable"
fi

for n in k8slab-controller.k8slab.local k8slab-node01 k8slab-node02; do
  kubectl get node "$n" >/dev/null 2>&1 && ok "node $n exists" || fail "node $n missing"
done

if [[ -f /etc/kubernetes/manifests/kube-apiserver.yaml ]]; then
  ok "running on kubeadm control-plane filesystem"
else
  warn "/etc/kubernetes/manifests/kube-apiserver.yaml not found; control-plane component labs must run on the controller"
fi

if [[ -f lib/node.sh ]]; then
  # shellcheck disable=SC1091
  source lib/common.sh
  # shellcheck disable=SC1091
  source lib/node.sh
  for n in node01 node02; do
    if node_exec "$n" "sudo -n true" >/dev/null 2>&1; then
      ok "passwordless administrative SSH to $n"
    else
      fail "passwordless administrative SSH to $n unavailable"
    fi
  done
else
  warn "lib/node.sh not found in current directory; run from repository root"
fi

printf '\nPASS=%d WARN=%d FAIL=%d\n' "$PASS" "$WARN" "$FAIL"
[[ "$FAIL" -eq 0 ]]
