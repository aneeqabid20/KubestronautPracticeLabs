# Question

Deployment `web` in namespace `cka-net-q007` must be exposed on every node.

Create Service `web-nodeport`.

## Requirements

- Type `NodePort`.
- Service port `80`.
- Target port `80`.
- NodePort exactly `30080`.
- Selector `app=web`.
- Pod `client` must reach node01's InternalIP on port `30080`.

**Target time:** 7 minutes
