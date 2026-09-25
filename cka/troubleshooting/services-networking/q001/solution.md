# Solution

Compare Service selectors with Pod labels:

```bash
kubectl -n cka-tr-q009 get svc web -o yaml
kubectl -n cka-tr-q009 get pods --show-labels
kubectl -n cka-tr-q009 get endpointslice -l kubernetes.io/service-name=web
```

Change the Service selector to `app: web`.
