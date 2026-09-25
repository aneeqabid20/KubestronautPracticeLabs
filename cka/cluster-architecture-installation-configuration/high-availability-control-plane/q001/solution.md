# Solution

Edit the file to use v1beta4, the load-balancer `controlPlaneEndpoint`, the existing
cluster CIDRs, and local etcd:

```yaml
etcd:
  local: {}
```

Then run:

```bash
sudo kubeadm config validate --config /tmp/cka-ha-q001/cluster.yaml
```
