#!/usr/bin/env bash
set -Eeuo pipefail
H="kubectl -n cka-ws-q005 get hpa web"
min="$($H -o jsonpath='{.spec.minReplicas}')"; max="$($H -o jsonpath='{.spec.maxReplicas}')"; target="$($H -o jsonpath='{.spec.metrics[0].resource.target.averageUtilization}')"
[[ "$min" == 2 && "$max" == 6 && "$target" == 60 ]] || { echo "[FAIL] HPA values incorrect"; exit 1; }
echo "[PASS] HPA min/max/CPU target correct"
