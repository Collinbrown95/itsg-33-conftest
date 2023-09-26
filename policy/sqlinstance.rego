package main


deny_sqlinstance_backup_disabled[msg] {

  input.kind == "SQLInstance"
  not input.spec.settings.backupConfiguration.enabled == true
  
  msg = sprintf(`
    """
    [CP-9 | Information System Backup] (TODO: Link to docs)
    SQLInstance %v does not have backup enabled.
    
    Remediation: 'spec.settings.backupConfiguration.enabled': true.
    """
    `,
    [input.metadata.name])
}
