# Question

Worker node `k8slab-node02` is reporting `NotReady`.

Investigate the node and restore it to a healthy `Ready` state.

## Requirements

- `k8slab-node02` must return to `Ready`.
- The container runtime must be healthy.
- The kubelet must remain operational.
- Do not delete or recreate the Node object.
- Do not reset or rejoin the node to the cluster.
- Do not modify the other Kubernetes nodes.
- Preserve the existing workloads and cluster configuration.

SSH user for worker nodes: `ubuntu`

**Target time:** 7 minutes
