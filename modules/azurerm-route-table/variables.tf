variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the route table. Changing this forces a new resource to be created. "
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "route" {
  description = "A list of route objects. See the [azure documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) for more details."
  type = list(
    object(
      {
        name                   = string
        address_prefix         = string
        next_hop_type          = string
        next_hop_in_ip_address = optional(string)
      }
    )
  )
  default = null
}
