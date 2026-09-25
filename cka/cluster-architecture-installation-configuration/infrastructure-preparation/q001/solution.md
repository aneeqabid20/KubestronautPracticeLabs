# Solution

On node02:

```bash
sudo sysctl -w net.ipv4.ip_forward=1
echo 'net.ipv4.ip_forward = 1' | sudo tee /etc/sysctl.d/99-kpl-kubernetes.conf
sudo sysctl --system
```

Verify `sysctl net.ipv4.ip_forward`.
