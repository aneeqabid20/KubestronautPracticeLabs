#!/usr/bin/env bash
set -Eeuo pipefail
B=/var/tmp/kpl-net-q012-Corefile.bak
kubectl -n kube-system get cm coredns -o jsonpath='{.data.Corefile}' | sudo tee "$B" >/dev/null
grep -q 'kubernetes cluster.local' "$B" || { echo "[FAIL] unexpected CoreDNS baseline"; exit 1; }
sed 's/kubernetes cluster\.local/kubernetes cluster.invalid/' "$B" >/tmp/kpl-net-q012-Corefile
kubectl -n kube-system create configmap coredns --from-file=Corefile=/tmp/kpl-net-q012-Corefile --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n kube-system rollout restart deployment/coredns >/dev/null
kubectl -n kube-system rollout status deployment/coredns --timeout=90s >/dev/null
kubectl create ns cka-net-q012 >/dev/null
kubectl -n cka-net-q012 run dns-test --image=busybox:1.36.1 --command -- sh -c 'sleep 3600' >/dev/null
kubectl -n cka-net-q012 wait --for=condition=Ready pod/dns-test --timeout=60s >/dev/null
if kubectl -n cka-net-q012 exec dns-test -- nslookup kubernetes.default.svc.cluster.local >/dev/null 2>&1; then echo "[FAIL] expected DNS failure"; exit 1; fi
echo "[PASS] CoreDNS failure state validated"
