variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "The Azure resource ID of the Azure CosmosDB account."
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
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "Azure CosmosDB account endpoint."
  type        = string
}

variable "server_port" {
  description = "Azure CosmosDB account port."
  type        = string
}
