package config_connector.ac_3_1.bucket

#  _            _         _                  
# | |_ ___  ___| |_    __| | ___ _ __  _   _ 
# | __/ _ \/ __| __|  / _` |/ _ \ '_ \| | | |
# | ||  __/\__ \ |_  | (_| |  __/ | | | |_| |
#  \__\___||___/\__|  \__,_|\___|_| |_|\__, |
#                                      |___/ 

# Expect deny if there are multiple StorageBucket resources present, and at least
# one of them has publicAccessPrevention disabled.
test_deny_if_any_sqlinstance_has_backup_disabled {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"spec": {"publicAccessPrevention": true},
		}},
		{"contents": {
			"kind": "StorageBucket",
			"spec": {"publicAccessPrevention": false},
		}},
	]
	count(deny_storagebucket_without_public_access_prevention) > 0 with input as cfg
}

# Expect deny if there are multiple StorageBucket resources present, and at least
# one of them does not specify publicAccessPrevention.
test_deny_if_any_sqlinstance_has_backup_disabled {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"spec": {"publicAccessPrevention": true},
		}},
		{"contents": {
			"kind": "StorageBucket",
			"spec": {},
		}},
	]
	count(deny_storagebucket_without_public_access_prevention) > 0 with input as cfg
}


#  _            _           _ _               
# | |_ ___  ___| |_    __ _| | | _____      __
# | __/ _ \/ __| __|  / _` | | |/ _ \ \ /\ / /
# | ||  __/\__ \ |_  | (_| | | | (_) \ V  V / 
#  \__\___||___/\__|  \__,_|_|_|\___/ \_/\_/  

# Expect allow if a non-StorageBucket resource is passed.

test_allow_if_resource_kind_is_not_sqlinstance {
	cfg := [
		{"contents": {
			"kind": "SQLInstance",
		}},
		{"contents": {
			"kind": "Notebook",
		}},
	]
	count(deny_storagebucket_without_public_access_prevention) == 0 with input as cfg
}

# Expect allow if **every** StorageBucket resource has publicAccessPrevention enabled.

test_allow_if_every_sqlinstance_has_backup_enabled {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"spec": {"publicAccessPrevention": true},
		}},
		{"contents": {
			"kind": "StorageBucket",
			"spec": {"publicAccessPrevention": true},
		}},
	]
	count(deny_storagebucket_without_public_access_prevention) == 0 with input as cfg
}
