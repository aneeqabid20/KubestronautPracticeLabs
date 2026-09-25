# Solution

CPU utilization HPA calculations require CPU requests on the target Pods.

```bash
kubectl -n cka-ws-q006 set resources deployment api   --requests=cpu=100m --limits=cpu=500m
```

Confirm the HPA still targets 70%.
