#!/usr/bin/env bash
kubectl delete ns cka-net-q013 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
