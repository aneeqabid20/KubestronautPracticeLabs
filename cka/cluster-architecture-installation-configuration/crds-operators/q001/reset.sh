#!/usr/bin/env bash
kubectl delete ns cka-ca-q014 --ignore-not-found --wait=true >/dev/null
kubectl delete crd widgets.kpl.example --ignore-not-found >/dev/null
rm -rf /tmp/cka-ca-q014
echo "[PASS] Scenario removed"
