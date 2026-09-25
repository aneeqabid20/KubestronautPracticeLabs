# CKA Validation Report

Validation date: 2026-09-25

## Current official baseline

The CKA bank is mapped against the current Linux Foundation CKA curriculum.

- Kubernetes exam baseline: **v1.35**
- Storage: **10%**
- Troubleshooting: **30%**
- Workloads & Scheduling: **15%**
- Cluster Architecture, Installation & Configuration: **25%**
- Services & Networking: **20%**
- Official competencies represented: **27**
- Repository CKA labs: **62**

Official source:

https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/

## Repository-level validation

The complete merged bank currently passes the repository validator:

```text
Validated 62 CKA labs
Unique IDs: 62
Official competencies covered: 27
Warnings: 0
RESULT: PASS
```

Checks include:

- official domain/topic mapping
- required question file contract
- unique IDs
- Bash syntax for setup/verify/reset scripts
- executable-question structure
- metadata structure
- selected YAML/resource validation
- Windows/PowerShell dependency leakage
- unsafe/destructive command-pattern checks
- recovery/reset presence
- CLI discovery

`./practice list cka | wc -l` returns:

```text
62
```

## Live-environment preflight

Latest captured preflight from the target WSL2/kubeadm lab:

```text
PASS=18 WARN=1 FAIL=0
```

The warning was:

```text
helm missing; Helm topic q001 requires it
```

All core cluster checks passed, including:

- Kubernetes API connectivity
- expected three nodes
- control-plane filesystem
- controller-to-node01 passwordless administrative SSH
- controller-to-node02 passwordless administrative SSH
- kubeadm
- crictl
- openssl
- standard shell utilities

Re-run `./tools/preflight-cka.sh` after installing Helm to refresh this status.

## Runtime validation status

Runtime validation is stricter than static validation.

Confirmed end-to-end on the target cluster:

```text
cka/troubleshooting/clusters-nodes/q001
cka/troubleshooting/clusters-nodes/q002
cka/troubleshooting/clusters-nodes/q003
cka/troubleshooting/clusters-nodes/q004
cka/troubleshooting/clusters-nodes/q005
```

For these labs the full lifecycle has been exercised:

```text
setup → intended failure → manual repair → verify → reset
```

The remaining CKA questions have passed static/repository validation but should
still be executed on the real lab before a stable release tag is created.

## Release criterion

A lab should be considered runtime-validated only after confirming:

1. healthy baseline before setup;
2. `setup.sh` exits successfully;
3. the advertised starting/broken state actually exists;
4. `question.md` accurately describes the observable task without leaking the root cause;
5. the intended solution repairs the scenario;
6. `verify.sh` accepts the corrected state;
7. `reset.sh` restores the baseline;
8. the challenge can be set up again after reset.

## Important limitation

Static validation cannot conclusively test timing-sensitive or environment-specific
behavior such as:

- static Pod restart timing
- etcd/API-server recovery timing
- Cilium enforcement behavior
- image availability
- Helm availability
- storage provisioner behavior
- Gateway/Ingress controller availability

Those require the target Kubernetes environment.
