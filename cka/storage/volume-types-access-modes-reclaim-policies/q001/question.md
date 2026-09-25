# Question

PVC `reports` in namespace `cka-storage-q003` remains `Pending` even though a
matching static PV named `reports-pv` exists.

The application requires `ReadWriteOnce`.

Repair the PV/PVC relationship without changing the PVC request.

## Requirements

- Keep PV name `reports-pv`.
- Keep capacity `1Gi`.
- Keep `storageClassName: reports-static`.
- PV must support `ReadWriteOnce`.
- PVC `reports` must become `Bound`.

**Target time:** 6 minutes
