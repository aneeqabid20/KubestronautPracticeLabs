# Solution

## 1. Confirm the affected node

```bash
kubectl get nodes -o wide
kubectl describe node k8slab-node01
```

## 2. Connect to the worker

```bash
ssh ubuntu@<INTERNAL-IP>
```

## 3. Inspect kubelet

```bash
systemctl status kubelet --no-pager
sudo journalctl -u kubelet --no-pager -n 60
```

The kubelet cannot start because its configuration file cannot be parsed.

Inspect the kubelet unit and configuration:

```bash
systemctl cat kubelet
sudo tail -30 /var/lib/kubelet/config.yaml
```

Locate and remove the malformed YAML introduced at the end of the configuration file.

For example:

```bash
sudo vi /var/lib/kubelet/config.yaml
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
./practice verify cka/troubleshooting/clusters-nodes/q003
```
