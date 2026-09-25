#!/usr/bin/env python3
from pathlib import Path
import subprocess, sys, yaml, re, os
ROOT = Path(__file__).resolve().parents[1]
CKA = ROOT / "cka"
required = {"metadata.yaml","question.md","setup.sh","verify.sh","reset.sh","solution.md"}

official = {
    "Storage": {
        "Implement storage classes and dynamic volume provisioning": 2,
        "Configure volume types, access modes and reclaim policies": 2,
        "Manage persistent volumes and persistent volume claims": 2,
    },
    "Troubleshooting": {
        "Troubleshoot clusters and nodes": 5,
        "Troubleshoot cluster components": 4,
        "Monitor cluster and application resource usage": 2,
        "Manage and evaluate container output streams": 2,
        "Troubleshoot services and networking": 3,
    },
    "Workloads & Scheduling": {
        "Understand application deployments and how to perform rolling update and rollbacks": 2,
        "Use ConfigMaps and Secrets to configure applications": 2,
        "Configure workload autoscaling": 2,
        "Understand the primitives used to create robust, self-healing, application deployments": 2,
        "Configure Pod admission and scheduling (limits, node affinity, etc.)": 3,
    },
    "Cluster Architecture, Installation & Configuration": {
        "Manage role based access control (RBAC)": 2,
        "Prepare underlying infrastructure for installing a Kubernetes cluster": 2,
        "Create and manage Kubernetes clusters using kubeadm": 2,
        "Manage the lifecycle of Kubernetes clusters": 2,
        "Implement and configure a highly-available control plane": 2,
        "Use Helm and Kustomize to install cluster components": 2,
        "Understand extension interfaces (CNI, CSI, CRI, etc.)": 2,
        "Understand CRDs, install and configure operators": 2,
    },
    "Services & Networking": {
        "Understand connectivity between Pods": 2,
        "Define and enforce Network Policies": 2,
        "Use ClusterIP, NodePort, LoadBalancer service types and endpoints": 3,
        "Use the Gateway API to manage Ingress traffic": 2,
        "Know how to use Ingress controllers and Ingress resources": 2,
        "Understand and use CoreDNS": 2,
    },
}
expected_total = sum(sum(x.values()) for x in official.values())
errors=[]; warnings=[]; ids=set(); actual={}
metas=sorted(CKA.rglob("metadata.yaml"))

if len(metas) != expected_total:
    errors.append(f"Expected {expected_total} CKA labs, found {len(metas)}")

for m in metas:
    q=m.parent
    files={p.name for p in q.iterdir() if p.is_file()}
    missing=required-files
    if missing: errors.append(f"{q.relative_to(ROOT)} missing {sorted(missing)}")
    try:
        d=yaml.safe_load(m.read_text())
    except Exception as e:
        errors.append(f"{m}: metadata YAML: {e}"); continue

    for k in ["id","certification","domain","domain_weight","topic","difficulty","time_target","type","scope","destructive"]:
        if k not in d: errors.append(f"{m}: missing {k}")

    ident=d.get("id")
    if ident in ids: errors.append(f"duplicate id: {ident}")
    ids.add(ident)
    if d.get("certification")!="CKA": errors.append(f"{m}: certification != CKA")
    if d.get("type")!="performance": errors.append(f"{m}: type != performance")
    if d.get("difficulty") not in {"easy","medium","hard"}: errors.append(f"{m}: invalid difficulty")
    dom,topic=d.get("domain"),d.get("topic")
    if dom not in official or topic not in official.get(dom,{}):
        errors.append(f"{m}: non-official domain/topic: {dom} / {topic}")
    else:
        actual[(dom,topic)]=actual.get((dom,topic),0)+1

    if d.get("destructive") is True and "recovery" not in d:
        errors.append(f"{m}: destructive lab lacks recovery metadata")

    qtext=(q/"question.md").read_text()
    if "Target time:" not in qtext: errors.append(f"{q}: question missing target time")
    if len(qtext.strip())<100: warnings.append(f"{q}: short question")

    for s in ["setup.sh","verify.sh","reset.sh"]:
        p=q/s
        if not os.access(p,os.X_OK): errors.append(f"{p}: not executable")
        r=subprocess.run(["bash","-n",str(p)],capture_output=True,text=True)
        if r.returncode: errors.append(f"{p}: bash -n: {r.stderr.strip()}")
        t=p.read_text()
        if re.search(r"\bwsl\.exe\b|\bpowershell\b|/mnt/c/",t,re.I):
            errors.append(f"{p}: Windows-specific dependency")
        if re.search(r"\bkubeadm\s+reset\b",t):
            errors.append(f"{p}: forbidden kubeadm reset")
        if re.search(r"rm\s+-rf\s+/(?:etc|var|run|home)(?:/|\s|$)",t):
            errors.append(f"{p}: dangerous root-tree removal pattern")

    rdir=q/"resources"
    if rdir.exists():
        for yp in list(rdir.rglob("*.yaml"))+list(rdir.rglob("*.yml")):
            text=yp.read_text()
            if "{{" in text or "}}" in text: # Helm template
                continue
            try: list(yaml.safe_load_all(text))
            except Exception as e: errors.append(f"{yp}: YAML: {e}")

for dom,topics in official.items():
    for topic,count in topics.items():
        got=actual.get((dom,topic),0)
        if got!=count: errors.append(f"{dom} / {topic}: expected {count}, got {got}")

patch=(ROOT/"patches/practice-reset-api-recovery.patch")
if not patch.exists() or "-  require_cluster_access" not in patch.read_text():
    errors.append("practice reset API-recovery patch missing/incorrect")
if not (ROOT/"lib/dependencies.sh").exists(): errors.append("lib/dependencies.sh missing")
if not (ROOT/"dependencies/local-path-provisioner.yaml").exists(): errors.append("local-path provisioner manifest missing")
deps=(ROOT/"lib/dependencies.sh").read_text()
if "v1.6.2" not in deps: errors.append("Gateway API dependency is not pinned to verified v1.6.2")

print(f"Validated {len(metas)} CKA labs")
print(f"Unique IDs: {len(ids)}")
print(f"Official competencies covered: {len(actual)}")
print(f"Warnings: {len(warnings)}")
for w in warnings: print("WARN:",w)
if errors:
    print(f"ERRORS: {len(errors)}")
    for e in errors: print("ERROR:",e)
    sys.exit(1)
print("RESULT: PASS")
