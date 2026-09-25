# Question

ServiceAccount `auditor` in namespace `cka-ca-q001` must be able to
`get`, `list`, and `watch` Pods in that namespace, but authorization currently fails.

Repair the existing RoleBinding.

## Requirements

- Keep Role `pod-reader`.
- Keep ServiceAccount `auditor`.
- RoleBinding `auditor-read` must bind `auditor` to `pod-reader`.
- Do not grant write permissions.

**Target time:** 5 minutes
