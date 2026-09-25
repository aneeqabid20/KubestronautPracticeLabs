#!/usr/bin/env bash
set -Eeuo pipefail
policy="$(kubectl -n cka-net-q002 get pod host-client -o jsonpath='{.spec.dnsPolicy}')"
[[ "$policy" == ClusterFirstWithHostNet ]] || { echo "[FAIL] dnsPolicy"; exit 1; }
kubectl -n cka-net-q002 exec host-client -- nslookup backend >/dev/null 2>&1 || exit 1
kubectl -n cka-net-q002 exec host-client -- wget -q -T 4 -O- http://backend >/dev/null || exit 1
echo "[PASS] hostNetwork Pod uses cluster DNS and reaches backend"
