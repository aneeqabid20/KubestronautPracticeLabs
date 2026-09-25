# Solution

When the API is down, use local runtime tooling:

```bash
sudo crictl ps -a --name kube-apiserver
sudo crictl logs <container-id>
sudo grep -n kpl-invalid /etc/kubernetes/manifests/kube-apiserver.yaml
```

Remove the injected unknown `--kpl-invalid-flag=true` argument from the static Pod
manifest. Kubelet recreates the API server automatically.

```bash
kubectl get --raw=/readyz
kubectl get nodes
```
