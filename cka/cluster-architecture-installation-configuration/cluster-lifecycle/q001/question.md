# Question

Prepare `k8slab-node02` for maintenance.

## Requirements

- Safely drain `k8slab-node02`.
- Ignore DaemonSet-managed Pods.
- Allow deletion of Pods using `emptyDir` if required.
- Leave node02 cordoned (`SchedulingDisabled`).
- Deployment `maintenance-app` in namespace `cka-ca-q007` must retain 3 Ready replicas.
- No `maintenance-app` Pod may remain on node02.

Do not uncordon the node.

**Target time:** 8 minutes
