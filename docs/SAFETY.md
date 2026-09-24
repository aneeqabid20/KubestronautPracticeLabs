# Challenge Safety Model

The practice repository must never casually destroy the base lab.

Protected infrastructure includes:

- kubeadm cluster bootstrap state
- Cilium
- containerd
- WSL networking and persistence services
- Windows/WSL infrastructure created by the separate lab-builder repository

## Namespace scope

Preferred for normal questions. A dedicated namespace should be used where practical.
Reset deletes only that namespace or explicitly labeled scenario resources.

## Cluster scope

Must be explicitly declared in `metadata.yaml`. Setup/reset must identify every
cluster-scoped object they modify and restore or remove only those objects.

## Node scope

Must use the `node_exec` abstraction in `lib/node.sh`. Do not embed PowerShell,
`wsl.exe`, Windows paths, or host-specific WSL operations in question scripts.

Destructive recovery labs require an explicit design and recovery path before
they are added.
