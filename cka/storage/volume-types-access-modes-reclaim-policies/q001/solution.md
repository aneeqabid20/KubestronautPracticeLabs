# Solution

Compare the claim and volume:

```bash
kubectl get pv reports-pv -o yaml
kubectl -n cka-storage-q003 get pvc reports -o yaml
```

The access modes do not match. Recreate or correct `reports-pv` so it advertises
`ReadWriteOnce`, while preserving its name, capacity, class and hostPath. Then
verify the claim binds.
