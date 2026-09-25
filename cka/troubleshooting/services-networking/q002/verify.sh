#!/usr/bin/env bash
set -Eeuo pipefail
tp="$(kubectl -n cka-tr-q010 get svc web -o jsonpath='{.spec.ports[0].targetPort}')"
[[ "$tp" == 80 ]] || { echo "[FAIL] targetPort 80"; exit 1; }
kubectl -n cka-tr-q010 exec tester -- wget -q -T 4 -O- http://web >/dev/null || { echo "[FAIL] Service not reachable"; exit 1; }
echo "[PASS] targetPort 80"
echo "[PASS] web reachable through Service"
