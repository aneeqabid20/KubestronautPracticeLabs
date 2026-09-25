# Question

Prepare the kubeadm ClusterConfiguration at
`/tmp/cka-ha-q001/cluster.yaml` for an HA control plane fronted by the load-balancer
endpoint `k8s-lb.k8slab.local:6443`.

This lab validates HA kubeadm configuration only; do not initialize another control plane.

## Requirements

- API `kubeadm.k8s.io/v1beta4`.
- `controlPlaneEndpoint: k8s-lb.k8slab.local:6443`.
- Pod subnet `10.244.0.0/16`.
- Service subnet `10.96.0.0/12`.
- Configure local etcd, not external etcd.
- File must pass `kubeadm config validate`.

**Target time:** 9 minutes
