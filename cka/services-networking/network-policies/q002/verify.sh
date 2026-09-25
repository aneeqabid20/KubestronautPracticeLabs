#!/usr/bin/env bash
set -Eeuo pipefail
ip="$(kubectl -n cka-net-api get svc api -o jsonpath='{.spec.clusterIP}')"
kubectl -n cka-net-blue exec blue-client -- wget -q -T 4 -O- "http://$ip" >/dev/null || { echo "[FAIL] blue-client blocked"; exit 1; }
if kubectl -n cka-net-red exec red-client -- wget -q -T 2 -O- "http://$ip" >/dev/null 2>&1; then echo "[FAIL] red-client allowed"; exit 1; fi
kubectl -n cka-net-api get netpol default-deny >/dev/null || exit 1
echo "[PASS] Namespace+Pod selector combination enforced"
