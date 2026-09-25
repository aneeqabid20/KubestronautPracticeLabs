#!/usr/bin/env bash
set -Eeuo pipefail
ip="$(kubectl -n cka-net-q001 get pod server -o jsonpath='{.status.podIP}')"
[[ "$(kubectl -n cka-net-q001 get pod server -o jsonpath='{.spec.nodeName}')" == k8slab-node01 ]] || exit 1
[[ "$(kubectl -n cka-net-q001 get pod client -o jsonpath='{.spec.nodeName}')" == k8slab-node02 ]] || exit 1
kubectl -n cka-net-q001 exec client -- wget -q -T 4 -O- "http://$ip:8080" | grep -q server-ok || { echo "[FAIL] client cannot reach server Pod IP"; exit 1; }
echo "[PASS] Cross-node Pod IP connectivity works on 8080"
