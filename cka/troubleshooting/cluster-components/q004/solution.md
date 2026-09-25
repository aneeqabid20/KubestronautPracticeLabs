# Solution

Use local runtime inspection:

```bash
sudo crictl ps -a
sudo crictl ps -a --name etcd
sudo crictl logs <etcd-container-id>
```

Inspect `/etc/kubernetes/manifests/etcd.yaml`, remove the injected unknown
`--kpl-invalid-flag=true`, and wait for kubelet to recreate etcd. Do not touch
the etcd data directory. Once etcd recovers, kube-apiserver should recover too.
