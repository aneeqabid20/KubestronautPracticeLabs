# Solution

Add a NetworkPolicy selecting `app=api` with one ingress rule from Pods
`role=client` and port TCP/80. Keep the default-deny policy.
