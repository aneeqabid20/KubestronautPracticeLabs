#!/usr/bin/env bash
kubectl delete ns cka-ws-q004 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
