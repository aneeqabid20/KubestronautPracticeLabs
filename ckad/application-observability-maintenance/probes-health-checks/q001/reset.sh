#!/usr/bin/env bash
set -Eeuo pipefail

NS="ckad-q001"

if kubectl get namespace "$NS" >/dev/null 2>&1; then
  kubectl delete namespace "$NS" --wait=true --timeout=90s >/dev/null
  printf '[PASS] Namespace %s removed\n' "$NS"
else
  printf '[PASS] Namespace %s already absent\n' "$NS"
fi
