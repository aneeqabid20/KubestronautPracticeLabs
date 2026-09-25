# Solution

Check why the Pod has no node and inspect control-plane Pods:

```bash
kubectl -n cka-cc-q001 describe pod workload
kubectl -n kube-system get pods
sudo crictl ps -a --name kube-scheduler
sudo crictl logs <container-id>
```

Inspect `/etc/kubernetes/manifests/kube-scheduler.yaml`. Restore the kubeconfig
argument to `/etc/kubernetes/scheduler.conf`. Kubelet will recreate the static Pod.

Verify the scheduler becomes Ready and the workload is scheduled.
