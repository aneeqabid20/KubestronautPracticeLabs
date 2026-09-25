# CKA Question Bank

Research date: **2026-09-25**

Official source:
https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/

Exam baseline: **Kubernetes v1.35**.

The repository contains **62 CKA performance labs covering all 27 current official competencies**.

## Coverage summary

| Domain | Official weight | Labs |
|---|---:|---:|
| Storage | 10% | 6 |
| Troubleshooting | 30% | 16 |
| Workloads & Scheduling | 15% | 11 |
| Cluster Architecture, Installation & Configuration | 25% | 16 |
| Services & Networking | 20% | 13 |
| **Total** | **100%** | **62** |

## Competency coverage

### Storage — 10%

- **Configure volume types, access modes and reclaim policies** — 2 labs
- **Implement storage classes and dynamic volume provisioning** — 2 labs
- **Manage persistent volumes and persistent volume claims** — 2 labs

### Troubleshooting — 30%

- **Manage and evaluate container output streams** — 2 labs
- **Monitor cluster and application resource usage** — 2 labs
- **Troubleshoot cluster components** — 4 labs
- **Troubleshoot clusters and nodes** — 5 labs
- **Troubleshoot services and networking** — 3 labs

### Workloads & Scheduling — 15%

- **Configure Pod admission and scheduling (limits, node affinity, etc.)** — 3 labs
- **Configure workload autoscaling** — 2 labs
- **Understand application deployments and how to perform rolling update and rollbacks** — 2 labs
- **Understand the primitives used to create robust, self-healing, application deployments** — 2 labs
- **Use ConfigMaps and Secrets to configure applications** — 2 labs

### Cluster Architecture, Installation & Configuration — 25%

- **Create and manage Kubernetes clusters using kubeadm** — 2 labs
- **Implement and configure a highly-available control plane** — 2 labs
- **Manage role based access control (RBAC)** — 2 labs
- **Manage the lifecycle of Kubernetes clusters** — 2 labs
- **Prepare underlying infrastructure for installing a Kubernetes cluster** — 2 labs
- **Understand CRDs, install and configure operators** — 2 labs
- **Understand extension interfaces (CNI, CSI, CRI, etc.)** — 2 labs
- **Use Helm and Kustomize to install cluster components** — 2 labs

### Services & Networking — 20%

- **Define and enforce Network Policies** — 2 labs
- **Know how to use Ingress controllers and Ingress resources** — 2 labs
- **Understand and use CoreDNS** — 2 labs
- **Understand connectivity between Pods** — 2 labs
- **Use ClusterIP, NodePort, LoadBalancer service types and endpoints** — 3 labs
- **Use the Gateway API to manage Ingress traffic** — 2 labs

## Validation status

- Static validator: **PASS**
- Unique IDs: **62 / 62**
- Official competencies covered: **27 / 27**
- Static warnings: **0**
- Live runtime validation: `Troubleshoot clusters and nodes` q001–q005 confirmed; remaining labs pending full runtime execution.

See `docs/CKA-QUESTION-CATALOG.md` for every challenge path.
