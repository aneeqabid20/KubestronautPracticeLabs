# Question

Deployment `memory-app` in namespace `cka-ws-q011` has no Pods because namespace
admission policy rejects the Pod template.

Keep the existing LimitRange and repair the Deployment.

## Requirements

- Keep LimitRange `memory-policy`.
- Container memory limit must be `128Mi`.
- Container memory request must be `64Mi`.
- Deployment must have 1 Ready replica.

**Target time:** 7 minutes
