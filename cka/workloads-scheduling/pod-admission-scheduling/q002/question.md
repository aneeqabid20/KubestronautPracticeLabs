# Question

Node `k8slab-node02` is intentionally tainted `dedicated=batch:NoSchedule`.
Pod `batch` in namespace `cka-ws-q010` must run on that node but remains Pending.

Add the required toleration.

## Requirements

- Keep the taint.
- Keep the Pod targeted to `k8slab-node02`.
- Add a toleration for `dedicated=batch:NoSchedule`.
- Pod must become Ready on node02.

**Target time:** 7 minutes
