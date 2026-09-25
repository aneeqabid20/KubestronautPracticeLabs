# Question

The Kubernetes API is unavailable. Investigate the control plane and restore
normal operation.

## Requirements

- Restore the existing etcd static Pod.
- Restore kube-apiserver availability.
- Do not restore etcd from a snapshot.
- Do not modify/delete the existing etcd data directory.
- Do not recreate the cluster.

**Target time:** 10 minutes
