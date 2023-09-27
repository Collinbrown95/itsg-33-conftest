package config_connector.ac_3_1.bucket

deny_storagebucket_without_public_access_prevention[msg] {
    # There exists some `i`
    some i
    # Such that the `i`th resource is a StorageBucket manifest
    input[i].contents.kind == "StorageBucket"
    # And it is not the case that public access prevention is enabled
    not input[i].contents.spec.publicAccessPrevention == true

    # Error message with remediation
    msg = "Public Access Prevension is not enabled. Remediation: set `spec.publicAccessPrevention: true`"
}