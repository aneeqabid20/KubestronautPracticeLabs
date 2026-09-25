# Solution

## 1. Inspect the node

```bash
kubectl get nodes -o wide
kubectl describe node k8slab-node01
```

Connect to the worker:

```bash
ssh ubuntu@<INTERNAL-IP>
```

## 2. Check kubelet

```bash
systemctl status kubelet --no-pager
sudo journalctl -u kubelet --no-pager -n 80
```

Unlike a simple service failure, kubelet is running. The logs show repeated failures
to communicate with the Kubernetes API server.

Inspect the kubelet kubeconfig:

```bash
sudo grep -n 'server:' /etc/kubernetes/kubelet.conf
```

The API server endpoint is incorrect.

## 3. Determine the correct API endpoint

From the controller, one quick method is:

```bash
kubectl config view --minify   -o jsonpath='{.clusters[0].cluster.server}{"
"}'
```

Return to the worker and update `/etc/kubernetes/kubelet.conf` so its `server:`
entry uses the existing cluster API endpoint.

```bash
sudo vi /etc/kubernetes/kubelet.conf
```

## 4. Restart kubelet

```bash
sudo systemctl restart kubelet
sudo systemctl is-active kubelet
```

## 5. Verify

```bash
exit
kubectl get nodes
./practice verify cka/troubleshooting/clusters-nodes/q005
```
