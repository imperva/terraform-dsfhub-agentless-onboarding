resource "azurerm_mssql_managed_instance" "this" {
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  license_type                 = var.license_type
  location                     = var.location
  name                         = var.name
  public_data_endpoint_enabled = var.public_data_endpoint_enabled
  resource_group_name          = var.resource_group_name
  sku_name                     = var.sku_name
  storage_size_in_gb           = var.storage_size_in_gb
  subnet_id                    = var.subnet_id
  vcores                       = var.vcores
  tags                         = var.tags
}
