#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0; p(){ echo "[PASS] $1"; }; f(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }
kubectl -n kube-system wait --for=condition=Ready pod -l component=kube-controller-manager --timeout=20s >/dev/null 2>&1 && p "controller-manager healthy" || f "controller-manager healthy"
ready="$(kubectl -n cka-cc-q002 get deploy web -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$ready" == 3 ]] && p "web has 3 Ready replicas" || f "web has 3 Ready replicas (current $ready)"
exit "$FAIL"
