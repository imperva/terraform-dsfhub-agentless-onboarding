variable "gcp_mysql_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_mysql_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "gcp_mysql_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_mysql_logs_destination_asset_id" {
  description = "The asset_id of the GCP PUSUB asset that this asset is sending its audit logs to."
  type        = string
}

variable "gcp_mysql_parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "instance_authorized_networks" {
  description = <<EOF
  A list of authorized network blocks as defined below.

  authorized_network:
  - expiration_time: (Optional) The RFC 3339 formatted date time string indicating when this whitelist expires.
  - name: (Optional) A name for this whitelist entry.
  - value: A CIDR notation IPv4 or IPv6 address that is allowed to access this instance.
  EOF
  type = list(
    object(
      {
        expiration_time = optional(string)
        name            = optional(string)
        value           = string
      }
    )
  )
}

variable "instance_database_flags" {
  description = "List of database flags to assign to the instance."
  type = list(
    object(
      {
        name  = string
        value = string
      }
    )
  )
  default = [
    {
      name  = "log_output"
      value = "FILE"
    },
    {
      name  = "general_log"
      value = "on"
    }
  ]
}

variable "instance_database_version" {
  description = "The MySQL version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions."
  type        = string
  default     = "MYSQL_8_0"
  validation {
    condition = (
      startswith(var.instance_database_version, "MYSQL_")
    )
    error_message = "Invalid database version. See https://cloud.google.com/sql/docs/db-versions for supported versions."
  }
}

variable "instance_deletion_protection" {
  description = "Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed."
  type        = bool
  default     = false
}

variable "instance_name" {
  description = "The name of the instance."
  type        = string
}

variable "instance_project" {
  description = "The ID of the project that the service account will be created in."
  type        = string
  default     = null
}

variable "instance_region" {
  description = "The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead."
  type        = string
  default     = null
}

variable "instance_tier" {
  description = "The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions"
  type        = string
  default     = "db-f1-micro"
}
