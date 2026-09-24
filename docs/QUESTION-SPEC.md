# Question Specification

Each performance lab lives at:

`<certification>/<domain>/<topic>/qNNN/`

Required files:

- `metadata.yaml`
- `question.md`
- `setup.sh`
- `verify.sh`
- `reset.sh`
- `solution.md`
- optional `resources/`

## Metadata

Required top-level fields:

```yaml
id: ckad-application-observability-probes-q001
certification: CKAD
domain: Application Observability and Maintenance
domain_weight: 15
topic: Implement probes and health checks
difficulty: easy
time_target: 5m
type: performance
scope: namespace
namespace: ckad-q001
destructive: false
```

Supported scope values:

- `namespace`
- `cluster`
- `node`

Normal labs should prefer namespace scope.

## Setup contract

`setup.sh` must:

1. create only scenario-owned resources;
2. create the intended starting/broken state;
3. wait until that state exists;
4. validate that the scenario is ready;
5. never reveal the solution.

## Verify contract

`verify.sh` validates the required end state, not the learner's exact command history.
Multiple technically valid solutions should pass unless the question explicitly
constrains the method.

## Reset contract

`reset.sh` removes only scenario-owned resources and must be safe to run repeatedly.

## Exit codes

- 0: successful/pass
- non-zero: error/fail
