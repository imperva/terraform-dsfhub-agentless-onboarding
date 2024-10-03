resource "azurerm_virtual_network" "this" {
  address_space       = var.address_space
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "subnet" {
    # If subnet is not defined, do not create
    for_each = var.subnets != null ? var.subnets : []

    content {
      address_prefixes                = subnet.value.address_prefixes
      default_outbound_access_enabled = subnet.value.default_outbound_access_enabled
      name                            = subnet.value.name
      route_table_id                  = subnet.value.route_table_id
      security_group                  = subnet.value.security_group

      dynamic "delegation" {
        # If delegation is not defined, do not create
        for_each = subnet.value.delegation != null ? subnet.value.delegation : []

        content {
          name = delegation.value.name

          dynamic "service_delegation" {
            # If service_delegation is not defined, do not create
            for_each = delegation.value.service_delegation != null ? delegation.value.service_delegation : []

            content {
              name    = service_delegation.value.name
              actions = service_delegation.value.actions
            }
          }
        }
      }

    }
  }
}
