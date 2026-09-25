# Solution

Create the static PV:

```bash
cat <<'YAML' | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: media-pv
spec:
  capacity:
    storage: 2Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: media-static
  hostPath:
    path: /opt/kpl/media
YAML
```

Then confirm `media` is Bound.
