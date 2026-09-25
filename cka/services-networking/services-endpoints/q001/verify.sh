#!/usr/bin/env bash
set -Eeuo pipefail
sel="$(kubectl -n cka-net-q005 get svc web -o jsonpath='{.spec.selector.app}')"
ep="$(kubectl -n cka-net-q005 get endpointslice -l kubernetes.io/service-name=web -o jsonpath='{.items[0].endpoints[0].addresses[0]}' 2>/dev/null || true)"
[[ "$sel" == web && -n "$ep" ]] || exit 1
echo "[PASS] ClusterIP Service selector/endpoints correct"
