# CP_9 SQLInstance

## Description

To comply with [CP-9 Informaton System Backup], all `SQLInstance` resources must have `spec.settings.backupConfiguration.enabled` set to `true`.

## Rego Policy

```bash
--8<-- "policy/config_connector/cp_9/sqlinstance.rego"
```

## Test Cases

```bash
--8<-- "policy/config_connector/cp_9/sqlinstance_test.rego"
```