#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ca-q001 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
if kubectl auth can-i get pods --as=system:serviceaccount:cka-ca-q001:auditor -n cka-ca-q001 | grep -qx yes; then exit 1; fi
echo "[PASS] Authorization failure validated"
