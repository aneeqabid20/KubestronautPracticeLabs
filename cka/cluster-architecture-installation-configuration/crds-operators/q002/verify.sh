#!/usr/bin/env bash
set -Eeuo pipefail
U=system:serviceaccount:cka-ca-q015:widget-operator
for v in get list watch; do [[ "$(kubectl auth can-i "$v" widgets.kpl.example --as="$U" -A)" == yes ]] || exit 1; done
[[ "$(kubectl auth can-i delete widgets.kpl.example --as="$U" -A)" == no ]] || exit 1
echo "[PASS] Operator has required watch/read RBAC without delete"
