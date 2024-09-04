variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "application_id" {
  description = "This is also referred to as the Client ID and it’s the unique identifier for the registered application being used to execute Python SDK commands against Azure’s API services. You can find this number under Azure Active Directory -> App Registrations -> Owned Applications."
  type        = string
  default     = null
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier of the Azure account. The following format is a suggestion that guarantees the uniqueness and identifiability between AZURE assets using different application/resource groups: /directory_id/<directory_id>/subscription_id/<subscription_id>/<resource group name>/application_id/<application_id>"
  type        = string
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection. Supported values: auth_file, client_secret, managed_identity."
  type        = string
  default     = null
  validation {
    condition     = contains(["auth_file", "client_secret", "managed_identity"], var.auth_mechanism)
    error_message = "Invalid authentication mechanism. Supported values: auth_file, client_secret, managed_identity."
  }
}

variable "client_secret" {
  description = "This a string containing a secret used by the application to prove its identity when requesting a token. You can get a secret by going to Azure Active Directory -> App Registrations -> Owned Applications, selecting the desired application and then going to Certificates & secrets -> Client secrets -> + New client secret."
  type        = string
  default     = null
}

variable "directory_id" {
  description = "This is also referred to as the Tenant ID and is a GUID representing the Active Directory Tenant. It can be found in the Azure Active Directory page under the Azure portal."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "key_file" {
  description = "Path to JSON file with credentials info residing on your Agentless Gateway. File must be accessible by the sonarw OS user."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  default     = null
}
