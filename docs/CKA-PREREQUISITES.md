# CKA Lab Prerequisites

The current CKA bank targets a kubeadm-based Kubernetes v1.35.x lab.

Reference environment:

```text
k8slab-controller.k8slab.local   control-plane + schedulable worker
k8slab-node01                    worker
k8slab-node02                    worker
```

Core assumptions:

- kubeadm
- Kubernetes v1.35.x
- containerd
- systemd
- Cilium with NetworkPolicy enforcement
- working cluster DNS
- controller-to-worker passwordless SSH
- passwordless sudo where node/control-plane changes are required
- `kubectl`, `kubeadm`, `crictl`, `ssh`, `journalctl`, `systemctl`
- common GNU/Linux tools (`sed`, `awk`, `grep`, etc.)

## Additional tools

Some labs require:

- `helm` — Helm competency
- `openssl` — TLS Ingress scenario

Run:

```bash
./tools/preflight-cka.sh
```

before runtime validation.

## Shared dependencies

### Storage

Dynamic-provisioning labs use a repository-managed Local Path Provisioner in:

```text
namespace: kpl-storage-system
StorageClass: kpl-local-path
```

The provisioner is treated as shared practice infrastructure and may remain
installed between questions.

### Gateway API

Gateway API labs can install the pinned Standard Gateway API CRDs.

They primarily validate Gateway API object configuration and do not assume a
specific Gateway controller/data plane unless the question explicitly provisions one.

## Disruptive labs

Some scenarios intentionally affect shared operation, including:

- kube-apiserver
- etcd
- kubelet/containerd
- CNI configuration
- CoreDNS

Do not run multiple disruptive labs concurrently.

## HA limitation of the reference lab

The reference environment has one actual control-plane node.

High-availability questions therefore focus on kubeadm HA configuration skills
that can be exercised safely in this lab. They should not claim to create a
production-equivalent multi-control-plane topology when the underlying
infrastructure does not provide one.
