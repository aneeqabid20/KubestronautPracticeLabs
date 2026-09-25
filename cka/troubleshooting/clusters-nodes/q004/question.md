# Question

Worker node `k8slab-node02` is reporting `NotReady`.

Investigate the failure and restore the node to `Ready`.

## Requirements

- `k8slab-node02` must return to `Ready`.
- kubelet must start normally through its existing systemd unit.
- Do not reset or rejoin the node.
- Do not replace the kubelet binary.
- Do not modify the other Kubernetes nodes.
- Preserve the existing cluster configuration except for the change required to repair the fault.

SSH user for worker nodes: `ubuntu`

**Target time:** 8 minutes
