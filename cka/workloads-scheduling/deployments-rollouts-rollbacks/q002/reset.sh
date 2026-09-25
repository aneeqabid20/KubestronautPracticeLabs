#!/usr/bin/env bash
kubectl delete ns cka-ws-q002 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
