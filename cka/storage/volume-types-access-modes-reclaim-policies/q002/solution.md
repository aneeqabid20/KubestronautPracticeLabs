# Solution

```bash
kubectl get pv archive-pv
kubectl patch pv archive-pv -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
./practice verify cka/storage/volume-types-access-modes-reclaim-policies/q002
```
