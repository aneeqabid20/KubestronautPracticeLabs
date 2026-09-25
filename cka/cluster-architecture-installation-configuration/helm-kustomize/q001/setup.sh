#!/usr/bin/env bash
set -Eeuo pipefail
command -v helm >/dev/null || { echo "[FAIL] helm CLI is required"; exit 1; }
kubectl create ns cka-ca-q010 >/dev/null
helm uninstall web -n cka-ca-q010 >/dev/null 2>&1 || true
echo "[PASS] Helm challenge prepared"
