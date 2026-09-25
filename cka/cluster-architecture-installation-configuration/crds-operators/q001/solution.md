# Solution

Read the CRD schema:

```bash
kubectl get crd widgets.kpl.example -o yaml
```

Edit `/tmp/cka-ca-q014/widget.yaml` so `spec.size` is the integer `3`, then apply it.
