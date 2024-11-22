output "gcp-ms-sql-server-instance" {
  description = "Google Cloud SQL for SQL Server instance."
  value       = module.gcp-ms-sql-server-instance.this
}

output "gcp-ms-sql-server-asset" {
  description = "GCP MS SQL SERVER asset."
  value       = module.gcp-ms-sql-server-asset.this
}

output "service-account-permissions" {
  description = "Permissions granted to the SQL Server service account."
  value       = google_storage_bucket_iam_member.this
}
