# CKA Artifact Validation Report

Validation date: 2026-09-25

## Research baseline

The bank was mapped against the current Linux Foundation CKA page:

- https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/
- Exam baseline: Kubernetes v1.35
- Domain weights: Storage 10%, Troubleshooting 30%, Workloads & Scheduling 15%,
  Cluster Architecture / Installation / Configuration 25%, Services & Networking 20%.

Supporting implementation references used during design include:

- kubeadm upgrade v1.35:
  https://v1-35.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/
- kubeadm HA:
  https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/
- StorageClasses:
  https://kubernetes.io/docs/concepts/storage/storage-classes/
- PersistentVolumes:
  https://kubernetes.io/docs/concepts/storage/persistent-volumes/
- Services and networking:
  https://v1-35.docs.kubernetes.io/docs/concepts/services-networking/
- Gateway API releases:
  https://github.com/kubernetes-sigs/gateway-api/releases
- Local Path Provisioner releases:
  https://github.com/rancher/local-path-provisioner/releases

## Validation cycle 1

The first full audit checked:

- official domain/topic mapping;
- required question file contract;
- metadata parsing and unique IDs;
- Bash syntax for setup/verify/reset scripts;
- executable permissions;
- YAML resources;
- Windows/PowerShell dependency leakage;
- destructive command patterns;
- reset/recovery coverage;
- CLI discovery against the Stage 1 `./practice` command.

Corrections made during this cycle:

1. Completed the HA control-plane competency with a second independent lab.
2. Confirmed and pinned Gateway API Standard CRDs to current release `v1.6.2`.
3. Confirmed Local Path Provisioner `v0.0.36` as the current release used by
   the bundled storage dependency.
4. Updated validation logic so Helm templates are rendered/treated as templates
   rather than incorrectly parsed as plain YAML.
5. Confirmed the API-down recovery patch is required for kube-apiserver/etcd labs.

## Validation cycle 2

A clean Stage 1 repository was reconstructed, the complete overlay was copied in,
and the reset-recovery patch was applied.

Results:

- pending CKA labs discovered by `./practice list cka`: **57**
- pending official competencies covered: **26 / 26**
- unique question IDs: **57**
- setup/verify/reset scripts syntax checked: **171**
- static validator warnings: **0**
- static validator errors: **0**
- CLI discovery: **PASS**
- framework patch application: **PASS**

The five already validated `clusters-nodes` questions are intentionally not
duplicated by this overlay. After merging with the existing repository, the
planned CKA bank contains **62 performance labs**.

## Important limitation

This validation is a research, structural, syntax, safety and clean-repository
integration validation performed outside the user's live Kubernetes cluster.
Every scenario should still be runtime-validated on the actual WSL2 kubeadm lab
before the entire bank is tagged as a stable release. Cluster-specific variables
such as image availability, Helm presence, Cilium behavior, and node timing can
only be conclusively validated in that environment.
