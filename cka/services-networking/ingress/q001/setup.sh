#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete ingressclass kpl-nginx --ignore-not-found >/dev/null 2>&1 || true
kubectl create ns cka-net-q010 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
echo "[PASS] Ingress challenge prepared"
