variable "listen" {
  description = "Grants listen access to this this Authorization Rule. Defaults to false."
  type        = bool
  default     = false
}

variable "manage" {
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false."
  type        = bool
  default     = false
}

variable "name" {
  description = "Specifies the name of the Authorization Rule. Changing this forces a new resource to be created."
  type        = string
}

variable "namespace_name" {
  description = "Specifies the name of the Event Hub Namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Event Hub Namespace exists. Changing this forces a new resource to be created."
  type        = string
}

variable "send" {
  description = "Grants send access to this this Authorization Rule. Defaults to false."
  type        = bool
  default     = false
}
