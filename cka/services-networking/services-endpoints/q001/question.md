# Question

Service `web` in namespace `cka-net-q005` has no endpoints although Deployment
`web` is Ready.

Fix the Service without changing Pod labels.

## Requirements

- Keep Service type ClusterIP.
- Service selector must match `app=web`.
- EndpointSlice must contain ready endpoints.

**Target time:** 5 minutes
