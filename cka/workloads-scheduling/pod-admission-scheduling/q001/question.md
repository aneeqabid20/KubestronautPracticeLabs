# Question

Pod `affinity-app` in namespace `cka-ws-q009` remains Pending because its required
node affinity cannot be satisfied.

Update the affinity so it schedules specifically to `k8slab-node01`.

## Requirements

- Use required node affinity; do not use `spec.nodeName`.
- Match the standard hostname label.
- Pod must run on `k8slab-node01`.

**Target time:** 7 minutes
