resource "azurerm_mssql_database_extended_auditing_policy" "this" {
  database_id                = var.database_id
  enabled                    = var.enabled
  storage_account_access_key = var.storage_account_access_key
  storage_endpoint           = var.storage_endpoint
  retention_in_days          = var.retention_in_days
}
