# CKA Question Catalog

Research baseline: Linux Foundation CKA curriculum checked **2026-09-25**.

Target exam baseline: **Kubernetes v1.35**.

**Total labs: 62**

## Coverage

| Domain | Official competency | Labs |
|---|---|---:|
| Storage | Configure volume types, access modes and reclaim policies | 2 |
| Storage | Implement storage classes and dynamic volume provisioning | 2 |
| Storage | Manage persistent volumes and persistent volume claims | 2 |
| Troubleshooting | Manage and evaluate container output streams | 2 |
| Troubleshooting | Monitor cluster and application resource usage | 2 |
| Troubleshooting | Troubleshoot cluster components | 4 |
| Troubleshooting | Troubleshoot clusters and nodes | 5 |
| Troubleshooting | Troubleshoot services and networking | 3 |
| Workloads & Scheduling | Configure Pod admission and scheduling (limits, node affinity, etc.) | 3 |
| Workloads & Scheduling | Configure workload autoscaling | 2 |
| Workloads & Scheduling | Understand application deployments and how to perform rolling update and rollbacks | 2 |
| Workloads & Scheduling | Understand the primitives used to create robust, self-healing, application deployments | 2 |
| Workloads & Scheduling | Use ConfigMaps and Secrets to configure applications | 2 |
| Cluster Architecture, Installation & Configuration | Create and manage Kubernetes clusters using kubeadm | 2 |
| Cluster Architecture, Installation & Configuration | Implement and configure a highly-available control plane | 2 |
| Cluster Architecture, Installation & Configuration | Manage role based access control (RBAC) | 2 |
| Cluster Architecture, Installation & Configuration | Manage the lifecycle of Kubernetes clusters | 2 |
| Cluster Architecture, Installation & Configuration | Prepare underlying infrastructure for installing a Kubernetes cluster | 2 |
| Cluster Architecture, Installation & Configuration | Understand CRDs, install and configure operators | 2 |
| Cluster Architecture, Installation & Configuration | Understand extension interfaces (CNI, CSI, CRI, etc.) | 2 |
| Cluster Architecture, Installation & Configuration | Use Helm and Kustomize to install cluster components | 2 |
| Services & Networking | Define and enforce Network Policies | 2 |
| Services & Networking | Know how to use Ingress controllers and Ingress resources | 2 |
| Services & Networking | Understand and use CoreDNS | 2 |
| Services & Networking | Understand connectivity between Pods | 2 |
| Services & Networking | Use ClusterIP, NodePort, LoadBalancer service types and endpoints | 3 |
| Services & Networking | Use the Gateway API to manage Ingress traffic | 2 |

## Included lab paths

### Storage — Configure volume types, access modes and reclaim policies

- `cka/storage/volume-types-access-modes-reclaim-policies/q001` — medium, target 6m
- `cka/storage/volume-types-access-modes-reclaim-policies/q002` — easy, target 4m

### Storage — Implement storage classes and dynamic volume provisioning

- `cka/storage/storage-classes-dynamic-provisioning/q001` — medium, target 7m
- `cka/storage/storage-classes-dynamic-provisioning/q002` — medium, target 8m

### Storage — Manage persistent volumes and persistent volume claims

- `cka/storage/persistent-volumes-claims/q001` — medium, target 6m
- `cka/storage/persistent-volumes-claims/q002` — medium, target 7m

### Troubleshooting — Manage and evaluate container output streams

- `cka/troubleshooting/container-output-streams/q001` — easy, target 5m
- `cka/troubleshooting/container-output-streams/q002` — medium, target 7m

### Troubleshooting — Monitor cluster and application resource usage

- `cka/troubleshooting/resource-usage/q001` — medium, target 6m
- `cka/troubleshooting/resource-usage/q002` — medium, target 7m

### Troubleshooting — Troubleshoot cluster components

- `cka/troubleshooting/cluster-components/q001` — medium, target 7m
- `cka/troubleshooting/cluster-components/q002` — medium, target 8m
- `cka/troubleshooting/cluster-components/q003` — hard, target 10m
- `cka/troubleshooting/cluster-components/q004` — hard, target 10m

### Troubleshooting — Troubleshoot clusters and nodes

- `cka/troubleshooting/clusters-nodes/q001` — easy, target 5m
- `cka/troubleshooting/clusters-nodes/q002` — medium, target 7m
- `cka/troubleshooting/clusters-nodes/q003` — medium, target 8m
- `cka/troubleshooting/clusters-nodes/q004` — medium, target 8m
- `cka/troubleshooting/clusters-nodes/q005` — hard, target 10m

### Troubleshooting — Troubleshoot services and networking

- `cka/troubleshooting/services-networking/q001` — easy, target 5m
- `cka/troubleshooting/services-networking/q002` — medium, target 6m
- `cka/troubleshooting/services-networking/q003` — medium, target 8m

### Workloads & Scheduling — Configure Pod admission and scheduling (limits, node affinity, etc.)

