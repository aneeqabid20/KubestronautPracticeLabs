# Solution

Because Pod affinity fields are effectively part of the immutable Pod spec,
export/recreate the Pod (or use a manifest) with required node affinity:

```yaml
matchExpressions:
- key: kubernetes.io/hostname
  operator: In
  values: [k8slab-node01]
```

Do not set `nodeName`.
