# Question

ServiceAccount `widget-operator` in namespace `cka-ca-q015` is intended to watch
Widget custom resources cluster-wide, but its ClusterRole references the wrong resource.

Repair RBAC.

## Requirements

ServiceAccount must be allowed to:
- `get`, `list`, `watch` `widgets.kpl.example`

It must not be allowed to delete Widgets.

Keep the existing ServiceAccount and ClusterRoleBinding.

**Target time:** 8 minutes
