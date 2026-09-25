# Solution

## 1. Identify the unhealthy node

```bash
kubectl get nodes -o wide
```

`k8slab-node02` should report `NotReady`.

## 2. Inspect the Node

```bash
kubectl describe node k8slab-node02
```

Review the node conditions and events.

Determine its InternalIP:

```bash
kubectl get node k8slab-node02 -o wide
```

## 3. Connect to the worker

```bash
ssh ubuntu@<INTERNAL-IP>
```

## 4. Check kubelet

```bash
systemctl status kubelet
```

The kubelet itself should still be running.

Inspect its recent logs:

```bash
sudo journalctl -u kubelet --no-pager -n 50
```

Look for errors related to the container runtime.

## 5. Check the container runtime

```bash
sudo systemctl status containerd
```

You should discover that `containerd` is not running.

You can also check CRI connectivity:

```bash
sudo crictl info
```

## 6. Restore the runtime

```bash
sudo systemctl start containerd
```

Verify:

```bash
sudo systemctl is-active containerd
```

Expected:

```text
active
```

Confirm the runtime responds:

```bash
sudo crictl info
```

## 7. Verify node recovery

Exit the worker:

```bash
exit
```

Then:

```bash
kubectl get nodes
```

`k8slab-node02` should return to `Ready`.

Finally:

```bash
./practice verify cka/troubleshooting/clusters-nodes/q002
```
