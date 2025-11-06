variable "bucket_force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. Defaults to false."
  type        = bool
  default     = false
}

variable "bucket_location" {
  description = "The [GCS location](https://cloud.google.com/storage/docs/locations)."
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "bucket_project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "bucket_storage_class" {
  description = "The [Storage Class](https://cloud.google.com/storage/docs/storage-classes) of the new bucket."
  type        = string
  default     = "STANDARD"
}

variable "gcp_cloud_storage_bucket_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "gcp_cloud_storage_bucket_audit_data_type" {
  description = "The type of audit data to pull from the bucket. Relevant for audit_types PUBSUB and PUBSUB_SLOW. Accepted values are: ALLOYDB_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL_SLOW_QUERY, SPANNER."
  type        = string
  default     = null
  validation {
    condition     = var.gcp_cloud_storage_bucket_audit_data_type == null || can(regex("^(ALLOYDB_POSTGRESQL|POSTGRESQL|BIGTABLE|BIGQUERY|MSSQL|MYSQL|MYSQL_SLOW_QUERY|SPANNER)$", var.gcp_cloud_storage_bucket_audit_data_type))
    error_message = "Invalid gcp_cloud_storage_bucket_audit_data_type. Value must be one of: ALLOYDB_POSTGRESQL, POSTGRESQL, BIGTABLE, BIGQUERY, MSSQL, MYSQL, MYSQL_SLOW_QUERY, SPANNER."
  }
}

variable "gcp_cloud_storage_bucket_audit_type" {
  description = "Defines the type of audit used by DSF. In this case, where the audit files are stored. Accepted values are: PUBSUB, PUBSUB_SLOW, BUCKET. Defaults to BUCKET."
  type        = string
  default     = "BUCKET"
  validation {
    condition     = can(regex("^(PUBSUB|PUBSUB_SLOW|BUCKET)$", var.gcp_cloud_storage_bucket_audit_type))
    error_message = "Invalid gcp_cloud_storage_bucket_audit_type. Value must be one of: PUBSUB, PUBSUB_SLOW, BUCKET."
  }
}

variable "gcp_cloud_storage_bucket_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = null
}

variable "gcp_cloud_storage_bucket_content_type" {
  description = "Content type should be set to the desired <'parent' asset \"Server Type\">, which is the one that uses this asset as a destination for logs."
  type        = string
  default     = null
  validation {
    condition     = var.gcp_cloud_storage_bucket_content_type == null || can(regex("^(GCP MYSQL|GCP POSTGRESQL|GCP BIGTABLE|GCP BIGQUERY|GCP MS SQL SERVER|GCP SPANNER|GCP ALLOYDB POSTGRESQL)$", var.gcp_cloud_storage_bucket_content_type))
    error_message = "Invalid gcp_cloud_storage_bucket_content_type. Value must be one of: GCP MYSQL, GCP POSTGRESQL, GCP BIGTABLE, GCP BIGQUERY, GCP MS SQL SERVER, GCP SPANNER, GCP ALLOYDB POSTGRESQL."
  }
}

variable "gcp_cloud_storage_bucket_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "gcp_cloud_storage_bucket_parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}
