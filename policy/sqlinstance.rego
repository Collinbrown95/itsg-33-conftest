package main

deny_sqlinstance_backup_disabled[msg] {
  input.kind == "SQLInstance"
  input.spec.settings.backupConfiguration.enabled != true
  msg = sprintf("ALB `%v` is using HTTP rather than HTTPS", [input.kind])
}