variable "capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Defaults to 1."
  type        = number
  default     = 1
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Is public network access enabled for the EventHub Namespace? Defaults to true."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "sku" {
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource."
  type        = string
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "Invalid sku. Valid options are Basic, Standard, and Premium."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
