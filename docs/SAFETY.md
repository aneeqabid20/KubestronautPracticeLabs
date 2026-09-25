# Challenge Safety Model

The practice repository must distinguish scenario resources from base lab
infrastructure.

Protected infrastructure includes:

- kubeadm bootstrap state
- container runtime
- CNI base installation
- WSL/network persistence infrastructure
- Windows infrastructure from the separate lab-builder repository
- unrelated namespaces and workloads

## Namespace scope

Preferred for normal questions.

Use a dedicated namespace where practical. Reset should delete only that namespace
or explicit scenario-owned objects.

## Cluster scope

Must be declared in metadata. Setup/reset should identify every shared object or
file they modify and preserve enough information to restore the original state.

## Node scope

Use the `node_exec` abstraction rather than Windows/WSL commands.

The practice repo should never embed:

- PowerShell
- `wsl.exe`
- Windows filesystem paths

## API-down recovery

Some advanced CKA/CKS scenarios intentionally break components such as
kube-apiserver or etcd.

For these questions:

- `setup.sh` must save the original local configuration before fault injection;
- `reset.sh` must be able to restore locally without requiring a functioning API;
- the reset must wait for API recovery afterward;
- recovery must not delete etcd data or rebuild the cluster unless that is the
  explicit skill being tested.

## Concurrency

Do not run disruptive questions concurrently.

A new question should start only from a known healthy baseline.

## Destructive labs

A lab marked `destructive: true` must have a documented and tested recovery path
before it is accepted into a stable question bank.
