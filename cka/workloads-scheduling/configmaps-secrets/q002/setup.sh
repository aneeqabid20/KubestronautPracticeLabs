#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q004 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 4
phase="$(kubectl -n cka-ws-q004 get pod secret-reader -o jsonpath='{.status.phase}' 2>/dev/null || true)"
[[ "$phase" != Running ]] || { echo "[FAIL] expected mount failure"; exit 1; }
echo "[PASS] Challenge starting state validated"
