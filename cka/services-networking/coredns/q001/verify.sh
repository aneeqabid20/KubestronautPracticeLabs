#!/usr/bin/env bash
set -Eeuo pipefail
core="$(kubectl -n kube-system get cm coredns -o jsonpath='{.data.Corefile}')"
grep -q 'kubernetes cluster.local' <<<"$core" || { echo "[FAIL] Corefile cluster.local"; exit 1; }
kubectl -n kube-system rollout status deployment/coredns --timeout=40s >/dev/null || exit 1
kubectl -n cka-net-q012 exec dns-test -- nslookup kubernetes.default.svc.cluster.local >/dev/null 2>&1 || { echo "[FAIL] DNS lookup"; exit 1; }
echo "[PASS] CoreDNS serves cluster.local and Service DNS resolves"
