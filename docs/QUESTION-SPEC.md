# Question Specification

Each performance lab lives at:

```text
<certification>/<domain>/<topic>/qNNN/
```

Required files:

```text
metadata.yaml
question.md
setup.sh
verify.sh
reset.sh
solution.md
```

Optional:

```text
resources/
```

## Metadata contract

Typical metadata:

```yaml
id: cka-troubleshooting-clusters-nodes-q001
certification: CKA
domain: Troubleshooting
domain_weight: 30
topic: Troubleshoot clusters and nodes
difficulty: easy
time_target: 5m
type: performance
scope: node
destructive: false
```

Additional fields may be used when relevant:

```yaml
namespace: cka-q001
target_node: k8slab-node01
target_component: kube-apiserver
recovery: local-static-pod-manifest

skills:
  - kubectl
  - troubleshooting
  - kubelet
```

## Scope

Supported conceptual scopes:

- `namespace`
- `cluster`
- `node`

Namespace scope should be preferred whenever the skill can be tested without
changing shared cluster state.

## `question.md`

Contains only information the learner should receive.

It should:

- describe the observable problem;
- state the required end state;
- state meaningful constraints;
- include a target time;
- avoid revealing the injected root cause unless the task requires a specific fix.

## `setup.sh`

Setup must:

1. check prerequisites/baseline;
2. clean or safely handle remnants from a previous attempt;
3. create scenario-owned resources;
4. inject the intended condition/fault;
5. wait until the expected starting state exists;
6. validate that starting state;
7. fail safely and restore the baseline if preparation cannot complete.

Setup must never solve the question for the learner.

## `verify.sh`

Verification evaluates **resulting state**, not command history.

Where multiple solutions satisfy the requirements, all valid solutions should pass.

Examples:

- replicas actually Ready;
- node actually Ready;
- Service actually has correct endpoints;
- API server actually healthy;
- NetworkPolicy actually permits/denies the required traffic.

## `reset.sh`

Reset must be repeatable and limited to scenario-owned changes.

For disruptive labs, reset must be capable of restoring the affected component
even when the Kubernetes API itself is unavailable. The top-level `practice`
command therefore delegates recovery logic to the question's `reset.sh`.

## Safety metadata

`destructive: true` means the question intentionally disrupts shared cluster
operation or a control-plane/node component.

Such questions require:

- explicit backup/restore logic;
- a tested recovery path;
- no dependence on Kubernetes API availability if the scenario intentionally breaks it;
- clear isolation from unrelated infrastructure.

## Exit codes

- `0` — setup/reset success or verification PASS
- non-zero — preparation/recovery failure or verification FAIL
