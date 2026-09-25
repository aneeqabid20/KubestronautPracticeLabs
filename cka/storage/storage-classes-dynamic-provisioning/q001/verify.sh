#!/usr/bin/env bash
set -Eeuo pipefail
FAIL=0
pass(){ printf '[PASS] %s\n' "$1"; }
fail(){ printf '[FAIL] %s\n' "$1"; FAIL=$((FAIL+1)); }

ann="$(kubectl get sc kpl-local-path -o jsonpath='{.metadata.annotations.storageclass\.kubernetes\.io/is-default-class}' 2>/dev/null || true)"
[[ "$ann" == "true" ]] && pass "kpl-local-path is default" || fail "kpl-local-path is default"

phase="$(kubectl -n cka-storage-q001 get pvc web-data -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$phase" == "Bound" ]] && pass "PVC web-data is Bound" || fail "PVC web-data is Bound (current: ${phase:-missing})"

kubectl -n cka-storage-q001 wait --for=condition=Ready pod/web --timeout=20s >/dev/null 2>&1 \
  && pass "Pod web is Ready" || fail "Pod web is Ready"
exit "$FAIL"
