# Question

Namespace `cka-tr-q011` has a default-deny ingress policy. Pod `client` cannot
reach Service `api`.

Create an ingress NetworkPolicy that permits only Pods labeled `access=api` to
reach Pods labeled `app=api` on TCP port 80.

## Requirements

- Keep the existing default-deny policy.
- `client` (`access=api`) must reach `api`.
- `blocked` must remain unable to reach `api`.
- Do not remove or weaken the default-deny policy.

**Target time:** 8 minutes
