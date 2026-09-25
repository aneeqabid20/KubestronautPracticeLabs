# Solution

## 1. Inspect the unhealthy node

```bash
kubectl get nodes -o wide
kubectl describe node k8slab-node02
```

Connect to the worker:

```bash
ssh ubuntu@<INTERNAL-IP>
```

## 2. Inspect kubelet startup

```bash
systemctl status kubelet --no-pager
sudo journalctl -u kubelet --no-pager -n 60
```

The log reports an invalid/unknown kubelet command-line flag.

Inspect how kubelet is started:

```bash
systemctl cat kubelet
cat /var/lib/kubelet/kubeadm-flags.env
```

Remove the invalid `--kpl-invalid-flag=true` argument from the kubeadm-generated
kubelet flags file.

```bash
sudo vi /var/lib/kubelet/kubeadm-flags.env
```

## 3. Restart and verify

```bash
sudo systemctl restart kubelet
sudo systemctl is-active kubelet
exit
kubectl get nodes
./practice verify cka/troubleshooting/clusters-nodes/q004
```
