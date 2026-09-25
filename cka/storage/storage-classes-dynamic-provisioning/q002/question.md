# Question

PVC `cache` in namespace `cka-storage-q002` explicitly requests StorageClass
`fast-local`, but the claim remains `Pending`.

A working local-path provisioner is installed with provisioner name
`rancher.io/local-path`.

Repair `fast-local` so it performs dynamic provisioning.

## Requirements

- Keep the StorageClass name `fast-local`.
- Use provisioner `rancher.io/local-path`.
- Use `WaitForFirstConsumer`.
- PVC `cache` must become `Bound`.
- Pod `cache-user` must become `Ready`.

**Target time:** 8 minutes
