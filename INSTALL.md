# Install the complete CKA content overlay

This package contains the remaining CKA question bank and shared support files.
It is designed to be extracted into an existing `KubestronautPracticeLabs`
repository that already contains the validated
`cka/troubleshooting/clusters-nodes/q001` through `q005`.

## Install

From the root of the Git repository:

```bash
unzip KubestronautPracticeLabs-CKA-pending-final.zip -d /tmp/kpl-cka
cp -a /tmp/kpl-cka/KubestronautPracticeLabs-CKA-final/. .
```

Make scripts executable:

```bash
find cka -type f \( -name setup.sh -o -name verify.sh -o -name reset.sh \) -exec chmod +x {} \;
chmod +x lib/dependencies.sh tools/validate-cka-artifacts.py
```

Apply the reset recovery framework change once:

```bash
git apply patches/practice-reset-api-recovery.patch
```

If Git reports that the patch was already applied, inspect `practice`. The intended
change is only that `cmd_reset()` no longer calls `require_cluster_access` before
the per-question `reset.sh`. Setup and verify still require normal API access.


## Preflight

After copying the overlay into the repository, run:

```bash
./tools/preflight-cka.sh
python3 tools/validate-cka-artifacts.py
./practice list cka
```

The preflight checks the live lab prerequisites; the Python validator checks the
question-bank structure and static safety rules.

## Validate

```bash
python3 tools/validate-cka-artifacts.py
./practice list cka
```

## Shared dependencies

Storage labs install a repository-owned Local Path Provisioner
(`kpl-local-path`) on first use.

Gateway API labs install the upstream v1.6.2 Standard CRDs on first use. Those
labs validate Gateway API object configuration and do not assume a Gateway data
plane/controller is installed.

Some labs require:
- `helm` (Helm topic)
- `openssl` (TLS Ingress lab)
- `kubeadm`, `crictl`, systemd and passwordless sudo on the control-plane
- controller-to-worker passwordless SSH, already provided by the infrastructure lab
