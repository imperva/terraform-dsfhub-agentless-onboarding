# GCS bucket
module "gcs-bucket" {
  source = "../google-storage-bucket"

  force_destroy = var.bucket_force_destroy
  location      = var.bucket_location
  name          = var.bucket_name
  project       = var.bucket_project
  storage_class = var.bucket_storage_class
}

# GCP CLOUD STORAGE BUCKET asset
module "gcp-cloud-storage-bucket-asset" {
  source = "../dsfhub-gcp-cloud-storage-bucket"

  admin_email        = var.gcp_cloud_storage_bucket_admin_email
  asset_display_name = module.gcs-bucket.this.name
  asset_id           = "${module.gcs-bucket.this.project}:${module.gcs-bucket.this.name}"
  audit_pull_enabled = var.gcp_cloud_storage_bucket_audit_pull_enabled
  audit_data_type    = var.gcp_cloud_storage_bucket_audit_data_type
  audit_type         = var.gcp_cloud_storage_bucket_audit_type
  content_type       = var.gcp_cloud_storage_bucket_content_type
  gateway_id         = var.gcp_cloud_storage_bucket_gateway_id
  parent_asset_id    = var.gcp_cloud_storage_bucket_parent_asset_id
}
