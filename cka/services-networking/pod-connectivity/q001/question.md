# Question

Pod `client` on `k8slab-node02` cannot connect to Pod `server` on
`k8slab-node01` using the server Pod IP on TCP port 8080.

The cluster network itself is healthy. Repair the server process so it accepts
Pod-network connections.

## Requirements

- Keep `server` on node01 and `client` on node02.
- Server must listen on port `8080` on its Pod interface, not loopback only.
- Client must successfully fetch `http://<server-pod-ip>:8080`.

**Target time:** 7 minutes
