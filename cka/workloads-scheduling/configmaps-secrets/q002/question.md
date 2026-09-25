# Question

Pod `secret-reader` in namespace `cka-ws-q004` cannot mount Secret `credentials`.

The Secret already contains the required key and must not be changed.

## Requirements

- Keep Secret `credentials`.
- Mount Secret key `password` at `/etc/secret/credential`.
- Pod must become Ready.
- File `/etc/secret/credential` must contain `s3cr3t`.

**Target time:** 6 minutes
