#!/usr/bin/env bash
set -Eeuo pipefail
old="$(sudo cat /var/tmp/kpl-ca-q008-serial)"
new="$(sudo awk '/client-certificate-data:/{print $2; exit}' /etc/kubernetes/admin.conf | base64 -d | openssl x509 -noout -serial | cut -d= -f2)"
[[ -n "$old" && -n "$new" && "$old" != "$new" ]] || { echo "[FAIL] admin.conf certificate was not renewed"; exit 1; }
echo "[PASS] admin.conf client certificate renewed"
