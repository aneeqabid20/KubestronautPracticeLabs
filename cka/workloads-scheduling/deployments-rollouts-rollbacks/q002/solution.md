# Solution

Edit the Deployment:

```bash
kubectl -n cka-ws-q002 edit deployment api
```

Set:

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxUnavailable: 0
    maxSurge: 1
```
