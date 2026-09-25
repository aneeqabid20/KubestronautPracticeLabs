# CKA Question Bank — Pending Topics

Research date: 2026-09-25

This overlay covers every current CKA competency that was still pending after
`Troubleshooting → Troubleshoot clusters and nodes` q001–q005 were validated.

Official source: https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/

Current exam baseline used by this bank: Kubernetes v1.35.

## Coverage summary

| Domain | Official weight | New labs in this overlay |
|---|---:|---:|
| Storage | 10% | 6 |
| Troubleshooting | 30% | 11 |
| Workloads & Scheduling | 15% | 11 |
| Cluster Architecture, Installation & Configuration | 25% | 16 |
| Services & Networking | 20% | 13 |

**Pending-topic labs in this overlay:** 57

**Already validated separately:** 5 labs under `cka/troubleshooting/clusters-nodes/`.

**Total CKA labs after merge:** 62

## Topic coverage

### Storage — 10%

- **Manage persistent volumes and persistent volume claims** — 2 labs
- **Implement storage classes and dynamic volume provisioning** — 2 labs
- **Configure volume types, access modes and reclaim policies** — 2 labs

### Troubleshooting — 30%

- **Troubleshoot cluster components** — 4 labs
- **Manage and evaluate container output streams** — 2 labs
- **Monitor cluster and application resource usage** — 2 labs
- **Troubleshoot services and networking** — 3 labs

### Workloads & Scheduling — 15%

- **Use ConfigMaps and Secrets to configure applications** — 2 labs
- **Understand application deployments and how to perform rolling update and rollbacks** — 2 labs
- **Configure Pod admission and scheduling (limits, node affinity, etc.)** — 3 labs
- **Understand the primitives used to create robust, self-healing, application deployments** — 2 labs
- **Configure workload autoscaling** — 2 labs

### Cluster Architecture, Installation & Configuration — 25%

- **Manage the lifecycle of Kubernetes clusters** — 2 labs
- **Understand CRDs, install and configure operators** — 2 labs
- **Understand extension interfaces (CNI, CSI, CRI, etc.)** — 2 labs
- **Use Helm and Kustomize to install cluster components** — 2 labs
- **Implement and configure a highly-available control plane** — 2 labs
- **Prepare underlying infrastructure for installing a Kubernetes cluster** — 2 labs
- **Create and manage Kubernetes clusters using kubeadm** — 2 labs
- **Manage role based access control (RBAC)** — 2 labs

### Services & Networking — 20%

- **Understand and use CoreDNS** — 2 labs
- **Use the Gateway API to manage Ingress traffic** — 2 labs
- **Know how to use Ingress controllers and Ingress resources** — 2 labs
- **Define and enforce Network Policies** — 2 labs
- **Understand connectivity between Pods** — 2 labs
- **Use ClusterIP, NodePort, LoadBalancer service types and endpoints** — 3 labs

## Complete pending-lab catalog

