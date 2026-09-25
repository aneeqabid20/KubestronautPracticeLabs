#!/usr/bin/env bash
set -Eeuo pipefail
rm -rf /tmp/cka-ca-q011
cp -a resources/project /tmp/cka-ca-q011
kubectl create ns cka-ca-q011 >/dev/null
kubectl apply -k /tmp/cka-ca-q011/overlays/prod >/dev/null
kubectl -n cka-ca-q011 rollout status deploy/web --timeout=60s >/dev/null
echo "[PASS] Kustomize challenge prepared"
