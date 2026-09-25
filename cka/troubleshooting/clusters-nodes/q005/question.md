# Question

Worker node `k8slab-node01` is reporting `NotReady`.

The kubelet process on the worker may appear to be running, but the node is not
successfully maintaining communication with the Kubernetes control plane.

Investigate and restore normal node operation.

## Requirements

- `k8slab-node01` must return to `Ready`.
- kubelet must remain managed by its existing systemd service.
- Restore correct kubelet communication with the existing API server.
- Do not reset or rejoin the node.
- Do not regenerate cluster certificates.
- Do not modify the other Kubernetes nodes.

SSH user for worker nodes: `ubuntu`

**Target time:** 10 minutes
