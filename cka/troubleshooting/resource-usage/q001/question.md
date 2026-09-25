# Question

Deployment `processor` in namespace `cka-tr-q005` has no Ready replicas.

Use Kubernetes scheduling information to identify why its Pods cannot run and
correct the resource configuration.

## Requirements

- Keep 2 replicas.
- Set each container request to `100m` CPU and `64Mi` memory.
- All replicas must become Ready.
- Do not add node selectors or manually bind Pods.

**Target time:** 6 minutes
