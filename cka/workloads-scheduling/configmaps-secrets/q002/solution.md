# Solution

Inspect Secret keys and Pod events:

```bash
kubectl -n cka-ws-q004 get secret credentials -o yaml
kubectl -n cka-ws-q004 describe pod secret-reader
```

Recreate/edit the Pod so the Secret volume item uses `key: password` and
`path: credential`.
