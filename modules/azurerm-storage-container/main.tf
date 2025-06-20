resource "azurerm_storage_container" "this" {
  container_access_type = var.container_access_type
  name                  = var.name
  storage_account_id    = var.storage_account_id
}
