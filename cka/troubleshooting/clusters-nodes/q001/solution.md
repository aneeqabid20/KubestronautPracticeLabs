# Solution

## 1. Identify the unhealthy node

```bash
kubectl get nodes -o wide
```

`k8slab-node01` should appear as `NotReady`.

## 2. Inspect the node

```bash
kubectl describe node k8slab-node01
```

Review the node conditions and recent events.

## 3. Determine the node IP

```bash
kubectl get node k8slab-node01 -o wide
```

Connect to the worker:

```bash
ssh ubuntu@<INTERNAL-IP>
```

## 4. Check kubelet

```bash
systemctl status kubelet
```

The kubelet service is not running.

Additional investigation:

```bash
sudo journalctl -u kubelet --no-pager -n 50
```

## 5. Restore kubelet

```bash
sudo systemctl start kubelet
```

Verify:

```bash
sudo systemctl is-active kubelet
```

Expected:

```text
active
```

## 6. Verify from the controller

Exit the worker:

```bash
exit
```

Then:

```bash
kubectl get nodes
```

`k8slab-node01` should return to `Ready`.

Finally:

```bash
./practice verify cka/troubleshooting/clusters-nodes/q001
```
