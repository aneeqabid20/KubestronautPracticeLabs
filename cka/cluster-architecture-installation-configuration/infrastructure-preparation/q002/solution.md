# Solution

On node01:

```bash
sudo modprobe br_netfilter
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
echo 'net.bridge.bridge-nf-call-iptables = 1' |   sudo tee /etc/sysctl.d/99-kpl-bridge.conf
```
