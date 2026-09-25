# Question

PV `archive-pv` is bound to PVC `archive` in namespace `cka-storage-q004`.

The data must be preserved if the claim is deleted.

Configure the existing PV accordingly.

## Requirements

- `archive-pv` must use reclaim policy `Retain`.
- Keep the claim bound.
- Do not recreate the PVC.
- Do not change the volume capacity or path.

**Target time:** 4 minutes
