# Installation and environment setup

`KubestronautPracticeLabs` is a Linux-native practice repository. It does not
create the Kubernetes infrastructure itself.

## 1. Clone

```bash
git clone https://github.com/aneeqabid20/KubestronautPracticeLabs.git
cd KubestronautPracticeLabs
```

The Git repository can be maintained from any Linux environment.

## 2. Script permissions

Git normally preserves executable bits. If required:

```bash
chmod +x practice
find cka ckad cks -type f \
  \( -name setup.sh -o -name verify.sh -o -name reset.sh \) \
  -exec chmod +x {} \;
chmod +x lib/*.sh tools/*.sh 2>/dev/null || true
```

## 3. CKA target environment

The current CKA bank was designed for a kubeadm-based Linux cluster with:

- Kubernetes v1.35.x
- containerd
- Cilium
- one schedulable control-plane node
- at least two worker nodes
- `kubectl`, `kubeadm`, `crictl`, systemd and standard Linux tools
- passwordless administrative SSH to workers for node-level labs
- passwordless sudo on the control plane for control-plane recovery labs

The reference WSL2 lab uses:

```text
k8slab-controller.k8slab.local
k8slab-node01
k8slab-node02
```

The framework discovers worker InternalIPs through Kubernetes rather than
hard-coding them.

## 4. Optional/specialized dependencies

Some questions require additional tools:

- `helm` — Helm competency
- `openssl` — TLS/Ingress scenarios
- internet access during first setup of repository-managed shared dependencies

Storage scenarios can install the repository-owned Local Path Provisioner.
Gateway API scenarios can install pinned Standard CRDs.

See `docs/CKA-PREREQUISITES.md`.

## 5. Preflight

```bash
./tools/preflight-cka.sh
```

Resolve any `FAIL` before starting CKA labs. Warnings identify optional tools
needed only by particular questions.

## 6. Static artifact validation

```bash
python3 tools/validate-cka-artifacts.py
```

Current expected result:

```text
Validated 62 CKA labs
Unique IDs: 62
Official competencies covered: 27
Warnings: 0
RESULT: PASS
```

## 7. List and run labs

```bash
./practice list cka

./practice setup <challenge-path>
./practice verify <challenge-path>
./practice reset <challenge-path>
```

Example:

```bash
./practice setup cka/troubleshooting/clusters-nodes/q001
```

## Important

Do not run multiple disruptive questions concurrently. Some CKA scenarios
intentionally stop kubelet/containerd or disrupt control-plane components such as
the API server and etcd. Each such question has its own recovery-aware reset.
