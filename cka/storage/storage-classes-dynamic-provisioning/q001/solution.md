# Solution

Inspect the PVC and StorageClasses:

```bash
kubectl -n cka-storage-q001 get pvc
kubectl get sc
```

Mark the existing class as default:

```bash
kubectl annotate storageclass kpl-local-path   storageclass.kubernetes.io/is-default-class=true
```

Then verify:

```bash
kubectl -n cka-storage-q001 get pvc,pod
./practice verify cka/storage/storage-classes-dynamic-provisioning/q001
```
