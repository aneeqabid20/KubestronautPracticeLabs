# Question

The Kubernetes API is unavailable on the control-plane node.

Restore the existing API server and normal `kubectl` access.

## Requirements

- kube-apiserver must become healthy.
- `kubectl get nodes` must work.
- Do not run `kubeadm reset`.
- Do not regenerate PKI or recreate the cluster.

You are already on the control-plane node.

**Target time:** 10 minutes
