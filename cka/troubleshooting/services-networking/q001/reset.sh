#!/usr/bin/env bash
kubectl delete ns cka-tr-q009 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
