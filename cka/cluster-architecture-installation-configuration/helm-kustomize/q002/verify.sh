#!/usr/bin/env bash
set -Eeuo pipefail
D="kubectl -n cka-ca-q011 get deploy web"
rep="$($D -o jsonpath='{.spec.replicas}')"; img="$($D -o jsonpath='{.spec.template.spec.containers[0].image}')"; ready="$($D -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
grep -Eq 'count:[[:space:]]*3' /tmp/cka-ca-q011/overlays/prod/kustomization.yaml || exit 1
grep -Eq 'newTag:[[:space:]]*1.27-alpine' /tmp/cka-ca-q011/overlays/prod/kustomization.yaml || exit 1
[[ "$rep" == 3 && "$img" == nginx:1.27-alpine && "$ready" == 3 ]] || exit 1
echo "[PASS] Prod overlay and deployed state correct"
