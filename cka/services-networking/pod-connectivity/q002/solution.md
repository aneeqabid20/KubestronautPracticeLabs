# Solution

For a host-network Pod that should use cluster DNS, set:

```yaml
hostNetwork: true
dnsPolicy: ClusterFirstWithHostNet
```

Recreate `host-client` with that DNS policy.
