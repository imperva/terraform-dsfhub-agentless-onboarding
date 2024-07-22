variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:rds:us-east-2:123456790:cluster:db-name\""
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      # auth_mechanism can either be null, or one of the supported values
      var.auth_mechanism == null ||
      can(contains(["password"], var.auth_mechanism))
    )
    error_message = "Incorrect auth_mechanism. Supported auth_mechanisms: password."
  }
}

variable "parent_asset_id" {
  description = "The asset_id of the cloud account with auth-mech such as key-pair, iam-role etc."
  type        = string
}

variable "region" {
  description = "AWS region containing the cluster."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "Endpoint URL"
  type        = string
  default     = null
}

variable "server_port" {
  description = "Port of the cluster for connection"
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "username" {
  description = "Username to use to connect to the cluster."
  type        = string
  default     = null
}

variable "password" {
  description = "User's password"
  type        = string
  default     = null
}
