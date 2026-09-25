# Solution

Inspect the HTTPRoute and change its first `backendRefs` port from `8080` to `80`:

```bash
kubectl -n cka-net-q008 edit httproute web-route
```