- `cka/workloads-scheduling/pod-admission-scheduling/q001` — medium, target 7m
- `cka/workloads-scheduling/pod-admission-scheduling/q002` — medium, target 7m
- `cka/workloads-scheduling/pod-admission-scheduling/q003` — medium, target 7m

### Workloads & Scheduling — Configure workload autoscaling

- `cka/workloads-scheduling/workload-autoscaling/q001` — easy, target 5m
- `cka/workloads-scheduling/workload-autoscaling/q002` — medium, target 6m

### Workloads & Scheduling — Understand application deployments and how to perform rolling update and rollbacks

- `cka/workloads-scheduling/deployments-rollouts-rollbacks/q001` — medium, target 6m
- `cka/workloads-scheduling/deployments-rollouts-rollbacks/q002` — medium, target 6m

### Workloads & Scheduling — Understand the primitives used to create robust, self-healing, application deployments

- `cka/workloads-scheduling/self-healing-workloads/q001` — easy, target 5m
- `cka/workloads-scheduling/self-healing-workloads/q002` — medium, target 8m

### Workloads & Scheduling — Use ConfigMaps and Secrets to configure applications

- `cka/workloads-scheduling/configmaps-secrets/q001` — easy, target 5m
- `cka/workloads-scheduling/configmaps-secrets/q002` — medium, target 6m

### Cluster Architecture, Installation & Configuration — Create and manage Kubernetes clusters using kubeadm

- `cka/cluster-architecture-installation-configuration/kubeadm/q001` — medium, target 7m
- `cka/cluster-architecture-installation-configuration/kubeadm/q002` — medium, target 8m

### Cluster Architecture, Installation & Configuration — Implement and configure a highly-available control plane

- `cka/cluster-architecture-installation-configuration/high-availability-control-plane/q001` — medium, target 9m
- `cka/cluster-architecture-installation-configuration/high-availability-control-plane/q002` — medium, target 7m

### Cluster Architecture, Installation & Configuration — Manage role based access control (RBAC)

- `cka/cluster-architecture-installation-configuration/rbac/q001` — easy, target 5m
- `cka/cluster-architecture-installation-configuration/rbac/q002` — medium, target 7m

### Cluster Architecture, Installation & Configuration — Manage the lifecycle of Kubernetes clusters

- `cka/cluster-architecture-installation-configuration/cluster-lifecycle/q001` — medium, target 8m
- `cka/cluster-architecture-installation-configuration/cluster-lifecycle/q002` — medium, target 7m

### Cluster Architecture, Installation & Configuration — Prepare underlying infrastructure for installing a Kubernetes cluster

- `cka/cluster-architecture-installation-configuration/infrastructure-preparation/q001` — medium, target 6m
- `cka/cluster-architecture-installation-configuration/infrastructure-preparation/q002` — medium, target 7m

### Cluster Architecture, Installation & Configuration — Understand CRDs, install and configure operators

- `cka/cluster-architecture-installation-configuration/crds-operators/q001` — medium, target 7m
- `cka/cluster-architecture-installation-configuration/crds-operators/q002` — medium, target 8m

### Cluster Architecture, Installation & Configuration — Understand extension interfaces (CNI, CSI, CRI, etc.)

- `cka/cluster-architecture-installation-configuration/extension-interfaces/q001` — medium, target 6m
- `cka/cluster-architecture-installation-configuration/extension-interfaces/q002` — hard, target 10m

### Cluster Architecture, Installation & Configuration — Use Helm and Kustomize to install cluster components

- `cka/cluster-architecture-installation-configuration/helm-kustomize/q001` — medium, target 8m
- `cka/cluster-architecture-installation-configuration/helm-kustomize/q002` — medium, target 8m

### Services & Networking — Define and enforce Network Policies

- `cka/services-networking/network-policies/q001` — medium, target 8m
- `cka/services-networking/network-policies/q002` — hard, target 10m

### Services & Networking — Know how to use Ingress controllers and Ingress resources

- `cka/services-networking/ingress/q001` — easy, target 6m
- `cka/services-networking/ingress/q002` — medium, target 8m

### Services & Networking — Understand and use CoreDNS

- `cka/services-networking/coredns/q001` — hard, target 10m
- `cka/services-networking/coredns/q002` — medium, target 6m

### Services & Networking — Understand connectivity between Pods

- `cka/services-networking/pod-connectivity/q001` — medium, target 7m
- `cka/services-networking/pod-connectivity/q002` — medium, target 7m

### Services & Networking — Use ClusterIP, NodePort, LoadBalancer service types and endpoints

- `cka/services-networking/services-endpoints/q001` — easy, target 5m
- `cka/services-networking/services-endpoints/q002` — medium, target 6m
- `cka/services-networking/services-endpoints/q003` — medium, target 7m

### Services & Networking — Use the Gateway API to manage Ingress traffic

- `cka/services-networking/gateway-api/q001` — medium, target 8m
- `cka/services-networking/gateway-api/q002` — medium, target 8m
