#!/usr/bin/env bash
set -Eeuo pipefail
I="kubectl -n cka-net-q010 get ingress web"
svc="$($I -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.name}')"
port="$($I -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.port.number}')"
host="$($I -o jsonpath='{.spec.rules[0].host}')"; cls="$($I -o jsonpath='{.spec.ingressClassName}')"
[[ "$svc" == web && "$port" == 80 && "$host" == web.kpl.local && "$cls" == kpl-nginx ]] || exit 1
echo "[PASS] Ingress backend/class/host correct"
