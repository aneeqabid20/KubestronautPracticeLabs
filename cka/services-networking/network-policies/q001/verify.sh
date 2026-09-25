#!/usr/bin/env bash
set -Eeuo pipefail
kubectl -n cka-net-q003 get netpol default-deny >/dev/null || exit 1
kubectl -n cka-net-q003 exec allowed -- wget -q -T 4 -O- http://api >/dev/null || { echo "[FAIL] allowed cannot connect"; exit 1; }
if kubectl -n cka-net-q003 exec denied -- wget -q -T 2 -O- http://api >/dev/null 2>&1; then echo "[FAIL] denied can connect"; exit 1; fi
echo "[PASS] NetworkPolicy allows only role=client to api:80"
