resource "azurerm_eventhub" "this" {
  message_retention = var.message_retention
  name              = var.name
  namespace_id      = var.namespace_id
  partition_count   = var.partition_count
  status            = var.status
}
