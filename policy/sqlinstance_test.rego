package main


test_deny_sqlinstance_if_backup_disabled {
    cfg := {
        "kind": "SQLInstance",
        "spec": {
            "settings": {
                "backupConfiguration": {
                    "enabled": false
                }
            }
        }
    }
  count(deny_sqlinstance_backup_disabled) > 0 with input as cfg
}