# Solution

```bash
kubectl drain k8slab-node02 --ignore-daemonsets --delete-emptydir-data
kubectl get nodes
kubectl -n cka-ca-q007 get pods -o wide
```

Leave node02 cordoned for verification.
