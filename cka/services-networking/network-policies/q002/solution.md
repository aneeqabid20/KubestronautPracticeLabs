# Solution

Use one `from` peer containing **both** selectors so they are ANDed:

```yaml
from:
- namespaceSelector:
    matchLabels:
      team: blue
  podSelector:
    matchLabels:
      role: frontend
```

Add TCP port 80 and select the API Pods.
