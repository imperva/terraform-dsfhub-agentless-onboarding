variable "database_id" {
  description = "The ID of the SQL database to set the extended auditing policy. Changing this forces a new resource to be created."
  type        = string
}

variable "enabled" {
  description = "Whether to enable the extended auditing policy. Defaults to true."
  type        = bool
  default     = true
}

variable "retention_in_days" {
  description = "The number of days to retain logs for in the storage account."
  type        = number
  default     = null
}

variable "storage_account_access_key" {
  description = "The access key to use for the auditing storage account."
  type        = string
  default     = null
}

variable "storage_account_subscription_id" {
  description = "The ID of the Subscription containing the Storage Account."
  type        = string
  default     = null
}

variable "storage_endpoint" {
  description = "The blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all extended auditing logs."
  type        = string
  default     = null
}