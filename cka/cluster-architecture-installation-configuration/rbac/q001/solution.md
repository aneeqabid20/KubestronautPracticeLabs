# Solution

Inspect the RoleBinding subject:

```bash
kubectl -n cka-ca-q001 get role,rolebinding -o yaml
kubectl auth can-i get pods --as=system:serviceaccount:cka-ca-q001:auditor -n cka-ca-q001
```

Edit `auditor-read` so its ServiceAccount subject is named `auditor` in namespace
`cka-ca-q001`.
