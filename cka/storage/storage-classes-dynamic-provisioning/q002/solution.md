# Solution

Inspect the claim, events and class:

```bash
kubectl -n cka-storage-q002 describe pvc cache
kubectl get sc fast-local -o yaml
```

The StorageClass has the wrong provisioner. Because the provisioner field is not
meant to be changed in place, recreate the class with the same name:

```bash
kubectl delete sc fast-local
cat <<'YAML' | kubectl apply -f -
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-local
provisioner: rancher.io/local-path
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
YAML
```

Verify the PVC and consumer Pod become healthy.
