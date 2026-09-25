#!/usr/bin/env bash
set -Eeuo pipefail
S="kubectl -n cka-net-q007 get svc web-nodeport"
[[ "$($S -o jsonpath='{.spec.type}' 2>/dev/null)" == NodePort ]] || exit 1
[[ "$($S -o jsonpath='{.spec.ports[0].port}')" == 80 ]] || exit 1
[[ "$($S -o jsonpath='{.spec.ports[0].targetPort}')" == 80 ]] || exit 1
[[ "$($S -o jsonpath='{.spec.ports[0].nodePort}')" == 30080 ]] || exit 1
[[ "$($S -o jsonpath='{.spec.selector.app}')" == web ]] || exit 1
ip="$(kubectl get node k8slab-node01 -o jsonpath='{.status.addresses[?(@.type=="InternalIP")].address}')"
kubectl -n cka-net-q007 exec client -- wget -q -T 4 -O- "http://$ip:30080" >/dev/null || { echo "[FAIL] NodePort unreachable"; exit 1; }
echo "[PASS] NodePort 30080 exposes web correctly"
