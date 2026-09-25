# Question

Worker `k8slab-node01` has bridge traffic filtering disabled for IPv4.

Enable the Kubernetes networking prerequisite immediately and persist it.

## Requirements

- `br_netfilter` must be loaded.
- Runtime `net.bridge.bridge-nf-call-iptables` must be `1`.
- Persist the setting in `/etc/sysctl.d/99-kpl-bridge.conf`.

**Target time:** 7 minutes
