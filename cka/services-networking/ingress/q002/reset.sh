#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete ns cka-net-q011 --ignore-not-found --wait=true >/dev/null
kubectl delete ingressclass kpl-nginx-tls --ignore-not-found >/dev/null
rm -rf /tmp/cka-net-q011
echo "[PASS] Scenario removed"
