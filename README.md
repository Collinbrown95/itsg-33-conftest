# Conftest Policy as Code Prototype

The purpose of this repository is to use conftest to implement policy as code for gcp infrastructure provisioned with config connector.

## How to Use

**Example**

- The `--policy ./policy` part is implicit, but you can point to policies defined in other folders.

```bash
conftest test input.yaml --policy ./policy
```

**Output**

```bash
FAIL - input.yaml - main - 
    [CP-9] SQLInstance sqluser-dep should have backup enabled, but did not.
    This can be remediated by setting spec.settings.backupConfiguration.enabled = true
    
FAIL - input.yaml - main - 
    [PE-18] SQLInstance sqluser-dep should be in Canadian data centre, but is not.
    This can be remediated by setting spec.region to one of ["northamerica-northeast1", "northamerica-northeast2"].
    

2 tests, 0 passed, 0 warnings, 2 failures, 0 exceptions
```