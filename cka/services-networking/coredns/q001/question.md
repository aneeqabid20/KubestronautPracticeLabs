# Question

Cluster DNS no longer resolves standard Kubernetes Service names.

Restore CoreDNS for cluster domain `cluster.local`.

## Requirements

- Preserve the existing CoreDNS deployment.
- CoreDNS Corefile must serve `cluster.local`.
- Pod `dns-test` in namespace `cka-net-q012` must resolve
  `kubernetes.default.svc.cluster.local`.
- Do not reinstall CoreDNS.

**Target time:** 10 minutes
