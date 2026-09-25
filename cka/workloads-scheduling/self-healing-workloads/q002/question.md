# Question

Deployment `slow-app` in namespace `cka-ws-q008` needs about 20 seconds to finish
startup. Its liveness check begins too early and prevents successful startup.

Add an appropriate startup probe while keeping the existing liveness probe.

## Requirements

- Add an `exec` startup probe that checks for `/tmp/started`.
- Startup probe must allow at least 30 seconds before failure.
- Keep the liveness probe.
- Deployment must become Ready.

**Target time:** 8 minutes
