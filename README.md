# KubestronautPracticeLabs

Hands-on, performance-based Kubernetes practice labs organized around the official
Linux Foundation CKA, CKAD and CKS curriculum.

This repository contains **practice scenarios only**. It does not create the
Windows/WSL Kubernetes infrastructure.

## Intended environment

Run from Linux inside the Kubernetes controller, for example:

```bash
git clone https://github.com/aneeqabid20/KubestronautPracticeLabs.git
cd KubestronautPracticeLabs
chmod +x practice
./practice list
```

## CLI

```bash
./practice list
./practice list ckad

./practice show ckad/application-observability-maintenance/probes-health-checks/q001
./practice setup ckad/application-observability-maintenance/probes-health-checks/q001
./practice verify ckad/application-observability-maintenance/probes-health-checks/q001
./practice reset ckad/application-observability-maintenance/probes-health-checks/q001
./practice solution ckad/application-observability-maintenance/probes-health-checks/q001
```

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
            └── resources/
```

The curriculum mapping is documented in `docs/CURRICULUM.md`.

## First proof-of-framework lab

Only one question is included initially:

`ckad/application-observability-maintenance/probes-health-checks/q001`

It intentionally creates a Deployment whose containers run but never become Ready.
The learner must diagnose and correct the application configuration.

The purpose of this question is to validate the framework, not to populate the
question bank.
