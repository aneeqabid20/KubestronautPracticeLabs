#!/usr/bin/env bash
set -Eeuo pipefail
sel="$(kubectl -n cka-tr-q009 get svc web -o jsonpath='{.spec.selector.app}' 2>/dev/null)"
ep="$(kubectl -n cka-tr-q009 get endpointslice -l kubernetes.io/service-name=web -o jsonpath='{.items[0].endpoints[0].addresses[0]}' 2>/dev/null || true)"
[[ "$sel" == web && -n "$ep" ]] || { echo "[FAIL] selector/endpoints incorrect"; exit 1; }
echo "[PASS] Service selector matches web"
echo "[PASS] EndpointSlice has an endpoint"
