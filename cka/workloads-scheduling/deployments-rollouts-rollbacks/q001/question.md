# Question

Deployment `web` in namespace `cka-ws-q001` was recently updated and the rollout
is failing.

Restore the last working revision.

## Requirements

- Use Deployment rollout history/rollback.
- Final image must be `nginx:1.27-alpine`.
- Keep 3 replicas.
- All replicas must be Ready.

**Target time:** 6 minutes
