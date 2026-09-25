# Question

HTTPRoute `web-route` in namespace `cka-net-q008` sends `/app` traffic to the
wrong backend Service port.

Repair the route.

## Requirements

- Keep Gateway `web-gw` and Service `web`.
- Keep PathPrefix `/app`.
- BackendRef must be Service `web` port `80`.
- Do not change GatewayClass.

This lab validates Gateway API object configuration; no data-plane controller is required.

**Target time:** 8 minutes
