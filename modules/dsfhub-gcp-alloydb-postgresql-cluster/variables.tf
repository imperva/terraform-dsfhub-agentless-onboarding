variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier for the AlloyDB for PostgreSQL database service in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  type        = string
  # validation {
  #   condition     = can(regex("projects/.+/locations/.+/clusters/.+/instances/.+", var.asset_id))
  #   error_message = "Invalid asset ID. Must be in the form 'projects/<project>/locations/<location>/clusters/<cluster_id>/instances/<instance_id>'."
  # }
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "cluster_id" {
  description = "The name of the AlloyDB for PostgreSQL cluster"
  type        = string
}

variable "cluster_member_id" {
  description = "The name of the AlloyDB for PostgreSQL cluster member"
  type        = string
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

variable "server_host_name" {
  description = "Hostname of the AlloyDB for PostgreSQL instance."
  type        = string
}

variable "server_ip" {
  description = "IP address / hostname of the AlloyDB for PostgreSQL instance."
  type        = string
}

variable "server_port" {
  description = "Port that the AlloyDB for PostgreSQL instance listens on."
  type        = string
  default     = "5432"
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      var.auth_mechanism == null ||
      can(contains(["password"], var.auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password"
  }
}

variable "password" {
  description = "Password to use to connect to the AlloyDB for PostgreSQL instance."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "username" {
  description = "Username of AlloyDB for PostgreSQL database user to connect with."
  type        = string
  default     = null
}
