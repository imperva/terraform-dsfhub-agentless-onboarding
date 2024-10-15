variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier for the BigQuery service in the form 'projects/{{project}}/bigquery'."
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "pubsub_subscription" {
  description = "ID of the Google PubSub Subscription containing the BigQuery audit logs in the form 'projects/{{project}}/subscriptions/{{name}}'."
  type        = string
  validation {
    condition     = can(regex("projects/.+/subscriptions/.+", var.pubsub_subscription))
    error_message = "Invalid pubsub subscription ID. Must be in the form 'projects/{{project}}/subscriptions/{{name}}'."
  }
}