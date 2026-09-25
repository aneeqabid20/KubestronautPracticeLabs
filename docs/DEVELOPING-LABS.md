# Developing Labs

## Design workflow

1. Confirm the current official certification curriculum.
2. Select one official domain.
3. Select one official competency.
4. Design scenarios that test distinct skills rather than repetitive variants.
5. Implement the question contract.
6. Run static validation.
7. Runtime-test the lab on the target cluster.
8. Confirm reset and repeatability.
9. Commit only after validation.

## Question quality rules

Prefer tasks that require the learner to:

- inspect current state;
- identify evidence;
- make a targeted change;
- validate the outcome.

Avoid trivia questions or failures whose answer is exposed directly in the
candidate-visible wording.

## Runtime validation standard

Every question should eventually pass:

```text
healthy baseline
→ setup
→ intended start/broken state
→ manual solve
→ verify
→ reset
→ healthy baseline
→ setup again
```

For cluster-wide/destructive questions, explicitly test the emergency reset path
without solving the scenario first.

## Certification maintenance

Whenever Linux Foundation changes an exam:

1. update `docs/CURRICULUM.md`;
2. review the directory taxonomy;
3. identify obsolete/missing competencies;
4. update question metadata and coverage documents;
5. rerun static and runtime validation.
