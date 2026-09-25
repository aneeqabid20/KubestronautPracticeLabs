#!/usr/bin/env bash
set -Eeuo pipefail
B=/var/tmp/kpl-ca-q008-admin.conf.bak
if sudo test -f "$B"; then sudo cp -a "$B" /etc/kubernetes/admin.conf; fi
sudo rm -f "$B" /var/tmp/kpl-ca-q008-serial
echo "[PASS] Original admin.conf restored"
