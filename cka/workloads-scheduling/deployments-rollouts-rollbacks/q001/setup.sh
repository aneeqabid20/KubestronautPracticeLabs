#!/usr/bin/env bash
set -Eeuo pipefail
kubectl create ns cka-ws-q001 >/dev/null
kubectl -n cka-ws-q001 create deployment web --image=nginx:1.27-alpine --replicas=3 >/dev/null
kubectl -n cka-ws-q001 rollout status deploy/web --timeout=60s >/dev/null
kubectl -n cka-ws-q001 set image deploy/web nginx=nginx:kpl-does-not-exist >/dev/null

if kubectl -n cka-ws-q001 rollout status deploy/web --timeout=8s >/dev/null 2>&1; then
  echo "[FAIL] Expected the new rollout to stall"
  exit 1
fi

img="$(kubectl -n cka-ws-q001 get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}')"
[[ "$img" == nginx:kpl-does-not-exist ]] || exit 1
echo "[PASS] Failed rollout starting state validated"
