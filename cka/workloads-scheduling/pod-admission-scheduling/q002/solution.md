# Solution

Inspect the node taint and Pod events, then recreate/edit the Pod manifest with:

```yaml
tolerations:
- key: dedicated
  operator: Equal
  value: batch
  effect: NoSchedule
```

Keep its node selector for `k8slab-node02`.
