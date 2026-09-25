#!/usr/bin/env bash
set -Eeuo pipefail
U="system:serviceaccount:cka-ca-q002:node-auditor"
for v in get list watch; do [[ "$(kubectl auth can-i "$v" nodes --as="$U")" == yes ]] || exit 1; done
for v in get list watch; do [[ "$(kubectl auth can-i "$v" secrets --as="$U" -A)" == no ]] || exit 1; done
[[ "$(kubectl auth can-i create nodes --as="$U")" == no ]] || exit 1
echo "[PASS] node-auditor has least-privilege node read access"
