#!/usr/bin/env bash
kubectl delete ns cka-ca-q011 --ignore-not-found --wait=true >/dev/null
rm -rf /tmp/cka-ca-q011
echo "[PASS] Scenario removed"
