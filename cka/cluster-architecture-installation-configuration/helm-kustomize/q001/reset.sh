#!/usr/bin/env bash
set -Eeuo pipefail
command -v helm >/dev/null && helm uninstall web -n cka-ca-q010 >/dev/null 2>&1 || true
kubectl delete ns cka-ca-q010 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
