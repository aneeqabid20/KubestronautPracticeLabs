#!/usr/bin/env bash
set -Eeuo pipefail
F=/etc/crictl.yaml; B=/var/tmp/kpl-ca-q012-crictl.bak; M=/var/tmp/kpl-ca-q012-marker
if sudo test -f "$F"; then sudo cp -a "$F" "$B"; echo existed | sudo tee "$M" >/dev/null; else echo absent | sudo tee "$M" >/dev/null; fi
cat <<'EOF' | sudo tee "$F" >/dev/null
runtime-endpoint: unix:///run/containerd/broken.sock
image-endpoint: unix:///run/containerd/broken.sock
timeout: 2
debug: false
EOF
if sudo crictl info >/dev/null 2>&1; then echo "[FAIL] expected CRI failure"; exit 1; fi
echo "[PASS] Challenge starting state validated"
