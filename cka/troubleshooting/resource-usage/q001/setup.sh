#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-tr-q005 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
sleep 4
ready="$(kubectl -n cka-tr-q005 get deploy processor -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
[[ -z "$ready" || "$ready" == 0 ]] || { echo "[FAIL] expected no Ready replicas"; exit 1; }
echo "[PASS] Challenge starting state validated"
