variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Alibaba ARN, e.g. \"arn:acs:123456789012\""
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection for the account asset"
  type        = string
  default     = "default"
  validation {
    condition     = contains(["machine_role", "key"], var.auth_mechanism)
    error_message = "Invalid auth mechanism. Pick either key or machine_role."
  }
}

variable "access_id" {
  description = "Access key ID"
  type        = string
  default     = null
}

variable "access_key" {
  description = "Access key secret"
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "region" {
  description = "Default Alibaba region of the account"
  type        = string
}

variable "role_name" {
  description = "What role is used to get credentials from. Defaults to the current machine's role"
  type        = string
  default     = null
}