| Path | Difficulty | Target | Scenario |
|---|---|---:|---|
| `cluster-architecture-installation-configuration/cluster-lifecycle/q001` | medium | 8m | Prepare `k8slab-node02` for maintenance. |
| `cluster-architecture-installation-configuration/cluster-lifecycle/q002` | medium | 7m | Renew the client certificate embedded in `/etc/kubernetes/admin.conf` using kubeadm. |
| `cluster-architecture-installation-configuration/crds-operators/q001` | medium | 7m | A CRD `widgets.kpl.example` is installed. A Widget manifest at |
| `cluster-architecture-installation-configuration/crds-operators/q002` | medium | 8m | ServiceAccount `widget-operator` in namespace `cka-ca-q015` is intended to watch |
| `cluster-architecture-installation-configuration/extension-interfaces/q001` | medium | 6m | `crictl` on the control-plane node cannot communicate with the container runtime. |
| `cluster-architecture-installation-configuration/extension-interfaces/q002` | hard | 10m | New Pods scheduled to `k8slab-node02` cannot create their network sandbox. |
| `cluster-architecture-installation-configuration/helm-kustomize/q001` | medium | 8m | Install the local Helm chart in `resources/chart` as release `web` in namespace |
| `cluster-architecture-installation-configuration/helm-kustomize/q002` | medium | 8m | A Kustomize project has been copied to `/tmp/cka-ca-q011`. |
| `cluster-architecture-installation-configuration/high-availability-control-plane/q001` | medium | 9m | Prepare the kubeadm ClusterConfiguration at |
| `cluster-architecture-installation-configuration/high-availability-control-plane/q002` | medium | 7m | Prepare `/tmp/cka-ha-q002-join.txt` as a kubeadm command for adding another |
| `cluster-architecture-installation-configuration/infrastructure-preparation/q001` | medium | 6m | Worker `k8slab-node02` has IPv4 forwarding disabled. |
| `cluster-architecture-installation-configuration/infrastructure-preparation/q002` | medium | 7m | Worker `k8slab-node01` has bridge traffic filtering disabled for IPv4. |
| `cluster-architecture-installation-configuration/kubeadm/q001` | medium | 7m | Create a new kubeadm worker join command and save it to: |
| `cluster-architecture-installation-configuration/kubeadm/q002` | medium | 8m | Correct the kubeadm ClusterConfiguration file: |
| `cluster-architecture-installation-configuration/rbac/q001` | easy | 5m | ServiceAccount `auditor` in namespace `cka-ca-q001` must be able to |
| `cluster-architecture-installation-configuration/rbac/q002` | medium | 7m | ClusterRole `kpl-node-reader` grants ServiceAccount `node-auditor` the required |
| `services-networking/coredns/q001` | hard | 10m | Cluster DNS no longer resolves standard Kubernetes Service names. |
| `services-networking/coredns/q002` | medium | 6m | Pod `client` in namespace `cka-net-q013` cannot resolve Service `backend`, while |
| `services-networking/gateway-api/q001` | medium | 8m | HTTPRoute `web-route` in namespace `cka-net-q008` sends `/app` traffic to the |
| `services-networking/gateway-api/q002` | medium | 8m | HTTPRoute `split` in namespace `cka-net-q009` distributes traffic equally between |
| `services-networking/ingress/q001` | easy | 6m | Ingress `web` in namespace `cka-net-q010` references a non-existent backend Service. |
| `services-networking/ingress/q002` | medium | 8m | Ingress `secure-web` in namespace `cka-net-q011` must terminate TLS for |
| `services-networking/network-policies/q001` | medium | 8m | Namespace `cka-net-q003` has default-deny ingress. Allow only Pods labeled |
| `services-networking/network-policies/q002` | hard | 10m | API Pods in namespace `cka-net-api` are protected by default-deny ingress. |
| `services-networking/pod-connectivity/q001` | medium | 7m | Pod `client` on `k8slab-node02` cannot connect to Pod `server` on |
| `services-networking/pod-connectivity/q002` | medium | 7m | Host-network Pod `host-client` in namespace `cka-net-q002` cannot resolve the |
| `services-networking/services-endpoints/q001` | easy | 5m | Service `web` in namespace `cka-net-q005` has no endpoints although Deployment |
| `services-networking/services-endpoints/q002` | medium | 6m | Service `web` in namespace `cka-net-q006` has ready endpoints, but application |
| `services-networking/services-endpoints/q003` | medium | 7m | Deployment `web` in namespace `cka-net-q007` must be exposed on every node. |
| `storage/persistent-volumes-claims/q001` | medium | 6m | PVC `db-data` in namespace `cka-storage-q005` is `Pending`. |
| `storage/persistent-volumes-claims/q002` | medium | 7m | PVC `media` in namespace `cka-storage-q006` requests static storage but no suitable |
| `storage/storage-classes-dynamic-provisioning/q001` | medium | 7m | A PVC named `web-data` in namespace `cka-storage-q001` does not receive dynamically |
| `storage/storage-classes-dynamic-provisioning/q002` | medium | 8m | PVC `cache` in namespace `cka-storage-q002` explicitly requests StorageClass |
| `storage/volume-types-access-modes-reclaim-policies/q001` | medium | 6m | PVC `reports` in namespace `cka-storage-q003` remains `Pending` even though a |
| `storage/volume-types-access-modes-reclaim-policies/q002` | easy | 4m | PV `archive-pv` is bound to PVC `archive` in namespace `cka-storage-q004`. |
| `troubleshooting/cluster-components/q001` | medium | 7m | Pod `workload` in namespace `cka-cc-q001` remains `Pending` and has no assigned node. |
| `troubleshooting/cluster-components/q002` | medium | 8m | Deployment `web` in namespace `cka-cc-q002` requests three replicas, but its |
| `troubleshooting/cluster-components/q003` | hard | 10m | The Kubernetes API is unavailable on the control-plane node. |
| `troubleshooting/cluster-components/q004` | hard | 10m | The Kubernetes API is unavailable. Investigate the control plane and restore |
| `troubleshooting/container-output-streams/q001` | easy | 5m | Pod `worker` in namespace `cka-tr-q007` repeatedly restarts. |
| `troubleshooting/container-output-streams/q002` | medium | 7m | Deployment `observer` in namespace `cka-tr-q008` is Running, but its `sidecar` |
| `troubleshooting/resource-usage/q001` | medium | 6m | Deployment `processor` in namespace `cka-tr-q005` has no Ready replicas. |
| `troubleshooting/resource-usage/q002` | medium | 7m | Deployment `api` in namespace `cka-tr-q006` exists, but no application Pods are |
| `troubleshooting/services-networking/q001` | easy | 5m | Service `web` in namespace `cka-tr-q009` has no usable backend endpoints even |
| `troubleshooting/services-networking/q002` | medium | 6m | Service `web` in namespace `cka-tr-q010` has healthy endpoints, but requests |
| `troubleshooting/services-networking/q003` | medium | 8m | Namespace `cka-tr-q011` has a default-deny ingress policy. Pod `client` cannot |
| `workloads-scheduling/configmaps-secrets/q001` | easy | 5m | Deployment `greeter` in namespace `cka-ws-q003` cannot start its containers. |
| `workloads-scheduling/configmaps-secrets/q002` | medium | 6m | Pod `secret-reader` in namespace `cka-ws-q004` cannot mount Secret `credentials`. |
| `workloads-scheduling/deployments-rollouts-rollbacks/q001` | medium | 6m | Deployment `web` in namespace `cka-ws-q001` was recently updated and the rollout |
| `workloads-scheduling/deployments-rollouts-rollbacks/q002` | medium | 6m | Deployment `api` in namespace `cka-ws-q002` is configured with the wrong update |
| `workloads-scheduling/pod-admission-scheduling/q001` | medium | 7m | Pod `affinity-app` in namespace `cka-ws-q009` remains Pending because its required |
| `workloads-scheduling/pod-admission-scheduling/q002` | medium | 7m | Node `k8slab-node02` is intentionally tainted `dedicated=batch:NoSchedule`. |
| `workloads-scheduling/pod-admission-scheduling/q003` | medium | 7m | Deployment `memory-app` in namespace `cka-ws-q011` has no Pods because namespace |
| `workloads-scheduling/self-healing-workloads/q001` | easy | 5m | Deployment `web` in namespace `cka-ws-q007` continuously restarts otherwise healthy |
| `workloads-scheduling/self-healing-workloads/q002` | medium | 8m | Deployment `slow-app` in namespace `cka-ws-q008` needs about 20 seconds to finish |
| `workloads-scheduling/workload-autoscaling/q001` | easy | 5m | HPA `web` in namespace `cka-ws-q005` has incorrect scaling parameters. |
| `workloads-scheduling/workload-autoscaling/q002` | medium | 6m | Deployment `api` in namespace `cka-ws-q006` is targeted by CPU-based HPA `api`, |
