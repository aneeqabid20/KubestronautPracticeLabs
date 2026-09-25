#!/usr/bin/env bash
set -Eeuo pipefail
for n in cka-net-api cka-net-blue cka-net-red; do kubectl create ns "$n" >/dev/null; done
kubectl label ns cka-net-blue team=blue --overwrite >/dev/null
kubectl label ns cka-net-red team=red --overwrite >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
kubectl -n cka-net-api rollout status deploy/api --timeout=60s >/dev/null
kubectl -n cka-net-blue wait --for=condition=Ready pod/blue-client --timeout=60s >/dev/null
kubectl -n cka-net-red wait --for=condition=Ready pod/red-client --timeout=60s >/dev/null
sleep 2
ip="$(kubectl -n cka-net-api get svc api -o jsonpath='{.spec.clusterIP}')"
if kubectl -n cka-net-blue exec blue-client -- wget -q -T 2 -O- "http://$ip" >/dev/null 2>&1; then exit 1; fi
echo "[PASS] Cross-namespace default-deny state validated"
