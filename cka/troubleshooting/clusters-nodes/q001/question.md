# Question

Worker node `k8slab-node01` is currently reporting `NotReady`.

Investigate the node and restore it to a healthy `Ready` state.

## Requirements

- `k8slab-node01` must return to `Ready`.
- Do not delete or recreate the Node object.
- Do not reset or rejoin the node to the cluster.
- Do not make changes to the other Kubernetes nodes.
- Preserve the existing workloads and cluster configuration.

SSH user for worker nodes: `ubuntu`

**Target time:** 5 minutes
