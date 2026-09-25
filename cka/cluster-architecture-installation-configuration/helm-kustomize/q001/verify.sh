#!/usr/bin/env bash
set -Eeuo pipefail
helm status web -n cka-ca-q010 >/dev/null 2>&1 || { echo "[FAIL] release web missing"; exit 1; }
ready="$(kubectl -n cka-ca-q010 get deploy web -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
rep="$(kubectl -n cka-ca-q010 get deploy web -o jsonpath='{.spec.replicas}' 2>/dev/null || true)"
port="$(kubectl -n cka-ca-q010 get svc web -o jsonpath='{.spec.ports[0].port}' 2>/dev/null || true)"
[[ "$ready" == 3 && "$rep" == 3 && "$port" == 8080 ]] || { echo "[FAIL] Helm release values/state incorrect"; exit 1; }
echo "[PASS] Helm release installed with required values"
