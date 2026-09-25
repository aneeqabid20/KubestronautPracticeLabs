#!/usr/bin/env bash
kubectl delete ns cka-tr-q010 --ignore-not-found --wait=true >/dev/null
echo "[PASS] Scenario removed"
