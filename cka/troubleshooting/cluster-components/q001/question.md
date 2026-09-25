# Question

Pod `workload` in namespace `cka-cc-q001` remains `Pending` and has no assigned node.

Investigate the control plane and restore normal scheduling.

## Requirements

- `workload` must become `Running`.
- The existing kube-scheduler static Pod must be healthy.
- Do not manually set `spec.nodeName`.
- Do not recreate the cluster.

**Target time:** 7 minutes
