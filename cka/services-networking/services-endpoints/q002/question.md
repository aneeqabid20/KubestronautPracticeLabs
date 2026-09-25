# Question

Service `web` in namespace `cka-net-q006` has ready endpoints, but application
traffic through the ClusterIP fails.

Repair the port mapping.

## Requirements

- Service port must remain `8080`.
- Target port must be nginx port `80`.
- `client` must retrieve `http://web:8080`.

**Target time:** 6 minutes
