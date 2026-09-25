#!/usr/bin/env bash
set -Eeuo pipefail
command -v openssl >/dev/null || { echo "[FAIL] openssl required"; exit 1; }
kubectl delete ingressclass kpl-nginx-tls --ignore-not-found >/dev/null 2>&1 || true
rm -rf /tmp/cka-net-q011; mkdir -p /tmp/cka-net-q011
openssl req -x509 -nodes -newkey rsa:2048 -keyout /tmp/cka-net-q011/tls.key -out /tmp/cka-net-q011/tls.crt -days 1 -subj '/CN=secure.kpl.local' >/dev/null 2>&1
kubectl create ns cka-net-q011 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
echo "[PASS] TLS challenge prepared"
