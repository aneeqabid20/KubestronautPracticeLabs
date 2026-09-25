# Solution

Endpoints exist, so inspect the port mapping:

```bash
kubectl -n cka-tr-q010 get svc web -o yaml
kubectl -n cka-tr-q010 get endpointslice -l kubernetes.io/service-name=web
```

Change `targetPort` from `8080` to `80`, then test from `tester`.
