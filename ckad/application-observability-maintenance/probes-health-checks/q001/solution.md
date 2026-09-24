# Solution

## 1. Inspect the Pods

```bash
kubectl -n ckad-q001 get pods
```

The Pods should be `Running` but show `0/1` in the READY column.

## 2. Inspect one Pod

```bash
kubectl -n ckad-q001 describe pod <pod-name>
```

Review the readiness probe events. The HTTP readiness check is failing.

## 3. Inspect the Deployment

```bash
kubectl -n ckad-q001 get deploy web-app -o yaml
```

The nginx container uses a readiness probe with a path that does not return a
successful HTTP response.

## 4. Correct the probe

One efficient approach:

```bash
kubectl -n ckad-q001 edit deployment web-app
```

Change:

```yaml
path: /wrong-health
```

to a valid path served by this container, for example:

```yaml
path: /
```

Keep the readiness probe in place.

## 5. Validate

```bash
kubectl -n ckad-q001 rollout status deployment/web-app
kubectl -n ckad-q001 get pods
./practice verify ckad/application-observability-maintenance/probes-health-checks/q001
```

All three replicas should become Ready.
