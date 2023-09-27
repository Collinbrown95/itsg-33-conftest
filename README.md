# Conftest Policy as Code Prototype

The purpose of this repository is to use conftest to implement policy as code for gcp infrastructure provisioned with config connector.

## How to Use

**Example**

- The `--policy ./policy` part is implicit, but you can point to policies defined in other folders.

```bash
conftest test input.yaml --policy ./policy [--output table] [--all-namespaces]
```

**Output**

```bash
 $ conftest test input.yaml
FAIL - input.yaml - main - 
    """
    [CP-9 | Information System Backup] (TODO: Link to docs)
    SQLInstance sqluser-dep does not have backup enabled.
    
    Remediation: 'spec.settings.backupConfiguration.enabled': true.
    """
    

1 test, 0 passed, 0 warnings, 1 failure, 0 exceptions
```

## Conftest Semantics

Each line of a `deny_*` rule specifies a boolean condition. If `line 1` AND `line 2` AND ... `line N` == `true`, then this indicates a sufficient condition to deny the input.

**Example**

```go
package main


deny_sqlinstance_backup_disabled[msg] {
  # condition 1
  input.kind == "SQLInstance"
  # condition 2
  not input.spec.settings.backupConfiguration.enabled == true
  
  # error message printed to the user, indicating how to remediate the issue
  msg = sprintf(`
    """
    [CP-9 | Information System Backup] (TODO: Link to docs)
    SQLInstance %v does not have backup enabled.
    
    Remediation: 'spec.settings.backupConfiguration.enabled': true.
    """
    `,
    [input.metadata.name])
}
```

## Unit Testing Conftest Tests

Unit tests are run by running `conftest verify`.

By creating a `.rego` file called `<instance-name>_test.rego` in the same package as the `.rego` file under test, you can define a number of test cases that should allow/deny depending on the input passed.

Since rules are prefixed with `deny_*`, we can unit test one rule at a time.

The semantics of a unit test is that the `count()` of a rule should be `== 0` if there was not a violation, and `> 0` if there was a violation.

**Example**

```go
test_deny_sqlinstance_if_backup_not_specified {
    cfg := {
        "kind": "SQLInstance",
        "metadata": {
            "name": "sqlinstance"
        },
        "spec": {
            "settings": {}
        }
    }
    count(deny_sqlinstance_backup_disabled) > 0 with input as cfg
}
```