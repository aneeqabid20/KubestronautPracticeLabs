# Question

`crictl` on the control-plane node cannot communicate with the container runtime.

Repair `/etc/crictl.yaml`.

## Requirements

Set both endpoints to:

`unix:///run/containerd/containerd.sock`

- `runtime-endpoint`
- `image-endpoint`

`sudo crictl info` must succeed.

**Target time:** 6 minutes
