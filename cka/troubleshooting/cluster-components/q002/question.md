# Question

Deployment `web` in namespace `cka-cc-q002` requests three replicas, but its
expected child workload objects are not being created.

Restore normal controller operation.

## Requirements

- `web` must have 3 Ready replicas.
- kube-controller-manager must be healthy.
- Do not manually create ReplicaSets or Pods.
- Do not recreate the cluster.

**Target time:** 8 minutes
