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

variable "gcp_cloud_storage_bucket_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = null
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
