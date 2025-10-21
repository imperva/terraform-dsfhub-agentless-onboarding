variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier for the Cloud Storage Bucket in the form '{project-id}:{bucket-name}'."
  type        = string
}

variable "audit_data_type" {
  description = "The type of audit data to pull from the bucket. Relevant for audit_types PUBSUB and PUBSUB_SLOW. Accepted values are: ALLOYDB_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL_SLOW_QUERY, SPANNER."
  type        = string
  default     = null
  validation {
    condition     = var.audit_data_type == null || can(regex("^(ALLOYDB_POSTGRESQL|POSTGRESQL|BIGTABLE|BIGQUERY|MSSQL|MYSQL|MYSQL_SLOW_QUERY|SPANNER)$", var.audit_data_type))
    error_message = "Invalid audit_data_type. Value must be one of: ALLOYDB_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL_SLOW_QUERY, SPANNER."
  }
}

variable "audit_type" {
  description = "Defines the type of audit used by DSF. In this case, where the audit files are stored. Accepted values are: PUBSUB, PUBSUB_SLOW, BUCKET. Defaults to BUCKET."
  type        = string
  default     = "BUCKET"
  validation {
    condition     = can(regex("^(PUBSUB|PUBSUB_SLOW|BUCKET)$", var.audit_type))
    error_message = "Invalid audit_type. Value must be one of: PUBSUB, PUBSUB_SLOW, BUCKET."
  }
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "content_type" {
  description = "Content type should be set to the desired <'parent' asset \"Server Type\">, which is the one that uses this asset as a destination for logs."
  type        = string
  default     = null
  validation {
    condition     = var.content_type == null || can(regex("^(GCP MYSQL|GCP POSTGRESQL|GCP BIGTABLE|GCP BIGQUERY|GCP MS SQL SERVER|GCP SPANNER|GCP ALLOYDB POSTGRESQL)$", var.content_type))
    error_message = "Invalid content_type. Value must be one of: GCP MYSQL, GCP POSTGRESQL, GCP BIGTABLE, GCP BIGQUERY, GCP MS SQL SERVER, GCP SPANNER, GCP ALLOYDB POSTGRESQL."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}
