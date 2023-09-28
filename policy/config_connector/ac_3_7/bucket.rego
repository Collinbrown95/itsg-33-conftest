package config_connector.ac_3_7.bucket

deny_storage_bucket_without_access_control[msg] {
    # Define set of buckets
	buckets := {bucket |
		input[i].contents.kind == "StorageBucket"
		bucket := input[i].contents
	}
    # Define set of buckets that have a corresponding access control resource
	buckets_with_access_control := {bucket |
		input[i].contents.kind == "StorageBucket"
		input[j].contents.kind == "StorageBucketAccessControl"
		input[j].contents.spec.bucketRef.name == input[i].contents.metadata.name
		bucket := input[i].contents
	}
    # If number of elements in each set is not the same, then there exists a
    # bucket without an associated access control resource.
	count(buckets_with_access_control) != count(buckets)

	msg := "Exists at least one bucket without StorageBucketAccessControl. Remediation: Create a StorageBucketAccessControl resource and set `spec.bucketRef.name` to the bucket name."
}
