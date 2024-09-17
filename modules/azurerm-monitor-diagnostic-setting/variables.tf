variable "enabled_log" {
  description = "Map of categories/category groups to be enabled in the diagnostic setting. Only one of category and category_group can be specified per block."
  type = list(
    object(
      {
        category       = optional(string)
        category_group = optional(string)
      }
    )
  )
  default = null
}

variable "eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. "
  type        = string
  default     = null
}

variable "eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "metric" {
  description = "Map of metric categories to be enabled in the diagnostic setting."
  type = list(
    object(
      {
        category = string
        enabled  = optional(bool, true)
      }
    )
  )
  default = null
}

variable "name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where logs should be sent. "
  type        = string
  default     = null
}

variable "target_resource_id" {
  description = "The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created."
  type        = string
}
