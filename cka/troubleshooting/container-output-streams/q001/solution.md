# Solution

Use current and previous logs:

```bash
kubectl -n cka-tr-q007 logs worker
kubectl -n cka-tr-q007 logs worker --previous
```

The application output states that `MODE` must be `production`. Edit/recreate the
Pod manifest with `MODE=production` while keeping the same name and image.
