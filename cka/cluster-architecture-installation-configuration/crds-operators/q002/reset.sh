#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete clusterrolebinding kpl-widget-operator --ignore-not-found >/dev/null
kubectl delete clusterrole kpl-widget-operator --ignore-not-found >/dev/null
kubectl delete ns cka-ca-q015 --ignore-not-found --wait=true >/dev/null
kubectl delete crd widgets.kpl.example --ignore-not-found >/dev/null
echo "[PASS] Scenario removed"
