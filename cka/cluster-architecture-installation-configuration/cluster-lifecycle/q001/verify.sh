#!/usr/bin/env bash
set -Eeuo pipefail
uns="$(kubectl get node k8slab-node02 -o jsonpath='{.spec.unschedulable}' 2>/dev/null || true)"
ready="$(kubectl -n cka-ca-q007 get deploy maintenance-app -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"; ready="${ready:-0}"
count="$(kubectl -n cka-ca-q007 get pods -l app=maintenance-app --field-selector spec.nodeName=k8slab-node02 --no-headers 2>/dev/null | wc -l)"
marker="$(kubectl -n cka-ca-q007 get pod maintenance-scratch --ignore-not-found -o name 2>/dev/null || true)"
[[ "$uns" == true && "$ready" == 3 && "$count" -eq 0 && -z "$marker" ]] || { echo "[FAIL] drain requirements not met"; exit 1; }
echo "[PASS] node02 drained/cordoned and workload remains available"
