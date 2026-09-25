# Solution

Inspect class names:

```bash
kubectl get pv db-pv -o yaml
kubectl -n cka-storage-q005 get pvc db-data -o yaml
```

The PV advertises the wrong class. Recreate or repair `db-pv` with
`storageClassName: db-static`, preserving its capacity, access mode and path.
