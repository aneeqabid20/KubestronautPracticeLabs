#!/usr/bin/env bash
kubectl delete ns cka-ws-q001 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
