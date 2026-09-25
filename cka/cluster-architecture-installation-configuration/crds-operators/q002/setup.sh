#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete crd widgets.kpl.example --ignore-not-found >/dev/null 2>&1 || true
kubectl create ns cka-ca-q015 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
U=system:serviceaccount:cka-ca-q015:widget-operator
[[ "$(kubectl auth can-i list widgets.kpl.example --as="$U" -A)" == no ]] || exit 1
echo "[PASS] Operator RBAC failure validated"
