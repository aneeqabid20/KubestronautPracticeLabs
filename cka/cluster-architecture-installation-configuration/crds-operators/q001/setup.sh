#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete crd widgets.kpl.example --ignore-not-found >/dev/null 2>&1 || true
kubectl apply -f resources/crd.yaml >/dev/null
kubectl create ns cka-ca-q014 >/dev/null
mkdir -p /tmp/cka-ca-q014
cp resources/invalid-widget.yaml /tmp/cka-ca-q014/widget.yaml
if kubectl apply -f /tmp/cka-ca-q014/widget.yaml >/dev/null 2>&1; then exit 1; fi
echo "[PASS] CRD schema rejection validated"
