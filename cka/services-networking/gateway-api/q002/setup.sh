#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../.." && pwd)"
source "$ROOT_DIR/lib/common.sh"; source "$ROOT_DIR/lib/kubernetes.sh"; source "$ROOT_DIR/lib/dependencies.sh"
ensure_gateway_api_crds
kubectl delete gatewayclass kpl-example --ignore-not-found >/dev/null 2>&1 || true
kubectl create ns cka-net-q009 >/dev/null
kubectl apply -f resources/start.yaml >/dev/null
echo "[PASS] Gateway weight challenge prepared"
