# Solution

Keep the existing default deny and add an allow policy:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-api-clients
  namespace: cka-tr-q011
spec:
  podSelector:
    matchLabels:
      app: api
  policyTypes: [Ingress]
  ingress:
    - from:
        - podSelector:
            matchLabels:
              access: api
      ports:
        - protocol: TCP
          port: 80
```

Apply it and test from both client Pods.
