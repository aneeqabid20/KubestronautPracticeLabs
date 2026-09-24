#!/usr/bin/env bash
set -Eeuo pipefail

NS="ckad-q001"
SELECTOR="app=web-app"

kubectl create namespace "$NS" >/dev/null
kubectl apply -f resources/deployment.yaml >/dev/null

printf '[PASS] Namespace created\n'
printf '[PASS] Deployment created\n'

end=$((SECONDS + 60))
while (( SECONDS < end )); do
  pods="$(kubectl -n "$NS" get pods -l "$SELECTOR" --no-headers 2>/dev/null | wc -l)"
  running="$(kubectl -n "$NS" get pods -l "$SELECTOR" \
    -o jsonpath='{range .items[*]}{.status.phase}{"\n"}{end}' 2>/dev/null \
    | grep -c '^Running$' || true)"
  ready="$(kubectl -n "$NS" get deployment web-app \
    -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
  ready="${ready:-0}"

  if [[ "$pods" -eq 3 && "$running" -eq 3 && "$ready" -eq 0 ]]; then
    printf '[PASS] All application containers are Running\n'
    printf '[PASS] Broken readiness state validated (0/3 Ready)\n'
    exit 0
  fi
  sleep 2
done

printf '[FAIL] Scenario did not reach expected starting state\n' >&2
kubectl -n "$NS" get pods -o wide >&2 || true
exit 1
