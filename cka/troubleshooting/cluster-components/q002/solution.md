# Solution

Inspect the Deployment and control-plane components:

```bash
kubectl -n cka-cc-q002 get deploy,rs,pods
kubectl -n kube-system get pods
sudo crictl ps -a --name kube-controller-manager
sudo crictl logs <container-id>
```

Repair the kubeconfig argument in
`/etc/kubernetes/manifests/kube-controller-manager.yaml` so it points to
`/etc/kubernetes/controller-manager.conf`. Then verify reconciliation resumes.
