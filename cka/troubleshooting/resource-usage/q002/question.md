# Question

Deployment `api` in namespace `cka-tr-q006` exists, but no application Pods are
successfully created. The namespace has a ResourceQuota.

Investigate the admission events and configure the workload correctly.

## Requirements

Each container must use:
- requests: `100m` CPU, `64Mi` memory
- limits: `500m` CPU, `128Mi` memory

Deployment `api` must have 2 Ready replicas.

**Target time:** 7 minutes
