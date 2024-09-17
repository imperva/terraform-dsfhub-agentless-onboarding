variable "message_retention" {
  description = "Specifies the number of days to retain the events for this Event Hub. Defaults to 1."
  type        = number
  default     = 1
}

variable "name" {
  description = "Specifies the name of the Event Hub resource. Changing this forces a new resource to be created."
  type        = string
}

variable "namespace_name" {
  description = "Specifies the name of the Event Hub Namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "partition_count" {
  description = "Specifies the current number of shards on the Event Hub. Note: partition_count cannot be changed unless Eventhub Namespace SKU is Premium and cannot be decreased. Defaults to 1."
  type        = number
  default     = 1
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Event Hub's parent Namespace exists. Changing this forces a new resource to be created."
  type        = string
}

variable "status" {
  description = "Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active."
  type        = string
  default     = "Active"
  validation {
    condition     = contains(["Active", "Disabled", "SendDisabled"], var.status)
    error_message = "Invalid sku. Possible values are Active, Disabled and SendDisabled."
  }
}
