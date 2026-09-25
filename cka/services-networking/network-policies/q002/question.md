# Question

API Pods in namespace `cka-net-api` are protected by default-deny ingress.

Allow access on TCP/80 only from Pods labeled `role=frontend` that are also in
namespaces labeled `team=blue`.

## Requirements

- `blue-client` in namespace `cka-net-blue` must reach the API.
- `red-client` in namespace `cka-net-red` must remain blocked, even though it also
  has label `role=frontend`.
- Preserve default-deny.
- Do not change Pod or namespace labels.

**Target time:** 10 minutes
