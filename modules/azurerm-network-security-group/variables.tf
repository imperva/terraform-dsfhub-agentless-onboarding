variable "name" {
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created. "
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = string
}

variable "security_rules" {
  description = "List of security_rule objects representing security rules, see the [azurerm documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group#security_rule) for more details."
  type = list(
    object(
      {
        access                       = string
        description                  = optional(string)
        destination_address_prefix   = optional(string)
        destination_address_prefixes = optional(list(string))
        destination_port_range       = optional(string)
        destination_port_ranges      = optional(list(string))
        direction                    = string
        name                         = string
        priority                     = number
        protocol                     = string
        source_address_prefix        = optional(string)
        source_address_prefixes      = optional(list(string))
        source_port_range            = optional(string)
        source_port_ranges           = optional(list(string))

      }
    )
  )
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

