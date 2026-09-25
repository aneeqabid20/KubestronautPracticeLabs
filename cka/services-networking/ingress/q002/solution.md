# Solution

```bash
kubectl -n cka-net-q011 create secret tls web-tls   --cert=/tmp/cka-net-q011/tls.crt   --key=/tmp/cka-net-q011/tls.key
```

Then edit `secure-web`:

```yaml
tls:
- hosts:
  - secure.kpl.local
  secretName: web-tls
```
