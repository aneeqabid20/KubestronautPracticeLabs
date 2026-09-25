#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0; p(){ echo "[PASS] $1"; }; f(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }
kubectl --request-timeout=5s get --raw=/readyz >/dev/null 2>&1 && p "API readyz succeeds" || f "API readyz succeeds"
kubectl -n kube-system wait --for=condition=Ready pod -l component=etcd --timeout=20s >/dev/null 2>&1 && p "etcd Ready" || f "etcd Ready"
kubectl -n kube-system wait --for=condition=Ready pod -l component=kube-apiserver --timeout=20s >/dev/null 2>&1 && p "kube-apiserver Ready" || f "kube-apiserver Ready"
exit "$FAIL"
