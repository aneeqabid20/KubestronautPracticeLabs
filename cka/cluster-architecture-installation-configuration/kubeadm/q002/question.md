# Question

Correct the kubeadm ClusterConfiguration file:

`/tmp/cka-kubeadm-q002/cluster.yaml`

## Required values

- API: `kubeadm.k8s.io/v1beta4`
- kind: `ClusterConfiguration`
- `kubernetesVersion: v1.35.8`
- `controlPlaneEndpoint: k8slab-controller.k8slab.local:6443`
- Pod subnet: `10.244.0.0/16`
- Service subnet: `10.96.0.0/12`

The final file must pass `kubeadm config validate`.

Do not run `kubeadm init`.

**Target time:** 8 minutes
