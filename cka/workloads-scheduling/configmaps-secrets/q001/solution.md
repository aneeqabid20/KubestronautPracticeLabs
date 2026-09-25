# Solution

Inspect the ConfigMap and Pod events:

```bash
kubectl -n cka-ws-q003 get cm app-config -o yaml
kubectl -n cka-ws-q003 describe pod -l app=greeter
```

Change the Deployment's ConfigMap key reference from `msg` to `message`.
