#!/usr/bin/env bash
set -Eeuo pipefail
[[ "$(kubectl -n cka-net-q013 get pod client -o jsonpath='{.spec.dnsPolicy}')" == ClusterFirst ]] || exit 1
kubectl -n cka-net-q013 exec client -- nslookup backend >/dev/null 2>&1 || exit 1
kubectl -n cka-net-q013 exec client -- wget -q -T 4 -O- http://backend >/dev/null || exit 1
echo "[PASS] client uses ClusterFirst and resolves backend"
