variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "subnets" {
  description = <<EOF
  A list of subnet objects as defined below.
  
  subnet:
  - address_prefixes: A list of address prefixes to use for the subnet
  - default_outbound_access_enabled: (Optional) Enable default outbound access to the internet for the subnet. Defaults to true.
  - name: The name of the subnet
  - route_table_id: (Optional) The ID of the Route Table that should be associated with this subnet.
  - security_group: (Optional) The Network Security Group to associate with the subnet. (Referenced by id, ie. azurerm_network_security_group.example.id)
  - delegation: (Optional) One or more delegation blocks as defined below.

  delegation:
  - name: A name for this delegation.
  - service_delegation: A service_delegation block as defined below.

  service_delegation:
  - name: The name of service to delegate to.
  - actions: (Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. See the [azure documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_delegation) for the full list of possible values.
  EOF
  type = list(
    object(
      {
        address_prefixes                = list(string),
        default_outbound_access_enabled = optional(bool, true)
        name                            = string
        route_table_id                  = optional(string)
        security_group                  = optional(string)

        delegation = optional(list(
          object(
            {
              name = string

              service_delegation = optional(list(
                object(
                  {
                    name    = string
                    actions = optional(list(string))
                  }
                )
              ))
            }
          )
        ))
      }
    )
  )
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
