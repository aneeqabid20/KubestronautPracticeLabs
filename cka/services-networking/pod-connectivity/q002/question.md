# Question

Host-network Pod `host-client` in namespace `cka-net-q002` cannot resolve the
cluster Service name `backend`.

Configure DNS policy correctly for a host-network Pod.

## Requirements

- Keep `hostNetwork: true`.
- Set the DNS policy appropriate for host-network Pods using cluster DNS.
- `host-client` must resolve and reach `http://backend`.

**Target time:** 7 minutes
