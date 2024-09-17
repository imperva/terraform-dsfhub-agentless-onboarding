resource "azurerm_mssql_server_extended_auditing_policy" "this" {
  enabled                         = var.enabled
  retention_in_days               = var.retention_in_days
  server_id                       = var.server_id
  storage_account_access_key      = var.storage_account_access_key
  storage_account_subscription_id = var.storage_account_subscription_id
  storage_endpoint                = var.storage_endpoint
}
