# Question

Prepare `/tmp/cka-ha-q002-join.txt` as a kubeadm command for adding another
control-plane node to a stacked highly-available cluster.

## Requirements

The command must:

- join endpoint `k8s-ha.example.local:6443`
- use bootstrap token `abcdef.0123456789abcdef`
- include a SHA256 discovery CA certificate hash
- include `--control-plane`
- include a 64-character hexadecimal `--certificate-key`

Do not execute the join command against this lab.

**Target time:** 7 minutes
