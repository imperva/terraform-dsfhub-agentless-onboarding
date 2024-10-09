variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier of the GCP account in the form '<service account email>:<default project ID>' (e.g. my-service-account-name@my-project-id.iam.gserviceaccount.com:default-project-id-for-this-asset)."
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Supported values: default, service_account."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["default", "service_account"], var.auth_mechanism)
    error_message = "Invalid authentication mechanism. Supported values: default, service_account."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "key_file" {
  description = "Path to JSON file with credentials info (service account's key) residing on your Agentless Gateway. File must be accessible by the sonarw OS user. Required when auth_mechanism is set to 'service_account'."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}
