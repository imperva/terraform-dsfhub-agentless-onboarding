output "gcs-bucket" {
  description = "Google Cloud Storage Service bucket."
  value       = module.gcs-bucket.this
}

output "gcp-cloud-storage-bucket-asset" {
  description = "GCP CLOUD STORAGE BUCKET asset."
  value       = module.gcp-cloud-storage-bucket-asset.this
}
