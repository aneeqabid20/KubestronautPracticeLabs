# Question

HTTPRoute `split` in namespace `cka-net-q009` distributes traffic equally between
Services `v1` and `v2`.

Change the weighted backend configuration to 80% `v1` and 20% `v2`.

## Requirements

- Keep both backendRefs.
- `v1` weight: `80`.
- `v2` weight: `20`.
- Both backend ports remain `80`.

This lab validates Gateway API configuration; no data-plane controller is required.

**Target time:** 8 minutes
