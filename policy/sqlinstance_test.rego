package main


test_deny_sqlinstance_if_backup_is_disabled {
    cfg := {
        "kind": "SQLInstance",
        "metadata": {
            "name": "sqlinstance"
        },
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

test_not_deny_sqlinstance_if_backup_is_enabled {
    cfg := {
        "kind": "SQLInstance",
        "metadata": {
            "name": "sqlinstance"
        },
        "spec": {
            "settings": {
                "backupConfiguration": {
                    "enabled": true
                }
            }
        }
    }
    count(deny_sqlinstance_backup_disabled) == 0 with input as cfg
}