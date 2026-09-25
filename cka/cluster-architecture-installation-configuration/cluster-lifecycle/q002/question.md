# Question

Renew the client certificate embedded in `/etc/kubernetes/admin.conf` using kubeadm.

## Requirements

- Use kubeadm certificate renewal.
- Renew `admin.conf` only.
- Do not regenerate the cluster CA.
- The renewed certificate serial must differ from the starting certificate.

**Target time:** 7 minutes
