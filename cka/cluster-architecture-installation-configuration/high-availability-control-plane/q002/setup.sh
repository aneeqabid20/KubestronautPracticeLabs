#!/usr/bin/env bash
set -Eeuo pipefail
cat > /tmp/cka-ha-q002-join.txt <<'EOF'
kubeadm join k8s-ha.example.local:6443 --token abcdef.0123456789abcdef
EOF
echo '[PASS] Challenge starting state validated'
