# Solution

Inspect Deployment/ReplicaSet events and the LimitRange:

```bash
kubectl -n cka-ws-q011 describe rs
kubectl -n cka-ws-q011 get limitrange memory-policy -o yaml
```

Set request `64Mi` and limit `128Mi` on the container.
