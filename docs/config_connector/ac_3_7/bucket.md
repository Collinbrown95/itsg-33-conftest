# AC-3 (7) Bucket

## Description

To comply with [AC-3 (7) Access Enforcement](https://esdc-devx.github.io/itsg33-yaml-explorer/), all storage buckets must have at least one associated access control policy.

This policy makes no assumptions about the details of role bindings specified in each `StorageBucketAccessControl` resource, as this is a project-specific implementation detail. The purpose of this policy is to check that `StorageBucketAccessControl` wasn't entirely omitted from a `StorageBucket` resource in error.

## Rego Policy

```bash
--8<-- "policy/config_connector/ac_3_7/bucket.rego"
```

## Test Cases

```bash
--8<-- "policy/config_connector/ac_3_7/bucket_test.rego"
```