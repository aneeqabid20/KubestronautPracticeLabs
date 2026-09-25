# Question

PVC `media` in namespace `cka-storage-q006` requests static storage but no suitable
PV exists.

Create the required PV.

## Requirements

Create PV `media-pv` with:
- capacity `2Gi`
- access mode `ReadWriteOnce`
- StorageClass `media-static`
- reclaim policy `Retain`
- hostPath `/opt/kpl/media`

PVC `media` must become `Bound`.

**Target time:** 7 minutes
