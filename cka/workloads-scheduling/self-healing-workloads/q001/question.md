# Question

Deployment `web` in namespace `cka-ws-q007` continuously restarts otherwise healthy
nginx containers.

Repair the health check.

## Requirements

- Keep the liveness probe.
- Probe nginx over HTTP port 80 using path `/`.
- Deployment must have 2 Ready replicas.
- Do not change the image.

**Target time:** 5 minutes
