# Question

Service `web` in namespace `cka-tr-q009` has no usable backend endpoints even
though the `web` Deployment is Ready.

Restore Service discovery without changing Pod labels.

## Requirements

- Keep Service name `web`.
- Keep Pod label `app=web`.
- Service must select the application Pods.
- EndpointSlice for the Service must contain ready endpoints.

**Target time:** 5 minutes
