# Question

Worker `k8slab-node02` has IPv4 forwarding disabled.

Enable IPv4 forwarding immediately and make the setting persistent.

## Requirements

- Runtime value `net.ipv4.ip_forward` must be `1`.
- Persist the setting in `/etc/sysctl.d/99-kpl-kubernetes.conf`.
- Do not reboot the node.

**Target time:** 6 minutes
