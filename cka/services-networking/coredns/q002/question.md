# Question

Pod `client` in namespace `cka-net-q013` cannot resolve Service `backend`, while
other cluster Pods can.

Repair only the client Pod's DNS policy.

## Requirements

- Keep the backend Deployment and Service unchanged.
- Client must use `dnsPolicy: ClusterFirst`.
- Client must resolve `backend` and reach `http://backend`.

**Target time:** 6 minutes
