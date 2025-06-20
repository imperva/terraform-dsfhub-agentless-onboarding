output "postgresql-server" {
  description = "Azure PostgreSQL Flexible server."
  value       = module.azure-postgresql-flexible-server.this
}

output "azure-postgresql-flexible-firewall-rules" {
  description = "Azure PostgreSQL Flexible Server Firewall Rules."
  value       = values(azurerm_postgresql_flexible_server_firewall_rule.this).*
}

output "postgresql-server-configurations" {
  description = "Azure PostgreSQL Flexible server configurations."
  value       = values(azurerm_postgresql_flexible_server_configuration.this).*
}

output "postgresql-diagnostic-setting" {
  description = "Diagnostic setting."
  value       = module.postgresql-diagnostic-setting.this
}

output "azure-postgresql-flexible-asset" {
  description = "AZURE POSTGRESQL FLEXIBLE asset."
  value       = module.azure-postgresql-flexible-asset.this
}
