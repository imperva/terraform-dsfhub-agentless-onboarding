resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  lifecycle {
    # precondition {
    #   condition = (
    #     var.listen != null ||
    #     var.manage != null ||
    #     var.send != null
    #   )
    #   error_message = "Atleast one of listen, send, manage needs to be set."
    # }

    precondition {
      condition     = var.manage == true ? (var.listen == true && var.send == true) : true
      error_message = "When manage is set to true, both listen and send must be too."
    }
  }

  listen              = var.listen
  manage              = var.manage
  name                = var.name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  send                = var.send
}
