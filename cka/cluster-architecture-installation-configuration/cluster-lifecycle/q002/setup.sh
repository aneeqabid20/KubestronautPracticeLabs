#!/usr/bin/env bash
set -Eeuo pipefail
B=/var/tmp/kpl-ca-q008-admin.conf.bak; S=/var/tmp/kpl-ca-q008-serial
sudo cp -a /etc/kubernetes/admin.conf "$B"
sudo awk '/client-certificate-data:/{print $2; exit}' /etc/kubernetes/admin.conf | base64 -d | openssl x509 -noout -serial | cut -d= -f2 | sudo tee "$S" >/dev/null
echo "[PASS] Baseline admin.conf backed up"
