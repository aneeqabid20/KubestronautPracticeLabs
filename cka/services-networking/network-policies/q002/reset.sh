#!/usr/bin/env bash
set -Eeuo pipefail
for n in cka-net-api cka-net-blue cka-net-red; do kubectl delete ns "$n" --ignore-not-found --wait=true >/dev/null; done
echo "[PASS] Scenario removed"
