# Solution

Edit `/tmp/cka-ca-q011/overlays/prod/kustomization.yaml`:

```yaml
replicas:
- name: web
  count: 3
images:
- name: nginx
  newTag: 1.27-alpine
```

Then:

```bash
kubectl apply -k /tmp/cka-ca-q011/overlays/prod
```
