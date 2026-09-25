#!/usr/bin/env bash
set -Eeuo pipefail
D="kubectl -n cka-ws-q008 get deploy slow-app"
cmd="$($D -o jsonpath='{.spec.template.spec.containers[0].startupProbe.exec.command[*]}' 2>/dev/null || true)"
period="$($D -o jsonpath='{.spec.template.spec.containers[0].startupProbe.periodSeconds}' 2>/dev/null || true)"; period="${period:-10}"
fail="$($D -o jsonpath='{.spec.template.spec.containers[0].startupProbe.failureThreshold}' 2>/dev/null || true)"; fail="${fail:-0}"
live="$($D -o jsonpath='{.spec.template.spec.containers[0].livenessProbe.exec.command[*]}' 2>/dev/null || true)"
allow=$((period*fail))
ready="$($D -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
[[ "$cmd" == *"/tmp/started"* && "$live" == *"/tmp/started"* && "$allow" -ge 30 && "$ready" == 1 ]] || { echo "[FAIL] startup/liveness configuration incorrect"; exit 1; }
echo "[PASS] Startup probe allows ${allow}s and workload is Ready"
