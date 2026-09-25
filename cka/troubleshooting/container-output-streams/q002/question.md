# Question

Deployment `observer` in namespace `cka-tr-q008` is Running, but its `sidecar`
container continuously reports backend connection failures.

Use the correct container logs to diagnose and repair it.

## Requirements

- Keep both containers.
- Set sidecar environment variable `BACKEND_PORT=80`.
- Sidecar logs must report `backend reachable`.
- Do not change Service `backend`.

**Target time:** 7 minutes
