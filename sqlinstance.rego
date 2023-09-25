package main

name := input.metadata.name

regionList := ["northamerica-northeast1", "northamerica-northeast2"]

contains(validRegions, region) {
    validRegions[_] = region
}

deny[msg] {
    input.kind == "SQLInstance"
    input.spec.settings.backupConfiguration.enabled == false
    msg = sprintf(`
    [CP-9] SQLInstance %s should have backup enabled, but did not.
    This can be remediated by setting spec.settings.backupConfiguration.enabled = true
    `, [name])    
}

deny[msg] {
    input.kind == "SQLInstance"
    not contains(regionList, input.spec.region)
    msg = sprintf(`
    [PE-18] SQLInstance %s should be in Canadian data centre, but is not.
    This can be remediated by setting spec.region to one of %s.
    `, [name, regionList])
}

