#!/usr/bin/env bash
set -Eeuo pipefail
R="kubectl -n cka-net-q009 get httproute split"
n1="$($R -o jsonpath='{.spec.rules[0].backendRefs[0].name}')"; w1="$($R -o jsonpath='{.spec.rules[0].backendRefs[0].weight}')"; p1="$($R -o jsonpath='{.spec.rules[0].backendRefs[0].port}')"
n2="$($R -o jsonpath='{.spec.rules[0].backendRefs[1].name}')"; w2="$($R -o jsonpath='{.spec.rules[0].backendRefs[1].weight}')"; p2="$($R -o jsonpath='{.spec.rules[0].backendRefs[1].port}')"
[[ "$n1:$w1:$p1" == v1:80:80 && "$n2:$w2:$p2" == v2:20:80 ]] || { echo "[FAIL] weights/backends incorrect"; exit 1; }
echo "[PASS] HTTPRoute weighted backends are 80/20"
