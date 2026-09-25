# Question

Ingress `web` in namespace `cka-net-q010` references a non-existent backend Service.

Repair the Ingress.

## Requirements

- Keep host `web.kpl.local`.
- Keep path `/`.
- Backend Service must be `web` port `80`.
- Keep `ingressClassName: kpl-nginx`.

This lab validates the Ingress resource and does not require an installed Ingress data plane.

**Target time:** 6 minutes
