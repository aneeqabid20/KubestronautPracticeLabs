#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0; p(){ echo "[PASS] $1"; }; f(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }
kubectl -n kube-system wait --for=condition=Ready pod -l component=kube-scheduler --timeout=20s >/dev/null 2>&1 && p "kube-scheduler healthy" || f "kube-scheduler healthy"
phase="$(kubectl -n cka-cc-q001 get pod workload -o jsonpath='{.status.phase}' 2>/dev/null || true)"
node="$(kubectl -n cka-cc-q001 get pod workload -o jsonpath='{.spec.nodeName}' 2>/dev/null || true)"
[[ "$phase" == Running && -n "$node" ]] && p "workload scheduled and Running" || f "workload scheduled and Running"
exit "$FAIL"
