output "mysql-server" {
  description = "Azure MySQL Flexible server."
  value       = module.azure-mysql-flexible-server.this
}

output "mysql-server-configurations" {
  description = "Azure MySQL Flexible server configurations."
  value       = values(azurerm_mysql_flexible_server_configuration.this).*
}

output "mysql-diagnostic-setting" {
  description = "Diagnostic setting."
  value       = module.mysql-diagnostic-setting.this
}

output "azure-mysql-flexible-asset" {
  description = "AZURE MYSQL FLEXIBLE asset."
  value       = module.azure-mysql-flexible-asset.this
}
