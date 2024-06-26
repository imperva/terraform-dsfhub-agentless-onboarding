variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:iam::1234567890\""
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection for the account asset"
  type        = string
  default     = "default"
  validation {
    condition     = contains(["key", "profile", "default", "iam_role"], var.auth_mechanism)
    error_message = "Invalid auth mechanism. Pick either key, profile, default or iam_role."
  }
}

variable "aws_access_key" {
  description = "AWS Access ID"
  type        = string
  default     = null
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "profile_name" {
  description = "The name of a profile in /install_dir/jsonar/local/credentials/.aws/credentials to use for authenticating"
  type        = string
  default     = null
}

variable "region" {
  description = "Default AWS region of the account"
  type = string 
}
