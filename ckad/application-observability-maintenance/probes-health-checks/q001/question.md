# Question

A Deployment named `web-app` exists in namespace `ckad-q001`.

The application containers are running, but the Pods are not becoming Ready.

Investigate the issue and correct the configuration.

## Requirements

- Keep the existing Deployment.
- All 3 replicas must become Ready.
- Do not change the container image.
- Preserve the existing `app=web-app` label.
- Do not remove the readiness probe.

**Target time:** 5 minutes
