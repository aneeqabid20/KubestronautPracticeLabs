#!/usr/bin/env bash
set -Eeuo pipefail
kubectl delete namespace cka-storage-q001 --ignore-not-found --wait=true >/dev/null
kubectl annotate sc kpl-local-path \
  storageclass.kubernetes.io/is-default-class- \
  storageclass.beta.kubernetes.io/is-default-class- >/dev/null 2>&1 || true
printf '[PASS] Scenario resources removed\n'
