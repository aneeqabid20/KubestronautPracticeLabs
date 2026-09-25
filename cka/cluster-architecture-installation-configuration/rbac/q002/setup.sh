#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ca-q002 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
[[ "$(kubectl auth can-i get secrets --as=system:serviceaccount:cka-ca-q002:node-auditor -A)" == yes ]] || exit 1
echo "[PASS] Over-privileged starting state validated"
