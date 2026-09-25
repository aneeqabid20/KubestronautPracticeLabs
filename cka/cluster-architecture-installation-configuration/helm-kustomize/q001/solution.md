# Solution

```bash
helm install web resources/chart -n cka-ca-q010   --set replicaCount=3   --set service.port=8080
```

Then inspect `helm status web -n cka-ca-q010`.
