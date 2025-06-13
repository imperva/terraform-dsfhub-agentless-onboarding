resource "azurerm_mysql_flexible_server" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  create_mode            = "Default"
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  public_network_access  = var.public_network_access
  sku_name               = var.sku_name
  version                = var.mysql_version
  tags                   = var.tags

  storage {
    auto_grow_enabled   = var.storage_auto_grow_enabled
    io_scaling_enabled  = var.storage_io_scaling_enabled
    iops                = var.storage_io_scaling_enabled ? null : var.storage_iops
    log_on_disk_enabled = var.storage_log_on_disk_enabled
    size_gb             = var.storage_size_gb
  }
}
