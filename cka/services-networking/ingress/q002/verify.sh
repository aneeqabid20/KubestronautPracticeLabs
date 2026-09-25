#!/usr/bin/env bash
set -Eeuo pipefail
type="$(kubectl -n cka-net-q011 get secret web-tls -o jsonpath='{.type}' 2>/dev/null || true)"
host="$(kubectl -n cka-net-q011 get ingress secure-web -o jsonpath='{.spec.tls[0].hosts[0]}' 2>/dev/null || true)"
sec="$(kubectl -n cka-net-q011 get ingress secure-web -o jsonpath='{.spec.tls[0].secretName}' 2>/dev/null || true)"
backend="$(kubectl -n cka-net-q011 get ingress secure-web -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.name}:{.spec.rules[0].http.paths[0].backend.service.port.number}')"
[[ "$type" == kubernetes.io/tls && "$host" == secure.kpl.local && "$sec" == web-tls && "$backend" == web:80 ]] || exit 1
echo "[PASS] TLS Secret and Ingress TLS configuration correct"
