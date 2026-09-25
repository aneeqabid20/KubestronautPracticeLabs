# Question

Create a new kubeadm worker join command and save it to:

`/tmp/cka-kubeadm-q001/join.sh`

## Requirements

- Create a new bootstrap token with TTL `1h`.
- `join.sh` must contain a complete `kubeadm join` command for this cluster.
- The file must be executable.
- The token referenced by the command must be active.

Do not join another node.

**Target time:** 7 minutes
