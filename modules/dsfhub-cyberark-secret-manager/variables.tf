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
  description = "Specifies the auth mechanism used by the connection. Currently only 'default' is supported for CyberArk."
  type        = string
  default     = null
  validation {
    condition     = var.auth_mechanism == null || var.auth_mechanism == "default"
    error_message = "Invalid authentication mechanism. Currently only 'default' is supported for CyberArk."
  }
}

variable "ca_certs_path" {
  description = "Path to the RootCA cert."
  type        = string
  default     = null
}

variable "cert_file" {
  description = "Certificate used for access."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "key_file" {
  description = "Path to Key used for accessing cyberark."
  type        = string
  default     = null
}

variable "protocol" {
  description = "A protocol prefix to use to connect if it isn't already specified in the host name. E.g http:// or https://."
  type        = string
  default     = null
}

variable "query" {
  description = "Query parameters defining where the passwords, etc. should be retrieved from. Example:AppID=<your_CyberArk_Application_ID>&Safe=<your_CyberArk_Safe_Name>;Folder=Root;(This is everything to be included in the curl string from Accounts? and Object= in the call to retrieve things from Cyberark.)."
  type        = string
}

variable "self_signed" {
  description = "If true, the connection will use the -k flag to accept self signed certificates. Defaults to false."
  type        = bool
  default     = false
}

variable "server_host_name" {
  description = "Hostname of the vault server. E.g. https://services-uscentral.skytap.com"
  type        = string
}

variable "server_ip" {
  description = "IP address / hostname of the vault server."
  type        = string
}

variable "server_port" {
  description = "Port that the CyberArk server listens on. Defaults to 16114 for https. Use 11535 for http."
  type        = string
  default     = "16114"
}

variable "ssl" {
  description = "Specifies whether to use SSL when connecting."
  type        = bool
  default     = null
}
