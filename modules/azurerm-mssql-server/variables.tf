variable "administrator_login" {
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created."
  type        = string
  default     = "12.0"
  validation {
    condition     = contains(["2.0", "12.0"], var.server_version)
    error_message = "Invalid version. Valid options 2.0 (for v11 server) and 12.0 (for v12 server)."
  }
}
