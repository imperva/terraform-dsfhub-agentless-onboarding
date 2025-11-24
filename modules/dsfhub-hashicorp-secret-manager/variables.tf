variable "access_id" {
  description = "Used for the iam_role auth_mechanism, it is the AWS access key."
  type        = string
  default     = null
}

variable "aws_iam_server_id" {
  description = "The server ID of the AWS IAM server. E.g. vault.example.com"
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
  description = "Unique identifier of the asset."
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Supported values: root_token, ec2, iam_role, app_role. Defaults to iam_role."
  type        = string
  default     = null
  validation {
    condition     = contains(["root_token", "ec2", "iam_role", "app_role"], var.auth_mechanism)
    error_message = "Invalid authentication mechanism. Supported values: root_token, ec2, iam_role, app_role."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "headers" {
  description = "Additional parameters to pass as HTTP headers. Separate with commas. Do not use quotation marks. Example_value='TEST-HEADER1: test1, TEST-HEADER2: test2'."
  type        = list(string)
  default     = null
}

variable "namespace" {
  description = "Specifies which namespace to fetch credentials from if not root."
  type        = string
  default     = null
}

variable "nonce" {
  description = "Stored nonce, automatically added from first call if not already generated."
  type        = string
  default     = null
}

variable "protocol" {
  description = "Protocol used to connect to the vault server Default is 'http://'."
  type        = string
  default     = null
}

variable "role_name" {
  description = "The HashiCorp role used for logging into the vault. This is used for the ec2, iam_role and app_role auth_mechanisms."
  type        = string
  default     = null
}

variable "secret_key" {
  description = "For the root_token auth_mechanism, it is the vault token. For the iam_role auth_mechanism, it is the AWS secret. Otherwise, it is the secret access key used to authenticate."
  type        = string
  default     = null
}

variable "self_signed" {
  description = "If true, the SSL certificate is self-signed. Defaults to false."
  type        = bool
  default     = false
}

variable "server_host_name" {
  description = "Hostname of the vault server."
  type        = string
}

variable "server_ip" {
  description = "IP address / hostname of the vault server."
  type        = string
}

variable "server_port" {
  description = "Port that the vault server listens on. Defaults to 8200."
  type        = string
  default     = "8200"
}

variable "ssl" {
  description = "Specifies whether to use SSL when connecting."
  type        = bool
  default     = null
}

variable "store_aws_credentials" {
  description = "Is this connection used with the HashiCorp AWS integration (Dynamic Secret) to generate temporary key pairs for this system to use. Also set to True if using HashiCorp Dynamic."
  type        = bool
  default     = null
}

variable "v2_key_engine" {
  description = "Indicates whether the HashiCorp Key/Value (KV) version 2 secrets engine is used."
  type        = bool
  default     = null
}
