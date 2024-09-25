resource "azurerm_postgresql_flexible_server" "this" {
  lifecycle {
    ignore_changes = [zone]
  }

  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password
  create_mode                   = "Default"
  location                      = var.location
  name                          = var.name
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  storage_tier                  = var.storage_tier
  tags                          = var.tags
  version                       = var.postgres_version
}
