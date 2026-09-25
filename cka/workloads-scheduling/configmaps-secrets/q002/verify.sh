#!/usr/bin/env bash
set -Eeuo pipefail
key="$(kubectl -n cka-ws-q004 get pod secret-reader -o jsonpath='{.spec.volumes[?(@.name=="secret")].secret.items[0].key}' 2>/dev/null || true)"
[[ "$key" == password ]] || { echo "[FAIL] secret key mapping"; exit 1; }
kubectl -n cka-ws-q004 wait --for=condition=Ready pod/secret-reader --timeout=20s >/dev/null || exit 1
val="$(kubectl -n cka-ws-q004 exec secret-reader -- cat /etc/secret/credential)"
[[ "$val" == s3cr3t ]] || exit 1
echo "[PASS] Secret key mounted correctly"
