resource "azurerm_eventhub" "this" {
  message_retention   = var.message_retention
  name                = var.name
  namespace_name      = var.namespace_name
  partition_count     = var.partition_count
  resource_group_name = var.resource_group_name
  status              = var.status
}
