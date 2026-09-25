#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete ns cka-net-q008 --ignore-not-found --wait=true >/dev/null
kubectl delete gatewayclass kpl-example --ignore-not-found >/dev/null
echo "[PASS] Scenario removed"
