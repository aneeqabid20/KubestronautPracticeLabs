# Question

Service `web` in namespace `cka-tr-q010` has healthy endpoints, but requests
through the Service fail.

Repair the Service without changing the Deployment.

## Requirements

- Service port remains `80`.
- Service `targetPort` must send traffic to nginx's port `80`.
- EndpointSlice must remain populated.
- A test Pod must be able to retrieve `http://web`.

**Target time:** 6 minutes
