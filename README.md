# KubestronautPracticeLabs

Hands-on, performance-based Kubernetes certification practice labs organized
around the current Linux Foundation CKA, CKAD and CKS curricula.

The repository contains **practice scenarios**, not Windows/WSL infrastructure.
The Kubernetes lab itself can be created by a separate project such as
`LocalKubernetesLabForWindows`, or by any compatible Linux/kubeadm environment.

## Project status

| Certification | Current content | Status |
|---|---:|---|
| CKA | 62 performance labs covering all 27 official competencies | Content-complete; static validation PASS; live validation in progress |
| CKAD | 1 framework/sample lab | Question bank not built yet |
| CKS | Topic hierarchy only | Question bank not built yet |

The CKA bank is mapped to the Linux Foundation curriculum checked on
**2026-09-25** and targets the current **Kubernetes v1.35** exam baseline.

> The 62 CKA artifacts have passed repository-level validation. Five
> `Troubleshoot clusters and nodes` labs have also been live-tested end-to-end
> on the target WSL2/kubeadm lab. The remaining CKA labs still require runtime
> execution before the bank should be tagged as a stable release.

## Repository model

```text
Certification
└── Official exam domain
    └── Official competency/topic
        └── qNNN
            ├── metadata.yaml
            ├── question.md
            ├── setup.sh
            ├── verify.sh
            ├── reset.sh
            ├── solution.md
            └── resources/        # optional
```

The path itself is the human-friendly challenge identifier. Example:

```text
cka/troubleshooting/clusters-nodes/q001
```

## Where the repository can run

The repository may be cloned, edited and committed from **any Linux
environment**.

To execute a practice lab, the shell must have access to a compatible Kubernetes
environment and the tools required by that specific question. Node-level CKA/CKS
questions may additionally require passwordless SSH and sudo access to the
target nodes.

The repository intentionally does **not** depend on:

- PowerShell
- `wsl.exe`
- Windows paths
- a specific Windows host

## Quick start

```bash
git clone https://github.com/aneeqabid20/KubestronautPracticeLabs.git
cd KubestronautPracticeLabs

./practice list
./practice list cka
```

Show a question:

```bash
./practice show cka/troubleshooting/clusters-nodes/q001
```

Prepare its starting state:

```bash
./practice setup cka/troubleshooting/clusters-nodes/q001
```

Solve the problem manually, then validate the resulting state:

```bash
./practice verify cka/troubleshooting/clusters-nodes/q001
```

Reset only that scenario:

```bash
./practice reset cka/troubleshooting/clusters-nodes/q001
```

View the reference solution when required:

```bash
./practice solution cka/troubleshooting/clusters-nodes/q001
```

## CKA coverage

| Domain | Weight | Labs |
|---|---:|---:|
| Storage | 10% | 6 |
| Troubleshooting | 30% | 16 |
| Workloads & Scheduling | 15% | 11 |
| Cluster Architecture, Installation & Configuration | 25% | 16 |
| Services & Networking | 20% | 13 |
| **Total** | **100%** | **62** |

All 27 current CKA competencies are represented. See:

- `docs/CKA-QUESTION-BANK.md` — coverage overview
- `docs/CKA-QUESTION-CATALOG.md` — complete lab catalog
- `docs/CKA-PREREQUISITES.md` — target lab requirements
- `VALIDATION-REPORT.md` — validation status and limitations

## Validation

Static repository validation:

```bash
python3 tools/validate-cka-artifacts.py
```

Expected for the current CKA bank:

```text
Validated 62 CKA labs
Unique IDs: 62
Official competencies covered: 27
Warnings: 0
RESULT: PASS
```

Live-environment preflight:

```bash
./tools/preflight-cka.sh
```

Runtime validation is intentionally separate from static validation. Every lab
should eventually pass this lifecycle on the target cluster:

```text
healthy baseline
    ↓
setup
    ↓
intended broken/start state
    ↓
manual solution
    ↓
verify
    ↓
reset
    ↓
healthy baseline again
```

## Safety model

Question automation must distinguish between scenario state and base cluster
infrastructure.

Normal reset operations must not destroy:

- the kubeadm cluster
- containerd
- the CNI installation
- WSL/network infrastructure
- unrelated namespaces or workloads

Cluster/control-plane questions that intentionally disrupt the API server, etcd,
CNI or another shared component must provide an explicit recovery path in their
own `reset.sh`.

Do not run multiple disruptive questions concurrently.

## Documentation

- `docs/CURRICULUM.md` — current official curriculum mapping
- `docs/QUESTION-SPEC.md` — question contract
- `docs/DEVELOPING-LABS.md` — development workflow
- `docs/SAFETY.md` — destructive-lab safety rules
- `INSTALL.md` — clone and environment setup
- `VALIDATION-REPORT.md` — current validation state

## Development principle

Question banks are organized by:

```text
Certification
→ Official domain
→ Official competency
→ Performance lab
```

Questions should test resulting Kubernetes behavior rather than command history.
Where multiple technically valid solutions satisfy the stated requirements, the
verifier should accept them.
