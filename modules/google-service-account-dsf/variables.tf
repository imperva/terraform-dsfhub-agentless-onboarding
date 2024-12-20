variable "account_id" {
  description = "The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression '[a-z]([-a-z0-9]*[a-z0-9])' to comply with RFC1035. Changing this forces a new service account to be created."
  type        = string
  validation {
    condition = (
      length(var.account_id) >= 6 &&
      length(var.account_id) <= 30 &&
      can(regex("[a-z]([-a-z0-9]*[a-z0-9])", var.account_id))
    )
    error_message = "Invalid service account ID."
  }
}

variable "auth_mechanism" {
  description = "Authentication mechanism intended to be used by DSF to leverage this service account. Valid values are: service_account, default."
  type        = string
  default     = "service_account"
  validation {
    condition     = contains(["service_account", "default"], var.auth_mechanism)
    error_message = "Invalid service account auth_mechanism. Valid values are: service_account, default."
  }
}

variable "create_ignore_already_exists" {
  description = "If set to true, skip service account creation if a service account with the same email already exists. Defaults to false."
  type        = bool
  default     = false
}

variable "disabled" {
  description = "Whether a service account is disabled or not. Defaults to false. This field has no effect during creation. Must be set after creation to disable a service account."
  type        = bool
  default     = false
}

variable "display_name" {
  description = "The display name for the service account"
  type        = string
  default     = null
}

variable "description" {
  description = "A text description of the service account. Must be less than or equal to 256 UTF-8 bytes."
  type        = string
  default     = null
  validation {
    condition = (
      var.description == null ||
      length(var.description) <= 256
    )
    error_message = "Service account description must be less than 256 characters."
  }
}

variable "project" {
  description = "The ID of the project that the service account will be created in."
  type        = string
}

variable "project_roles" {
  description = "Roles to grant the Service Account in the specified project. Defaults to roles required for DSF to pull audit data."
  type        = list(string)
  default = [
    "roles/pubsub.subscriber",
    "roles/pubsub.viewer"
  ]
}
