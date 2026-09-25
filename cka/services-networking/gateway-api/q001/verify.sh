#!/usr/bin/env bash
set -Eeuo pipefail
R="kubectl -n cka-net-q008 get httproute web-route"
name="$($R -o jsonpath='{.spec.rules[0].backendRefs[0].name}')"
port="$($R -o jsonpath='{.spec.rules[0].backendRefs[0].port}')"
path="$($R -o jsonpath='{.spec.rules[0].matches[0].path.value}')"
[[ "$name" == web && "$port" == 80 && "$path" == /app ]] || exit 1
echo "[PASS] HTTPRoute backend and match correct"
