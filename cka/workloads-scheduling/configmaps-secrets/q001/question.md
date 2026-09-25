# Question

Deployment `greeter` in namespace `cka-ws-q003` cannot start its containers.

A ConfigMap named `app-config` already contains the required value.

Repair the Deployment without changing the ConfigMap.

## Requirements

- Environment variable `MESSAGE` must reference key `message`.
- Keep ConfigMap `app-config`.
- Deployment must have 2 Ready replicas.

**Target time:** 5 minutes
