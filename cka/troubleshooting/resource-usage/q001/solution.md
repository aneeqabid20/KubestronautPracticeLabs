# Solution

Inspect Pods and scheduling events:

```bash
kubectl -n cka-tr-q005 get pods
kubectl -n cka-tr-q005 describe pod <pod>
kubectl describe nodes
```

Correct the Deployment requests:

```bash
kubectl -n cka-tr-q005 set resources deployment processor   --requests=cpu=100m,memory=64Mi
```

Wait for two Ready replicas.
