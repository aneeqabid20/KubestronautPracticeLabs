#!/usr/bin/env bash
set -Eeuo pipefail
port="$(kubectl -n cka-net-q006 get svc web -o jsonpath='{.spec.ports[0].port}')"
target="$(kubectl -n cka-net-q006 get svc web -o jsonpath='{.spec.ports[0].targetPort}')"
[[ "$port" == 8080 && "$target" == 80 ]] || exit 1
kubectl -n cka-net-q006 exec client -- wget -q -T 4 -O- http://web:8080 >/dev/null || exit 1
echo "[PASS] ClusterIP service port mapping works"
