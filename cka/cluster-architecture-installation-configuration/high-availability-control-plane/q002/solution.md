# Solution

A control-plane join command has this shape:

```bash
kubeadm join k8s-ha.example.local:6443 \
  --token abcdef.0123456789abcdef \
  --discovery-token-ca-cert-hash sha256:<64-hex-digest> \
  --control-plane \
  --certificate-key <64-hex-key>
```

Useful commands include:

```bash
kubeadm certs certificate-key
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt |
  openssl rsa -pubin -outform der 2>/dev/null |
  openssl dgst -sha256 -hex | sed 's/^.* //'
```

The command is written to the file only; do not execute it in this lab.
