#!/usr/bin/env bash
set -Eeuo pipefail

NS="ckad-q001"
DEPLOY="web-app"
FAIL=0

pass() { printf '[PASS] %s\n' "$1"; }
fail() { printf '[FAIL] %s\n' "$1"; FAIL=$((FAIL + 1)); }

if kubectl get namespace "$NS" >/dev/null 2>&1; then
  pass "Namespace exists"
else
  fail "Namespace exists"
  exit 1
fi

if kubectl -n "$NS" get deployment "$DEPLOY" >/dev/null 2>&1; then
  pass "Deployment web-app exists"
else
  fail "Deployment web-app exists"
  exit 1
fi

replicas="$(kubectl -n "$NS" get deploy "$DEPLOY" -o jsonpath='{.spec.replicas}')"
[[ "$replicas" == "3" ]] && pass "Desired replicas = 3" || fail "Desired replicas = 3"

ready="$(kubectl -n "$NS" get deploy "$DEPLOY" -o jsonpath='{.status.readyReplicas}')"
ready="${ready:-0}"
[[ "$ready" == "3" ]] && pass "All 3 replicas are Ready" || fail "All 3 replicas are Ready (current: $ready)"

image="$(kubectl -n "$NS" get deploy "$DEPLOY" -o jsonpath='{.spec.template.spec.containers[?(@.name=="nginx")].image}')"
[[ "$image" == "nginx:1.27-alpine" ]] && pass "Container image preserved" || fail "Container image preserved"

label="$(kubectl -n "$NS" get deploy "$DEPLOY" -o jsonpath='{.spec.template.metadata.labels.app}')"
[[ "$label" == "web-app" ]] && pass "app=web-app label preserved" || fail "app=web-app label preserved"

probe_path="$(kubectl -n "$NS" get deploy "$DEPLOY" -o jsonpath='{.spec.template.spec.containers[?(@.name=="nginx")].readinessProbe.httpGet.path}')"
[[ -n "$probe_path" ]] && pass "Readiness probe still configured" || fail "Readiness probe still configured"

exit "$FAIL"
