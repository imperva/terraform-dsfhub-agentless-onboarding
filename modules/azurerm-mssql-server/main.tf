resource "azurerm_mssql_server" "this" {
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  location                      = var.location
  name                          = var.name
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  tags                          = var.tags
  version                       = var.server_version # version is special keyword for modules
}
