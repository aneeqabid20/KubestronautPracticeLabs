# Solution

The client uses the node/default resolver instead of CoreDNS. Recreate it with:

```yaml
dnsPolicy: ClusterFirst
```

Then test `nslookup backend`.
