# Solution

Add a startup probe that checks the same startup marker but gives the process
enough time:

```yaml
startupProbe:
  exec:
    command: ["test", "-f", "/tmp/started"]
  periodSeconds: 5
  failureThreshold: 6
```

Keep the existing liveness probe. Kubernetes suppresses liveness checks until the
startup probe succeeds.
