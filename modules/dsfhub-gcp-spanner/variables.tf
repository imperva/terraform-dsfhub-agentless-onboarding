variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier for the Spanner instance in the form '{project-id}:{instance-name}'."
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "duration_threshold" {
  description = "How long (in milliseconds) a query's execution may take until it is flagged as slow."
  type        = number
  default     = null
  validation {
    condition     = var.duration_threshold == null ? true : var.duration_threshold >= 0
    error_message = "The duration_threshold must be a non-negative number."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
  default     = null
  validation {
    condition     = can(regex("projects/.+/subscriptions/.+", var.logs_destination_asset_id))
    error_message = "Invalid pubsub subscription ID. Must be in the form 'projects/{{project}}/subscriptions/{{name}}'."
  }
}

variable "parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "GCP Spanner instance ID"
  type        = string
}

variable "server_ip" {
  description = "GCP Spanner instance ID"
  type        = string
}
