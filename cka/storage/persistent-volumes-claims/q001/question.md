# Question

PVC `db-data` in namespace `cka-storage-q005` is `Pending`.

PV `db-pv` has the correct capacity and access mode, but the claim is not binding.

Repair the static binding.

## Requirements

- Keep PV name `db-pv`.
- Keep PVC name `db-data`.
- Both must use StorageClass `db-static`.
- PVC must become `Bound`.
- Do not change the requested capacity.

**Target time:** 6 minutes
