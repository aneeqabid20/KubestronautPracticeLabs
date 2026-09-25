# Solution

Inspect namespace events, the Deployment, and ResourceQuota:

```bash
kubectl -n cka-tr-q006 get resourcequota
kubectl -n cka-tr-q006 describe deployment api
kubectl -n cka-tr-q006 get events --sort-by=.lastTimestamp
```

Set the required requests and limits on the Deployment, then wait for two Ready replicas.
