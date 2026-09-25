# Solution

```bash
mkdir -p /tmp/cka-kubeadm-q001
sudo kubeadm token create --ttl 1h --print-join-command   > /tmp/cka-kubeadm-q001/join.sh
chmod +x /tmp/cka-kubeadm-q001/join.sh
```

Inspect `sudo kubeadm token list`.
