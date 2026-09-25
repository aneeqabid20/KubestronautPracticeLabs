# CKA — Troubleshooting — Troubleshoot clusters and nodes

Official mapping:
- Certification: CKA
- Domain: Troubleshooting
- Domain weight: 30%
- Competency: Troubleshoot clusters and nodes

This topic contains a compact progression of node-focused performance labs.

| Question | Difficulty | Target | Scenario |
|---|---|---:|---|
| q001 | Easy | 5m | kubelet stopped on node01 |
| q002 | Medium | 7m | containerd stopped on node02 |
| q003 | Medium | 8m | malformed kubelet configuration on node01 |
| q004 | Medium | 8m | invalid kubelet startup flag on node02 |
| q005 | Hard | 10m | kubelet configured with an unreachable API server endpoint on node01 |

q001 and q002 already exist in the repository. This batch adds q003–q005.

Design rule: the candidate-visible question states the symptom and required end state,
but does not reveal the injected root cause.
