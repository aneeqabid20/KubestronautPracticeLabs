# Question

Deployment `api` in namespace `cka-ws-q006` is targeted by CPU-based HPA `api`,
but the workload is missing a required configuration for CPU utilization scaling.

Configure the Deployment containers with:
- CPU request `100m`
- CPU limit `500m`

Keep HPA target utilization at `70%`.

**Target time:** 6 minutes
