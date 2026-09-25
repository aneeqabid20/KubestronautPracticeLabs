# Question

Deployment `api` in namespace `cka-ws-q002` is configured with the wrong update
strategy.

Configure it for a rolling update that keeps all desired replicas available
during updates and allows one extra Pod.

## Requirements

- Keep replicas at `4`.
- Strategy must be `RollingUpdate`.
- `maxUnavailable: 0`.
- `maxSurge: 1`.
- All 4 replicas must be Ready.

**Target time:** 6 minutes
