# Question

A PVC named `web-data` in namespace `cka-storage-q001` does not receive dynamically
provisioned storage.

A StorageClass named `kpl-local-path` and its provisioner are already installed.

Configure the existing StorageClass so PVCs that do not specify
`storageClassName` use it by default.

## Requirements

- `kpl-local-path` must become the cluster's default StorageClass.
- PVC `web-data` must become `Bound`.
- Pod `web` must become `Ready`.
- Do not change the PVC's requested size.
- Do not replace the provisioner.

**Target time:** 7 minutes
