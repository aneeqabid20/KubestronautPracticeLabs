#!/usr/bin/env bash
kubectl delete ns cka-net-q006 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
