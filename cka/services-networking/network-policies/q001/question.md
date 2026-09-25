# Question

Namespace `cka-net-q003` has default-deny ingress. Allow only Pods labeled
`role=client` to reach Pods labeled `app=api` on TCP port 80.

## Requirements

- Preserve `default-deny`.
- Pod `allowed` must reach Service `api`.
- Pod `denied` must remain blocked.
- Restrict the allow rule to TCP/80.

**Target time:** 8 minutes
