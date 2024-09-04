resource "azurerm_eventhub_namespace" "this" {
  capacity                      = var.capacity
  location                      = var.location
  name                          = var.name
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  tags                          = var.tags
}
