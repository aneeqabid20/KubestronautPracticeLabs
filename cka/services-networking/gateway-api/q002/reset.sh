#!/usr/bin/env bash
kubectl delete ns cka-net-q009 --ignore-not-found --wait=true >/dev/null
kubectl delete gatewayclass kpl-example --ignore-not-found >/dev/null
echo "[PASS] Scenario removed"
