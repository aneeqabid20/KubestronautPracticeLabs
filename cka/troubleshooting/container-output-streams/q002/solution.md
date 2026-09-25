# Solution

Identify container names and inspect the sidecar specifically:

```bash
kubectl -n cka-tr-q008 get pods
kubectl -n cka-tr-q008 logs deploy/observer -c sidecar
kubectl -n cka-tr-q008 get deploy observer -o yaml
```

Change the sidecar's `BACKEND_PORT` from `9999` to `80`, then inspect its logs again.
