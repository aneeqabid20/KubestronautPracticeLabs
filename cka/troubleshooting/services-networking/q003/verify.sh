#!/usr/bin/env bash
set -Eeuo pipefail
kubectl -n cka-tr-q011 exec client -- wget -q -T 4 -O- http://api >/dev/null || { echo "[FAIL] client should be allowed"; exit 1; }
if kubectl -n cka-tr-q011 exec blocked -- wget -q -T 2 -O- http://api >/dev/null 2>&1; then echo "[FAIL] blocked Pod should remain denied"; exit 1; fi
kubectl -n cka-tr-q011 get netpol default-deny >/dev/null || { echo "[FAIL] default-deny missing"; exit 1; }
echo "[PASS] client allowed"
echo "[PASS] blocked Pod denied"
echo "[PASS] default-deny preserved"
