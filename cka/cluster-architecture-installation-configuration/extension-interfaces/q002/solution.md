# Solution

SSH to node02 and inspect CNI configuration:

```bash
ls -l /etc/cni/net.d
grep -R . /etc/cni/net.d
journalctl -u kubelet -n 50 --no-pager
```

The Cilium conflist references a non-existent plugin type. Restore the plugin type
to `cilium-cni`; do not reinstall Cilium. Recreate/wait for `net-test`.
