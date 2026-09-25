# Solution

```bash
kubectl -n cka-ws-q001 rollout history deployment/web
kubectl -n cka-ws-q001 rollout undo deployment/web
kubectl -n cka-ws-q001 rollout status deployment/web
```

Confirm the image and three Ready replicas.
