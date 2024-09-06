output "sql-server-instance" {
  description = "Azure SQL Server instance."
  value       = module.sql-server-instance.this
}

output "sql-server-extended-server-audit-policy" {
  description = "Azure MS SQL Server Extended Auditing Policy."
  value       = module.sql-server-extended-server-audit-policy.this
}

output "sql-server-diagnostic-setting" {
  description = "Diagnostic Setting."
  value       = module.sql-server-diagnostic-setting.this
}

output "azure-ms-sql-server-asset" {
  description = "AZURE MS SQL SERVER asset."
  value       = module.azure-ms-sql-server-asset.this
}

output "azure-eventhub-asset" {
  description = "AZURE EVENTHUB asset."
  value       = module.azure-eventhub-asset.this
}