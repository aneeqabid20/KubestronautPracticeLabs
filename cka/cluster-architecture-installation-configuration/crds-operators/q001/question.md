# Question

A CRD `widgets.kpl.example` is installed. A Widget manifest at
`/tmp/cka-ca-q014/widget.yaml` is rejected by schema validation.

Correct the custom resource and create it in namespace `cka-ca-q014`.

## Requirements

- Keep CRD schema unchanged.
- Widget name `demo`.
- `spec.size` must be integer `3`.
- The Widget must be successfully stored by the API server.

**Target time:** 7 minutes
