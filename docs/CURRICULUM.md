# Official Curriculum Mapping

Research date: **2026-09-25**

Source of truth: Linux Foundation certification pages.

The repository hierarchy follows:

```text
certification / official-domain / official-competency-topic / question
```

The mapping should be reviewed whenever Linux Foundation changes domains,
weights, competencies, or the Kubernetes exam version.

## CKA — Kubernetes v1.35

Current repository status: **62 labs covering all 27 listed competencies**.

### Storage — 10%

- Implement storage classes and dynamic volume provisioning
- Configure volume types, access modes and reclaim policies
- Manage persistent volumes and persistent volume claims

### Troubleshooting — 30%

- Troubleshoot clusters and nodes
- Troubleshoot cluster components
- Monitor cluster and application resource usage
- Manage and evaluate container output streams
- Troubleshoot services and networking

### Workloads & Scheduling — 15%

- Understand application deployments and how to perform rolling update and rollbacks
- Use ConfigMaps and Secrets to configure applications
- Configure workload autoscaling
- Understand the primitives used to create robust, self-healing application deployments
- Configure Pod admission and scheduling (limits, node affinity, etc.)

### Cluster Architecture, Installation & Configuration — 25%

- Manage role based access control (RBAC)
- Prepare underlying infrastructure for installing a Kubernetes cluster
- Create and manage Kubernetes clusters using kubeadm
- Manage the lifecycle of Kubernetes clusters
- Implement and configure a highly-available control plane
- Use Helm and Kustomize to install cluster components
- Understand extension interfaces (CNI, CSI, CRI, etc.)
- Understand CRDs, install and configure operators

### Services & Networking — 20%

- Understand connectivity between Pods
- Define and enforce Network Policies
- Use ClusterIP, NodePort, LoadBalancer service types and endpoints
- Use the Gateway API to manage Ingress traffic
- Know how to use Ingress controllers and Ingress resources
- Understand and use CoreDNS

Official source:
https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/

## CKAD — Kubernetes v1.35

Current repository status: framework/sample content only; full CKAD bank not yet built.

### Application Design and Build — 20%

- Define, build and modify container images
- Choose and use the right workload resource (Deployment, DaemonSet, CronJob, etc.)
- Understand multi-container Pod design patterns
- Utilize persistent and ephemeral volumes

### Application Deployment — 20%

- Use Kubernetes primitives to implement common deployment strategies
- Understand Deployments and how to perform rolling updates
- Use the Helm package manager to deploy existing packages
- Kustomize

### Application Observability and Maintenance — 15%

- Understand API deprecations
- Implement probes and health checks
- Use built-in CLI tools to monitor Kubernetes applications
- Utilize container logs
- Debugging in Kubernetes

### Application Environment, Configuration and Security — 25%

- Discover and use resources that extend Kubernetes
- Understand authentication, authorization and admission control
- Understand requests, limits and quotas
- Understand ConfigMaps
- Define resource requirements
- Create and consume Secrets
- Understand ServiceAccounts
- Understand Application Security

### Services and Networking — 20%

- Demonstrate basic understanding of NetworkPolicies
- Provide and troubleshoot access to applications via Services
- Use Ingress rules to expose applications

Official source:
https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/

## CKS — Kubernetes v1.35

Current repository status: topic hierarchy only; full CKS bank not yet built.

### Cluster Setup — 15%

- Use Network security policies to restrict cluster-level access
- Use CIS benchmark to review Kubernetes component security
- Properly set up Ingress with TLS
- Protect node metadata and endpoints
- Verify platform binaries before deploying

### Cluster Hardening — 15%

- Use RBAC to minimize exposure
- Exercise caution with service accounts and minimize permissions
- Restrict access to the Kubernetes API
- Upgrade Kubernetes to avoid vulnerabilities

### System Hardening — 10%

- Minimize host OS footprint
- Use least-privilege identity and access management
- Minimize external network access
- Appropriately use AppArmor and seccomp

### Minimize Microservice Vulnerabilities — 20%

- Use appropriate Pod Security Standards
- Manage Kubernetes Secrets
- Understand and implement isolation techniques
- Implement Pod-to-Pod encryption

### Supply Chain Security — 20%

- Minimize base image footprint
- Understand the software supply chain
- Secure registries and validate artifacts
- Perform static analysis of workloads and images

### Monitoring, Logging and Runtime Security — 20%

- Perform behavioral analytics
- Detect threats
- Investigate phases of attack and bad actors
- Ensure runtime container immutability
- Use Kubernetes audit logs

Official source:
https://training.linuxfoundation.org/certification/certified-kubernetes-security-specialist/
