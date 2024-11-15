variable "authorized_networks" {
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
  default = null
}

variable "database_flags" {
  description = "List of database flags to assign to the instance."
  type = list(
    object(
      {
        name  = string
        value = string
      }
    )
  )
  default = null
}

variable "database_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use. The full list of supported versions can be found at https://cloud.google.com/sql/docs/db-versions."
  type        = string
  validation {
    condition = (
      startswith(var.database_version, "MYSQL_") ||
      startswith(var.database_version, "POSTGRES_") ||
      startswith(var.database_version, "SQLSERVER_")
    )
    error_message = "Invalid database version. See https://cloud.google.com/sql/docs/db-versions for supported versions."
  }
}

variable "deletion_protection" {
  description = "Whether Terraform will be prevented from destroying the instance. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the instance will fail. When the field is set to false, deleting the instance is allowed."
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the instance."
  type        = string
}

variable "project" {
  description = "The ID of the project that the service account will be created in."
  type        = string
  default     = null
}

variable "region" {
  description = "The region the instance will sit in. If a region is not provided in the resource definition, the provider region will be used instead."
  type        = string
  default     = null
}

variable "root_password" {
  description = "Initial root password. Can be updated. Required for MS SQL Server."
  type        = string
  default     = null
}

variable "sql_server_audit_config" {
  description = <<EOF
  A block describing a SQL Server audit configuration as described below.

  - bucket: (Optional) The name of the destination bucket (e.g., gs://mybucket).
  - upload_interval: (Optional) How often to upload generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
  - retention_interval: (Optional) How long to keep generated audit files. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
  EOF
  type = object({
    bucket             = optional(string)
    upload_interval    = optional(string)
    retention_interval = optional(string)
  })
  default = null
}

variable "tier" {
  description = "The machine type to use. See [tiers](https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers) for more details and supported versions"
  type        = string
  default     = "db-f1-micro"
}
