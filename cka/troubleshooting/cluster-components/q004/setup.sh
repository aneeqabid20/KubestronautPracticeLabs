#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/kubernetes.sh"
M="/etc/kubernetes/manifests/etcd.yaml"; B="/var/tmp/kpl-cka-cc-q004-etcd.yaml.bak"

inject_invalid_arg() {
  local manifest="$1"
  local binary="$2"
  local tmp
  tmp="$(mktemp)"
  sudo -n awk -v b="$binary" '
    {
      print
      if ($0 ~ "^[[:space:]]*- " b "$") {
        match($0, /^[[:space:]]*/)
        indent=substr($0, 1, RLENGTH)
        print indent "- --kpl-invalid-flag=true"
      }
    }
  ' "$manifest" > "$tmp"
  sudo -n cp "$tmp" "$manifest"
  rm -f "$tmp"
}

require_cluster_access
sudo -n true >/dev/null 2>&1 || die "Passwordless sudo required."
[[ -f "$M" ]] || die "etcd static Pod manifest not found."
sudo cp -a "$M" "$B"
inject_invalid_arg "$M" etcd
success "Fault injected"
end=$((SECONDS+120))
while ((SECONDS<end)); do
  if ! kubectl --request-timeout=2s get --raw=/readyz >/dev/null 2>&1; then success "API unavailable due to datastore failure"; success "Challenge starting state validated"; exit 0; fi
  sleep 2
done
sudo cp -a "$B" "$M"; sudo rm -f "$B"
die "Expected control-plane failure did not occur; baseline restored."
