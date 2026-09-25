# Question

Worker node `k8slab-node01` is reporting `NotReady`.

Investigate the node and restore it to a healthy `Ready` state.

## Requirements

- `k8slab-node01` must return to `Ready`.
- The kubelet service must be healthy.
- Do not delete or recreate the Node object.
- Do not reset or rejoin the node to the cluster.
- Do not modify the other Kubernetes nodes.
- Preserve the existing cluster configuration except for the change required to repair the fault.

SSH user for worker nodes: `ubuntu`

**Target time:** 8 minutes
