#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete ns cka-net-q010 --ignore-not-found --wait=true >/dev/null
kubectl delete ingressclass kpl-nginx --ignore-not-found >/dev/null
echo "[PASS] Scenario removed"
