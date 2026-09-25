#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0
pass(){ echo "[PASS] $1"; }
fail(){ echo "[FAIL] $1"; FAIL=$((FAIL+1)); }

prov="$(kubectl get sc fast-local -o jsonpath='{.provisioner}' 2>/dev/null || true)"
[[ "$prov" == "rancher.io/local-path" ]] && pass "fast-local uses rancher.io/local-path" || fail "fast-local provisioner is correct"

mode="$(kubectl get sc fast-local -o jsonpath='{.volumeBindingMode}' 2>/dev/null || true)"
[[ "$mode" == "WaitForFirstConsumer" ]] && pass "fast-local uses WaitForFirstConsumer" || fail "fast-local volumeBindingMode"

phase="$(kubectl -n cka-storage-q002 get pvc cache -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$phase" == "Bound" ]] && pass "PVC cache is Bound" || fail "PVC cache is Bound"

kubectl -n cka-storage-q002 wait --for=condition=Ready pod/cache-user --timeout=20s >/dev/null 2>&1 \
  && pass "cache-user is Ready" || fail "cache-user is Ready"
exit "$FAIL"
