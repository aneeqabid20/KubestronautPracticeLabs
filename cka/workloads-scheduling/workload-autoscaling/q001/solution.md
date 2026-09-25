# Solution

```bash
kubectl -n cka-ws-q005 edit hpa web
```

Set `minReplicas: 2`, `maxReplicas: 6`, and the CPU resource metric's
`averageUtilization: 60`.
