# Solution

The Pods are on different nodes, so test the server Pod IP directly. Inspect the
server command:

```bash
kubectl -n cka-net-q001 get pod server -o yaml
```

The HTTP server is bound to `127.0.0.1:8080`. Recreate the Pod with the same name,
node selector, image and content, but run BusyBox httpd on `:8080` (all interfaces),
for example `httpd -f -p 8080`.
