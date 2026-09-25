# Solution

Inspect the ClusterRole:

```bash
kubectl get clusterrole kpl-node-reader -o yaml
```

Remove the rule granting access to `secrets`, while preserving the Node read rule.
Validate with `kubectl auth can-i`.
