# AC-3 (1) Bucket

## Description

To comply with [AC-3 (1) Access Enforcement](https://esdc-devx.github.io/itsg33-yaml-explorer/), all storage buckets must have `spec.publicAccessPrevention` set to `true`.

## Rego Policy

```bash
--8<-- "policy/config_connector/ac_3_1/bucket.rego"
```

## Test Cases

```bash
--8<-- "policy/config_connector/ac_3_1/bucket_test.rego"
```