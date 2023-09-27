package config_connector.cp_9.sqlinstance

#  _            _         _                  
# | |_ ___  ___| |_    __| | ___ _ __  _   _ 
# | __/ _ \/ __| __|  / _` |/ _ \ '_ \| | | |
# | ||  __/\__ \ |_  | (_| |  __/ | | | |_| |
#  \__\___||___/\__|  \__,_|\___|_| |_|\__, |
#                                      |___/ 

# Expect deny if there are multiple SQLInstance resources present, and at least
# one of them has backupConfiguration disabled.
test_deny_if_any_sqlinstance_has_backup_disabled {
	cfg := [
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {"backupConfiguration": {"enabled": true}}},
		}},
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {"backupConfiguration": {"enabled": false}}},
		}},
	]
	count(deny_sqlinstance_backup_disabled) > 0 with input as cfg
}

# Expect deny if there are multiple SQLInstance resources present, and at least
# one of them does not specify the full path to backupConfiguration.

test_deny_if_any_sqlinstance_has_path_to_backup_unspecified {
	cfg := [
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {}},
		}},
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {"backupConfiguration": {"enabled": true}}},
		}},
	]
	count(deny_sqlinstance_backup_disabled) > 0 with input as cfg
}

#  _            _           _ _               
# | |_ ___  ___| |_    __ _| | | _____      __
# | __/ _ \/ __| __|  / _` | | |/ _ \ \ /\ / /
# | ||  __/\__ \ |_  | (_| | | | (_) \ V  V / 
#  \__\___||___/\__|  \__,_|_|_|\___/ \_/\_/  

# Expect allow if a non-SQLInstance resource is passed.

test_allow_if_resource_kind_is_not_sqlinstance {
	cfg := [
		{"contents": {
			"kind": "Bucket",
		}},
		{"contents": {
			"kind": "Notebook",
		}},
	]
	count(deny_sqlinstance_backup_disabled) == 0 with input as cfg
}

# Expect allow if **every** SQLInstance resource has backupConfiguration enabled.

test_allow_if_every_sqlinstance_has_backup_enabled {
	cfg := [
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {"backupConfiguration": {"enabled": true}}},
		}},
		{"contents": {
			"kind": "SQLInstance",
			"metadata": {"name": "sqlinstance"},
			"spec": {"settings": {"backupConfiguration": {"enabled": true}}},
		}},
	]
	count(deny_sqlinstance_backup_disabled) == 0 with input as cfg
}
