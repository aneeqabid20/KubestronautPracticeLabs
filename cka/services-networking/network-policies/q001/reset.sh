#!/usr/bin/env bash
kubectl delete ns cka-net-q003 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
