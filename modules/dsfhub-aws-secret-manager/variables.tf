variable "access_id" {
  description = "AWS Access ID"
  type        = string
  default     = null
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = null
}

variable "admin_email" {
  description = "The email address to notify about the asset."
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
  default     = null
  validation {
    condition     = contains(["key", "profile", "default", "iam_role"], var.auth_mechanism)
    error_message = "Invalid auth mechanism. Pick either key, profile, default or iam_role."
  }
}

variable "available_regions" {
  description = "A list of regions to use in discovery actions that iterate through regions."
  type        = list(string)
  default     = null
}

variable "credentials_endpoint" {
  description = "A specific STS endpoint to use."
  type        = string
  default     = null
}

variable "ca_certs_path" {
  description = "Certificate authority certificates path; what location should the sysetm look for certificate information from. Equivalent to --capath in a curl call."
  type        = string
  default     = null
}

variable "external_id" {
  description = "The external ID to be used when assuming roles in the target account."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "http" {
  description = "HTTP proxy endpoint to use for AWS proxy config calls."
  type        = string
  default     = null
}

variable "https" {
  description = "HTTPS proxy endpoint to use for AWS proxy config calls."
  type        = string
  default     = null
}

variable "logs" {
  description = "Logs service endpoint to use for AWS calls."
  type        = string
  default     = null
}

variable "profile_name" {
  description = "The name of a profile in /path/to/JSONAR_LOCALDIR/credentials/.aws/credentials to use for authentication"
  type        = string
  default     = null
}

variable "proxy" {
  description = "Proxy to use for AWS calls if aws_proxy_config is populated the proxy field will get populated from the http value there."
  type        = string
  default     = null
}

variable "region" {
  description = "Default AWS region of the account"
  type        = string
}

variable "session_token" {
  description = "STS token used for session authentication."
  type        = string
  default     = null
}

variable "ssl" {
  description = "Specifies whether to use SSL when connecting."
  type        = bool
  default     = null
}
