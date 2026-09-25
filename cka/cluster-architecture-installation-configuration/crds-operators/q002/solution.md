# Solution

Inspect the ClusterRole and discover the CRD resource name:

```bash
kubectl get crd widgets.kpl.example
kubectl get clusterrole kpl-widget-operator -o yaml
```

Change the resource from `gadgets` to `widgets` and preserve only
`get,list,watch`.
