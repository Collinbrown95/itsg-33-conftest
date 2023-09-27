package config_connector.cp_9.sqlinstance

deny_sqlinstance_backup_disabled[msg] {
  # There exists some `i`  
  some i
  # Such that the `i`th resource is a SQLInstance manifest
  input[i].contents.kind == "SQLInstance"
  # And it is not the case that its backup configuration is enabled
  not input[i].contents.spec.settings.backupConfiguration.enabled == true
  
  # Error message with remediation
  msg = "Backup is disabled. Remediation: set `spec.settings.backupConfiguration.enabled: true`"
}
