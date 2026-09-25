# Solution

Inspect CoreDNS:

```bash
kubectl -n kube-system get cm coredns -o yaml
kubectl -n kube-system logs deployment/coredns
```

The `kubernetes` plugin is configured for the wrong zone. Change
`cluster.invalid` back to `cluster.local`, then restart/roll out CoreDNS and test
with `nslookup` from `dns-test`.
