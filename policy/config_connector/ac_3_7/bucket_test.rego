package config_connector.ac_3_7.bucket

#  _            _         _
# | |_ ___  ___| |_    __| | ___ _ __  _   _
# | __/ _ \/ __| __|  / _` |/ _ \ '_ \| | | |
# | ||  __/\__ \ |_  | (_| |  __/ | | | |_| |
#  \__\___||___/\__|  \__,_|\___|_| |_|\__, |
#                                      |___/

# Expect deny if any storage bucket doesn't have an associated
# StorageBucketAccessControl resource attached to it.
test_deny_if_any_bucket_without_access_control {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket1"},
		}},
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket2"},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {"bucketRef": {"name": "bucket1"}},
		}},
	]
	count(deny_storage_bucket_without_access_control) > 0 with input as cfg
}

# Expect deny if any StorageBucketAccessControl resource exists but
# doesn't specify a bucket attached to it.
test_deny_if_bucket_access_policy_exists_but_does_not_ref_bucket {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket1"},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {},
		}},
	]
	count(deny_storage_bucket_without_access_control) > 0 with input as cfg
}


#  _            _           _ _
# | |_ ___  ___| |_    __ _| | | _____      __
# | __/ _ \/ __| __|  / _` | | |/ _ \ \ /\ / /
# | ||  __/\__ \ |_  | (_| | | | (_) \ V  V /
#  \__\___||___/\__|  \__,_|_|_|\___/ \_/\_/

# Expect allow if no StorageBucket resource is passed.
test_allow_if_resource_kind_is_not_sqlinstance {
	cfg := [
		{"contents": {"kind": "SQLInstance"}},
		{"contents": {"kind": "Notebook"}},
	]
	count(deny_storage_bucket_without_access_control) == 0 with input as cfg
}

# Expect allow if **every** StorageBucket resource has an accompanying
# StorageBucketAccessControl resource attached to it.
test_allow_if_every_bucket_has_access_control {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket1"},
		}},
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket2"},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {"bucketRef": {"name": "bucket1"}},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {"bucketRef": {"name": "bucket2"}},
		}},
	]
	count(deny_storage_bucket_without_access_control) == 0 with input as cfg
}

# Expect allow if there is more than one StorageBucketAccessControl policy for
# a single bucket
test_allow_if_one_bucket_has_many_access_control_policies {
	cfg := [
		{"contents": {
			"kind": "StorageBucket",
			"metadata": {"name": "bucket1"},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {"bucketRef": {"name": "bucket1"}},
		}},
		{"contents": {
			"kind": "StorageBucketAccessControl",
			"spec": {"bucketRef": {"name": "bucket1"}},
		}},
	]
	count(deny_storage_bucket_without_access_control) == 0 with input as cfg
}
