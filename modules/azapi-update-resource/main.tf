terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}

resource "azapi_update_resource" "this" {
  body        = var.body
  resource_id = var.resource_id
  type        = var.type
}
