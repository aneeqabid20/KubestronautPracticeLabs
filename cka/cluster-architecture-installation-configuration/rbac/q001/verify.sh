#!/usr/bin/env bash
set -Eeuo pipefail
for v in get list watch; do
  [[ "$(kubectl auth can-i "$v" pods --as=system:serviceaccount:cka-ca-q001:auditor -n cka-ca-q001)" == yes ]] || { echo "[FAIL] auditor cannot $v pods"; exit 1; }
done
[[ "$(kubectl auth can-i create pods --as=system:serviceaccount:cka-ca-q001:auditor -n cka-ca-q001)" == no ]] || { echo "[FAIL] auditor has write access"; exit 1; }
echo "[PASS] auditor has only required Pod read permissions"
