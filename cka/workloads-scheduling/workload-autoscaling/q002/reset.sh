#!/usr/bin/env bash
kubectl delete ns cka-ws-q006 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
