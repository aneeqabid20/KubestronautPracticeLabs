# Question

Ingress `secure-web` in namespace `cka-net-q011` must terminate TLS for
`secure.kpl.local`.

Certificate and key files are available at:
- `/tmp/cka-net-q011/tls.crt`
- `/tmp/cka-net-q011/tls.key`

Configure TLS.

## Requirements

- Create TLS Secret `web-tls` from the provided files.
- Ingress TLS host must be `secure.kpl.local`.
- Ingress must reference Secret `web-tls`.
- Preserve existing backend Service `web:80`.

**Target time:** 8 minutes
