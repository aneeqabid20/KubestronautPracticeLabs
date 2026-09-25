#!/usr/bin/env bash
set -Eeuo pipefail
F=/etc/crictl.yaml
B=/var/tmp/kpl-ca-q012-crictl.bak
M=/var/tmp/kpl-ca-q012-marker

if sudo test -f "$M"; then
  if grep -qx existed "$M" && sudo test -f "$B"; then
    sudo cp -a "$B" "$F"
  else
    sudo rm -f "$F"
  fi
fi

sudo rm -f "$B" "$M"
echo "[PASS] Original crictl configuration restored"
