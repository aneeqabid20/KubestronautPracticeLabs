# Question

New Pods scheduled to `k8slab-node02` cannot create their network sandbox.

Investigate the node's CNI configuration and restore Pod networking.

## Requirements

- Repair the existing Cilium CNI configuration; do not reinstall Cilium.
- Pod `net-test` in namespace `cka-ca-q013` must become Ready on node02.
- Keep kubelet and containerd running.

**Target time:** 10 minutes
