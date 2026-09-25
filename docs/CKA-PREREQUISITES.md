# CKA Lab Prerequisites

Baseline lab expected by this CKA bank:

- kubeadm cluster, Kubernetes v1.35.x
- control plane node: `k8slab-controller.k8slab.local`
- workers: `k8slab-node01`, `k8slab-node02`
- control plane is schedulable (as in the existing lab)
- container runtime: containerd
- CNI: Cilium with Kubernetes NetworkPolicy enforcement
- controller can SSH non-interactively to workers as `ubuntu`
- passwordless sudo is available where node/control-plane changes are required
- `kubectl`, `kubeadm`, `crictl`, `systemctl`, `journalctl`, `ssh`, `sed`, `awk`,
  `grep` and standard GNU/Linux tools are available
- `helm` is required only for the Helm question
- `openssl` is required only for the TLS Ingress question

## Shared dependencies

### Storage

StorageClass dynamic-provisioning questions use a repository-owned local-path
provisioner installed into namespace `kpl-storage-system`. The shared StorageClass
is `kpl-local-path`.

The provisioner is deliberately retained between questions because it is lab
infrastructure, not question state.

### Gateway API

Gateway API questions install the Standard Gateway API CRDs at pinned release
`v1.6.2` if they are not already installed. They validate API resource
configuration and do not assume a Gateway controller/data plane.

## Deliberately disruptive labs

The following labs intentionally affect cluster-wide operation and include an
explicit reset/recovery path:

- Troubleshooting / cluster-components q003 — kube-apiserver
- Troubleshooting / cluster-components q004 — etcd
- Cluster Architecture / extension-interfaces q002 — worker CNI config
- Services & Networking / CoreDNS q001 — cluster DNS

Do not run multiple practice questions concurrently.

## Single-control-plane limitation

The HA control-plane lab is a kubeadm configuration task. A three-node worker lab
with one real control-plane node cannot safely simulate a full HA control plane
without changing the infrastructure design. The task therefore tests the
`controlPlaneEndpoint`, networking and local-etcd configuration that is relevant
when preparing a kubeadm HA configuration.
