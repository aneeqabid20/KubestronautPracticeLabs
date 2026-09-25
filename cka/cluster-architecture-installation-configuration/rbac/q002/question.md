# Question

ClusterRole `kpl-node-reader` grants ServiceAccount `node-auditor` the required
read-only access to Nodes, but also grants unnecessary access to Secrets.

Apply least privilege.

## Requirements

- `node-auditor` must retain `get`, `list`, and `watch` on Nodes.
- It must not be able to get/list/watch Secrets in any namespace.
- Keep the existing ServiceAccount and ClusterRoleBinding.
- Do not grant write permissions.

**Target time:** 7 minutes
